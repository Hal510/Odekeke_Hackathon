import 'package:flutter/material.dart';
import 'package:odekeke/main.dart';

import '../../newmain.dart';

class kami extends StatelessWidget {

  var _pages = [
    Container(
      child: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(15)),
              Text('喜多方方面',
              style: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white
              ),
              ),
              Padding(padding: const EdgeInsets.all(15)),
              Text('平日',
                style: TextStyle(
                    fontSize: 25,
                    backgroundColor: Colors.white
                ),
              ),
              Padding(padding: const EdgeInsets.all(15)),
              Image(
                image: AssetImage('images/zikoku1.jpg'),
              ),
              Padding(padding: const EdgeInsets.all(15)),
              Text('土',
                style: TextStyle(
                    fontSize: 25,
                    backgroundColor: Colors.white
                ),
              ),
              Padding(padding: const EdgeInsets.all(15)),
              Image(
                image: AssetImage('images/zikoku2.jpg'),
              )

            ]
        ),
      ),
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.pink,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('時刻表'),
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
        child: PageView.builder(
          itemBuilder: (context, index) {
            return _pages[index];
          },
          itemCount: _pages.length,
        ),
      ),
    );
  }
}