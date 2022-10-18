import 'package:flutter/material.dart';
import 'package:odekeke/Common/CommonAppBar.dart';
import 'kitakataLine.dart';
import 'oikawaLine.dart';


class zikoku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text('利用する線を選ぶ'), appBar: AppBar(),
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
              SizedBox(
                height: 90,
                width: 320,
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
                height: 90,
                width: 320,
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