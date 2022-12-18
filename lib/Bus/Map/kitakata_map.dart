import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../dialog_time.dart';
import './service_kitakata.dart';


class KitakataMap extends StatefulWidget {
  const KitakataMap({Key? key}) : super(key: key);

  @override
  State<KitakataMap> createState() => KitakataMapState();
}

class KitakataMapState extends State<KitakataMap> {
  late GoogleMapController _mapController;

  late LatLng _initialCameraPosition;
  late bool _loading;

  final _pageController = PageController(
    viewportFraction: 0.85,//0.85くらいで端っこに別のカードが見えてる感じになる
  );

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Set<Polyline> _lines = {};


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _mapSection(),
        _cardSection(),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: ElevatedButton.icon(
            icon: const Icon(
              Icons.timer,
              color: Colors.green,
            ),
            label: const Text('時刻表',style: TextStyle(fontSize: 25),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.green,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(
                color: Colors.black, //色
                width: 1, //太さ
              ),
            ),
            onPressed: ()  {
              showDialog<String>(
                  context: context,
                  builder: (_) {
                    return const KitakataDialogSample();
                  });
            },
          ),
        ),
        Positioned(
          bottom: 0.0,
          width: 500.0,
          height: 50.0,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.blue,
            child: const Text('↑ 　バス停までのナビはこちら 　↑', style: TextStyle(fontSize: 20, color: Colors.white),),
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
    createPolylines();
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
    //現在地を初期カメラの中心にする場合に使う
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _initialCameraPosition = LatLng(position.latitude, position.longitude);
      _loading = false;
    }
    );
  }

  Widget _mapSection() {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: _loading
            ? const CircularProgressIndicator()
            : SafeArea(
            child: Stack(
                fit: StackFit.expand,
                children: [
                  GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    padding: const EdgeInsets.only(bottom: 183.0,),
                    mapType: MapType.normal,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(37.53176054001056,  139.91880164274676),
                      zoom: 13.8,
                    ),
                    polylines: _lines,
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
  void createPolylines() async {
    Set<Polyline> lines = await getLines();
    setState(() {
      _lines = lines;
    });
  }


  Widget _cardSection() {
    return Container(
      height: 193,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 55),
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
    final _shopTiles = shops.map((shop) {
      Widget ifText() {
        var left = '←';
        var right = '→';

        if (shop.uid == "1") left = '　';
        if (shop.uid == "10") right = '　';

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(left, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),),
            Text(shop.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white,),),
            Text(right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),),
          ],
        );
      }
      return Padding(
        padding: const EdgeInsets.all(5),
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
                  Text(shop.name2),
                  ifText(),
                  const Text('',style: TextStyle(fontSize: 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("(喜多方駅駅方面)", style: TextStyle(fontSize: 16)),
                      Text("(西若松駅方面)", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
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




// お店の情報を持つクラス。マップに表示させるために座標を持たせている
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
  Shop('1',  37.51898671455384,  139.92861545223124, '上荒久田','かみあらくだ',              'https://www.google.com/maps/search/?api=1&query=${37.51898671455384},${139.92861545223124}'),
  Shop('2',  37.51961008210341,  139.92580852090927, '荒久田','あらくだ',                   'https://www.google.com/maps/search/?api=1&query=${37.51961008210341},${139.92580852090927}'),
  Shop('3',  37.52173712566494, 139.92407575251022,  '下荒久田','しもあらくだ',              'https://www.google.com/maps/search/?api=1&query=${37.52277136592879},${139.92378753035743}'),
  Shop('4',  37.52535486413448, 139.9218267400124,   '会津丸運前','あいづまるうんまえ',        'https://www.google.com/maps/search/?api=1&query=${37.5259671970783},${139.92163358502958}'),
  Shop('5',  37.53076054001056,  139.91880164274676, '沼木倉庫前','ぬまぎそうこまえ',         'https://www.google.com/maps/search/?api=1&query=${37.53076054001056},${139.91880164274676}'),
  Shop('6',  37.54071078867819, 139.91679388059126,  '鶴沼入口','つるぬまいりぐち',           'https://www.google.com/maps/search/?api=1&query=${37.5358756293441},${139.9160433407291}'),
  Shop('7',  37.5212909759392,   139.91835264189348, '会津アピオ入口','あいづあぴおいりぐち',   'https://www.google.co.jp/maps/dir//%E3%80%92965-0052+%E7%A6%8F%E5%B3%B6%E7%9C%8C%E4%BC%9A%E6%B4%A5%E8%8B%A5%E6%9D%BE%E5%B8%82%E7%94%BA%E5%8C%97%E7%94%BA%E5%A4%A7%E5%AD%97%E5%A7%8B%E5%B1%8B%E6%95%B7+%E4%BC%9A%E6%B4%A5%E3%82%A2%E3%83%94%E3%82%AA%E5%85%A5%E5%8F%A3/@37.5207369,139.9159908,16.92z/data=!4m8!4m7!1m0!1m5!1m1!1s0x5f8aacd29417ef0b:0xb70a6d2c1699143c!2m2!1d139.9182362!2d37.5206089?hl=ja'),
  Shop('8',  37.53198571795584,  139.91577611104472, '沼木','ぬまぎ',                      'https://www.google.com/maps/search/?api=1&query=${37.53198571795584},${139.91577611104472}'),
  Shop('9',  37.540449887528666, 139.91408630689486, '平塚','ひらつか',                    'https://www.google.com/maps/search/?api=1&query=${37.540449887528666},${139.91408630689486}'),
  Shop('10', 37.54395424689345,  139.91282026175395, '木流','きながし',                     'https://www.google.com/maps/search/?api=1&query=${37.54395424689345},${139.91282026175395}'),
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