import 'package:flutter/material.dart';
import 'package:odekeke/Common/CommonAppBar.dart';
import 'Busmap.dart';
import 'ZIKOKU/main.dart';

class BusPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text('バスを使う'), appBar: AppBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bus2.jpeg'),
              fit: BoxFit.cover,
            ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(15)),
              SizedBox(
                height: 90, // Widgetの高さを指定
                width: 320, // Widgetの幅を指定
                child: RaisedButton(
                  child: Text('近くのバス停', style: TextStyle(fontSize: 35),),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Busmap(),
                  ),
                  );
                    },
                ),
              ),
              Padding(padding: const EdgeInsets.all(10)),
              SizedBox(
                height: 90, // Widgetの高さを指定
                width: 320, // Widgetの幅を指定
                 child: RaisedButton(
                   child: const Text('時刻表', style: TextStyle(fontSize: 35),),
                   color: Colors.orange,
                   textColor: Colors.white,
                   onPressed: () {Navigator.push(context, MaterialPageRoute(
                     builder: (context) => zikoku(),
                   ),
                   );
                     },
                 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}