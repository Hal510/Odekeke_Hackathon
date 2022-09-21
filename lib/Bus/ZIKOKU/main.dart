import 'package:flutter/material.dart';
import '../../newmain.dart';
import 'kitakataLine.dart';
import 'oikawaLine.dart';


class zikoku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('利用する線を選ぶ'),
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
              //const Text('ご利用の交通手段',
                //style: TextStyle(color: Colors.white, fontSize: 30),
              //),
              Padding(padding: const EdgeInsets.all(15)),

              SizedBox(
                height: 90, // Widgetの高さを指定
                width: 320, // Widgetの幅を指定
                child: RaisedButton(
                  child: const Text('笈川線',
                    style: TextStyle(fontSize: 35),),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OikawaLinePage(),
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
                  child: const Text('塩川・喜多方線',
                    style: TextStyle(fontSize: 35),),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KitakataLinePage(),
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