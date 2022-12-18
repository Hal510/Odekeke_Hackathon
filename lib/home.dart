import 'package:flutter/material.dart';
import 'package:odekeke/Taxi/tel.dart';
import 'Bus/tab.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/top1.jpeg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('ご利用の交通手段', style: TextStyle(color: Colors.white, fontSize: 40),),
              const Padding(padding: EdgeInsets.all(15)),
              SizedBox(
                height: 90, // Widgetの高さを指定
                width: 320, // Widgetの幅を指定
                child: RaisedButton(
                  child: const Text('バスを使う', style: TextStyle(fontSize: 35),),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapTab(),
                      ),
                    );
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                height: 90, // Widgetの高さを指定
                width: 320, // Widgetの幅を指定
                child: RaisedButton(
                  child: const Text('タクシーを使う', style: TextStyle(fontSize: 35),),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const tel(),
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
