import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odekeke/main.dart';
import 'package:odekeke/newmain.dart';
import 'mapor.dart';



class busT extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('バス停を選ぶ'),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround, //つめつめになる
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(10)),
                Text('バス停を選ぶ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )
                ),
                Padding(padding: const EdgeInsets.all(15)),

                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: Text('上高野',
                      style: TextStyle(fontSize: 25),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => mapor(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5)),

                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: Text('下高野',
                      style: TextStyle(fontSize: 25),),
                    onPressed: () {

                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5)),

                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: Text('上高野',
                      style: TextStyle(fontSize: 25),),
                    onPressed: () {
                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}