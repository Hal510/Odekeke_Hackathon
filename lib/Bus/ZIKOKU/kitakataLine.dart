import 'package:flutter/material.dart';
import 'package:odekeke/Common/CommonAppBar.dart';
import 'package:odekeke/Common/LineButton.dart';


class KitakataLinePage extends StatefulWidget {
  const KitakataLinePage();

  @override
  State<KitakataLinePage> createState() => _KitakataLinePageState();
}

class _KitakataLinePageState extends State<KitakataLinePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text('塩川・喜多方線'), appBar: AppBar(),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(15)),
                      KitakataLineButton(busStopTitle: '上荒久田'),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      KitakataLineButton(busStopTitle: '荒久田'),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      KitakataLineButton(busStopTitle: '下荒久田'),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      KitakataLineButton(busStopTitle: '会津丸運前'),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      KitakataLineButton(busStopTitle: '沼木倉庫前'),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      KitakataLineButton(busStopTitle: '鶴沼入口'),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      KitakataLineButton(busStopTitle: '会津アピオ入口'),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      KitakataLineButton(busStopTitle: '沼木'),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      KitakataLineButton(busStopTitle: '平塚'),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      KitakataLineButton(busStopTitle: '木流'),
                    ],
                ),
              ),
          ),
      ),
    );
  }
}