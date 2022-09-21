import 'package:flutter/material.dart';
import 'package:odekeke/Bus/ZIKOKU/kami.dart';
import 'package:odekeke/Bus/busT.dart';
import 'package:odekeke/newmain.dart';
import 'package:url_launcher/url_launcher.dart';


class mapor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('上高野'),
          centerTitle: true,
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
          ),]
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bus2.jpeg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('選んで下さい',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                ),
              ),
              Padding(padding: const EdgeInsets.all(15)),


              SizedBox(
                height: 80, // Widgetの高さを指定
                width: 320, // Widgetの幅を指定
                child: RaisedButton(
                  child: const Text('時刻表',
                    style: TextStyle(fontSize: 25),
                  ),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => kami(),
                      ),
                    );
                  },
                ),
              ),
              Padding(padding: const EdgeInsets.all(10)),
              SizedBox(
                height: 80, // Widgetの高さを指定
                width: 320, // Widgetの幅を指定
                child: RaisedButton(
                  child: const Text('案内する',
                    style: TextStyle(fontSize: 25),
                  ),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () => _openUrl(Uri.encodeFull),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => busT(),
            ),
          );
        },
        child: Icon(Icons.bus_alert),
      ),
    );
  }
}

void _openUrl(_url) async {
  String _url = 'https://www.google.co.jp/maps/dir//〒965-0077+福島県会津若松市高野町大字上高野村内+上高野/@37.5204467,139.9226675,14z/data=!4m7!4m6!1m1!4e2!1m2!1m1!1s0x5f8aacd555a20247:0xb3005224cea4485c!3e0?hl=ja';
  String _encoded = Uri.encodeFull(_url);
  if (await canLaunch(_encoded)) { //開けるアドレスか確認
    await launch(_encoded);
  }
}
