import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:odekeke/Common/CommonAppBar.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(const Busmap());

class Busmap extends StatelessWidget {
  const Busmap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text('バス停を探す'), appBar: AppBar(),
      ),
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

        //↓青部分の位置を定義
        Positioned(
          bottom: 155.0,
          width: 390.0,
          height: 35.0,
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text('↓ここを押すと案内画面↓', style: TextStyle(fontSize: 20, color: Colors.white),),
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
    }
    );
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
                      zoom: 15.5,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                      },
                    markers: shops.map(
                          (selectedShop) {
                            return Marker(
                              markerId: MarkerId(selectedShop.uid),
                              infoWindow: InfoWindow(title: selectedShop.name),  //追加してみただけ
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
        return Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                onPressed: () => _openUrl(shop.url),
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: Column(
                      children: [
                        Text(shop.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white,),),
                        Text(shop.name2),
                      ],
                    ),
                  ),
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
  Shop('1',  37.5212909759392,   139.91835264189348, '会津アピオ入口','あいづあぴおいりぐち',   'https://www.google.co.jp/maps/dir//%E3%80%92965-0052+%E7%A6%8F%E5%B3%B6%E7%9C%8C%E4%BC%9A%E6%B4%A5%E8%8B%A5%E6%9D%BE%E5%B8%82%E7%94%BA%E5%8C%97%E7%94%BA%E5%A4%A7%E5%AD%97%E5%A7%8B%E5%B1%8B%E6%95%B7+%E4%BC%9A%E6%B4%A5%E3%82%A2%E3%83%94%E3%82%AA%E5%85%A5%E5%8F%A3/@37.5207369,139.9159908,16.92z/data=!4m8!4m7!1m0!1m5!1m1!1s0x5f8aacd29417ef0b:0xb70a6d2c1699143c!2m2!1d139.9182362!2d37.5206089?hl=ja'),
  Shop('2',  37.52203979323528,  139.91719392762462, '会津アピオ中央','あいづあぴおちゅうおう', 'https://www.google.co.jp/maps/dir//%E3%80%92965-0052+%E7%A6%8F%E5%B3%B6%E7%9C%8C%E4%BC%9A%E6%B4%A5%E8%8B%A5%E6%9D%BE%E5%B8%82%E7%94%BA%E5%8C%97%E7%94%BA%E5%A4%A7%E5%AD%97%E5%A7%8B%E5%B1%8B%E6%95%B7+%E4%BC%9A%E6%B4%A5%E3%82%A2%E3%83%94%E3%82%AA%E5%85%A5%E5%8F%A3/@37.5207369,139.9159908,16z/data=!4m8!4m7!1m0!1m5!1m1!1s0x5f8aacd29417ef0b:0xb70a6d2c1699143c!2m2!1d139.9182362!2d37.5206089?hl=ja'),
  Shop('3',  37.52029058809752,  139.91561474640025, '会津アピオ南口','あいづあぴおみなみぐち', 'https://www.google.com/maps/search/?api=1&query=${37.52029058809752},${139.91561474640025}'),
  Shop('4',  37.5259671970783,   139.92163358502958, '会津丸運前','あいづまるうんまえ',        'https://www.google.com/maps/search/?api=1&query=${37.5259671970783},${139.92163358502958}'),
  Shop('5',  37.51961008210341,  139.92580852090927, '荒久田','あらくだ',                   'https://www.google.com/maps/search/?api=1&query=${37.51961008210341},${139.92580852090927}'),
  Shop('6',  37.51898671455384,  139.92861545223124, '上荒久田','かみあらくだ',              'https://www.google.com/maps/search/?api=1&query=${37.51898671455384},${139.92861545223124}'),
  Shop('7',  37.5249745759622,   139.90874062847942, '上高野','かみこうや',                 'https://www.google.co.jp/maps/dir//%e3%80%92965-0077+%e7%a6%8f%e5%b3%b6%e7%9c%8c%e4%bc%9a%e6%b4%a5%e8%8b%a5%e6%9d%be%e5%b8%82%e9%ab%98%e9%87%8e%e7%94%ba%e5%a4%a7%e5%ad%97%e4%b8%8a%e9%ab%98%e9%87%8e%e6%9d%91%e5%86%85+%e4%b8%8a%e9%ab%98%e9%87%8e/@37.5204467,139.9226675,14z/data=!4m7!4m6!1m1!4e2!1m2!1m1!1s0x5f8aacd555a20247:0xb3005224cea4485c!3e0?hl=ja'),
  Shop('8',  37.54498942976063,  139.89708424641123, '上森台','かみもりだい',                'https://www.google.com/maps/search/?api=1&query=${37.54498942976063},${139.89708424641123}'),
  Shop('9',  37.54395424689345,  139.91282026175395, '木流','きながし',                     'https://www.google.com/maps/search/?api=1&query=${37.54395424689345},${139.91282026175395}'),
  Shop('10', 37.540996677896935, 139.89790826135345, '界沢','さかいざわ',                   'https://www.google.com/maps/search/?api=1&query=${37.540996677896935},${139.89790826135345}'),
  Shop('11', 37.52277136592879,  139.92378753035743, '下荒久田','しもあらくだ',              'https://www.google.com/maps/search/?api=1&query=${37.52277136592879},${139.92378753035743}'),
  Shop('12', 37.536445247194,    139.90240521600361, '下高野','しもこうや',                 'https://www.google.com/maps/search/?api=1&query=${37.536445247194},${139.90240521600361}'),
  Shop('13', 37.53813824346729,  139.8987665682193,  '十里柳','じゅうりやなぎ',              'https://www.google.com/maps/search/?api=1&query=${37.53813824346729},${139.8987665682193}'),
  Shop('14', 37.51808015731422,  139.91188325084337, '達摩','だるま',                      'https://www.google.com/maps/search/?api=1&query=${37.51808015731422},${139.91188325084337}'),
  Shop('15', 37.5358756293441,   139.9160433407291,  '鶴沼入口','つるぬまいりぐち',           'https://www.google.com/maps/search/?api=1&query=${37.5358756293441},${139.9160433407291}'),
  Shop('16', 37.51893337062692,  139.9150945924296,  '中の明','なかのみょう',                'https://www.google.com/maps/search/?api=1&query=${37.51893337062692},${139.9150945924296}'),
  Shop('17', 37.52916195683988,  139.931286285031,   '中前田','なかまえだ',                 'https://www.google.com/maps/search/?api=1&query=${37.52916195683988},${139.931286285031}'),
  Shop('18', 37.53198571795584,  139.91577611104472, '沼木','ぬまぎ',                      'https://www.google.com/maps/search/?api=1&query=${37.53198571795584},${139.91577611104472}'),
  Shop('19', 37.53076054001056,  139.91880164274676, '沼木倉庫前','ぬまぎそうこまえ',         'https://www.google.com/maps/search/?api=1&query=${37.53076054001056},${139.91880164274676}'),
  Shop('20', 37.540449887528666, 139.91408630689486, '平塚','ひらつか',                    'https://www.google.com/maps/search/?api=1&query=${37.540449887528666},${139.91408630689486}'),
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

