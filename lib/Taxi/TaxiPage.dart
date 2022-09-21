import 'package:flutter/material.dart';
import 'package:odekeke/newmain.dart';
import 'denwa.dart';

class TaxiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タクシーを使う'),
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
              image: AssetImage('images/taxi1.jpeg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //const Text('選んで下さい',
                //style: TextStyle(
                    //color: Colors.white,
                  //fontSize: 30
                //),
              //),
              Padding(padding: const EdgeInsets.all(15)),


              SizedBox(
                height: 90, // Widgetの高さを指定
                width: 320, // Widgetの幅を指定
                child: RaisedButton(
                  child: const Text('電話をかける',
                  style: TextStyle(fontSize: 35),
                  ),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => denwa(),
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

