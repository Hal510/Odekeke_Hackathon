import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:odekeke/mewmain.dart';
import 'package:url_launcher/url_launcher.dart';



void main() => runApp(const Busmap());

class Busmap extends StatelessWidget {
  const Busmap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('バス停を探す'),centerTitle: true,
          actions: [IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp2(),
                  fullscreenDialog: true,
                ),
              );
            },
            icon: Icon(Icons.home),
          ),],
          automaticallyImplyLeading: true),

      body: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController _mapController;

  Completer<GoogleMapController> _controller = Completer();

  late LatLng _initialCameraPosition;
  late bool _loading;



  final _pageController = PageController(
    viewportFraction: 0.85,//0.85くらいで端っこに別のカードが見えてる感じになる
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _mapSection(),
        _cardSection(),
        Positioned(
          top: 550.0,
          width: 390.0,
          height: 35.0,
          child: Container(
            color: Colors.blue,
            width: 200.0,
            height: 300.0,
            child: Text(
              '               ↓ここを押すと案内画面↓',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    _getUserLocation();
  }
  String? errorTxt;

  void _getUserLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('現在地の取得はできません');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _initialCameraPosition = LatLng(position.latitude, position.longitude);
      _loading = false;
      print(position);
    });
  }

  Widget _textSection() {
    return Container(
      height: 20,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 170),
      color: Colors.blue,
      child: Text(
        '↓ここを押すと案内画面↓',
        style: TextStyle(fontSize: 20),
      ),
    );
  }


  Widget _mapSection() {
    return Scaffold(
        body: _loading
            ? CircularProgressIndicator()
            : SafeArea(
            child: Stack(
                fit: StackFit.expand,
                children: [
                  GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    padding: EdgeInsets.only(bottom: 155.0,),

                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: _initialCameraPosition,
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                    markers: shops.map(
                          (selectedShop) {
                        return Marker(
                          markerId: MarkerId(selectedShop.uid),
                          position: LatLng(selectedShop.latitude, selectedShop.longitude),
                          icon: BitmapDescriptor.defaultMarker,
                          onTap: () async {
                            //タップしたマーカー(shop)のindexを取得
                            final index = shops.indexWhere((shop) => shop == selectedShop);
                            //タップしたお店がPageViewで表示されるように飛ばす
                            _pageController.jumpToPage(index);
                          },
                        );
                      },
                    ).toSet(),
                  ),
                ]
            )
        )
    );
  }

  Widget _cardSection() {
    return Container(
      height: 148,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: PageView(
        onPageChanged: (int index) async {
          //スワイプ後のページのお店を取得
          final selectedShop = shops.elementAt(index);
          //現在のズームレベルを取得
          final zoomLevel = await _mapController.getZoomLevel();
          //スワイプ後のお店の座標までカメラを移動
          _mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(selectedShop.latitude, selectedShop.longitude),
                zoom: zoomLevel,
              ),
            ),
          );
        },
        controller: _pageController,
        children: _shopTiles(),
      ),
    );
  }

  List<Widget> _shopTiles() {
    final _shopTiles = shops.map(
          (shop) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
          ),
          onPressed: () => _openUrl(shop.url),
          child: SizedBox(
            height: 100,
            child: Center(
              child: Column(
                children: [
                  Text(shop.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),),
                  Text(shop.name2),
                ],
              ),
            ),
          ),
        );
      },
    ).toList();
    return _shopTiles;
  }
}

/// お店の情報を持つクラス。マップに表示させるために座標を持たせている
class Shop {
  String uid;
  double latitude;
  double longitude;
  String name;
  String name2;
  final url;

  Shop(this.uid, this.latitude, this.longitude, this.name, this.name2, this.url);
}


final shops = [
  Shop('1', 37.5249745759622, 139.90874062847942, '上高野','バス停１', 'https://www.google.co.jp/maps/dir//%e3%80%92965-0077+%e7%a6%8f%e5%b3%b6%e7%9c%8c%e4%bc%9a%e6%b4%a5%e8%8b%a5%e6%9d%be%e5%b8%82%e9%ab%98%e9%87%8e%e7%94%ba%e5%a4%a7%e5%ad%97%e4%b8%8a%e9%ab%98%e9%87%8e%e6%9d%91%e5%86%85+%e4%b8%8a%e9%ab%98%e9%87%8e/@37.5204467,139.9226675,14z/data=!4m7!4m6!1m1!4e2!1m2!1m1!1s0x5f8aacd555a20247:0xb3005224cea4485c!3e0?hl=ja'),
  Shop('2', 37.536445247194, 139.90240521600361, '下高野','バス停２', 'https://www.google.co.jp/maps/dir//%e3%80%92965-0078+%e7%a6%8f%e5%b3%b6%e7%9c%8c%e4%bc%9a%e6%b4%a5%e8%8b%a5%e6%9d%be%e5%b8%82%e9%ab%98%e9%87%8e%e7%94%ba%e5%a4%a7%e5%ad%97%e6%9f%b3%e5%b7%9d%e4%b8%8b%e9%ab%98%e9%87%8e+%e4%b8%8b%e9%ab%98%e9%87%8e/@37.5266428,139.9203279,13z/data=!4m7!4m6!1m1!4e2!1m2!1m1!1s0x5f8aad372e8de82b:0xc0cc86620d17c7d7!3e0?hl=ja'),
  Shop('3', 37.5215, 139.9391, 'バス停３','バス停３', 'https://www.google.co.jp/maps/dir//〒965-0077+福島県会津若松市高野町大字上高野村内+上高野/@37.5204467,139.9226675,14z/data=!4m7!4m6!1m1!4e2!1m2!1m1!1s0x5f8aacd555a20247:0xb3005224cea4485c!3e0?hl=ja'),
  Shop('4', 37.5235, 139.9391, 'バス停４','バス停４', 'https://www.google.co.jp/maps/dir//〒965-0077+福島県会津若松市高野町大字上高野村内+上高野/@37.5204467,139.9226675,14z/data=!4m7!4m6!1m1!4e2!1m2!1m1!1s0x5f8aacd555a20247:0xb3005224cea4485c!3e0?hl=ja'),
  Shop('5', 37.5225, 139.9381, 'バス停５','バス停５', 'https://www.google.co.jp/maps/dir//〒965-0077+福島県会津若松市高野町大字上高野村内+上高野/@37.5204467,139.9226675,14z/data=!4m7!4m6!1m1!4e2!1m2!1m1!1s0x5f8aacd555a20247:0xb3005224cea4485c!3e0?hl=ja'),
];


void _openUrl(url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
    );
  } else {
    throw 'このURLにはアクセスできません';
  }
}