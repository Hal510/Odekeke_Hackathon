import 'package:flutter/material.dart';
import '../home.dart';
import 'Map/kitakata_map.dart';
import 'Map/oikawa_map.dart';

class MapTab extends StatelessWidget {
  const MapTab({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('バス停マップ'),
            backgroundColor: Colors.green,
            centerTitle: true,
            bottom: const TabBar(
                isScrollable: false,
                labelStyle: TextStyle(fontSize: 24.0),
                indicatorWeight: 5,
                indicator: BoxDecoration(color: Colors.black), //Change background color from here
                tabs: <Widget>[
                  Tab(text: '笈川線'),
                  Tab(text: '塩川 喜多方線'),
                ]),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Home(),
                    fullscreenDialog: true,
                  ),
                  );
                },
              ),
            ],
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(), //タブのスクロール無効、ないと地図動かなくなる
            children: <Widget>[
              OikawaMap(),
              KitakataMap(),
            ],
          ),
        ),
      );
  }
}


