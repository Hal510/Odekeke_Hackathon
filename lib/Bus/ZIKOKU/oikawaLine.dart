import 'package:flutter/material.dart';
import 'package:odekeke/Common/CommonAppBar.dart';
import 'package:odekeke/Common/LineButton.dart';


class OikawaLinePage extends StatefulWidget {
  const OikawaLinePage();

  @override
  State<OikawaLinePage> createState() => _OikawaLinePageState();
}

class _OikawaLinePageState extends State<OikawaLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text('笈川線'), appBar: AppBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bus2.jpeg'),
              fit: BoxFit.cover,
            ),
        ),
        child: Center(
          child:SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Padding(padding: EdgeInsets.all(15)),
                OikawaLineButton(busStopTitle: '上荒久田'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '会津アピオ入口'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '会津アピオ中央'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '会津アピオ南口'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '中の明'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '達磨'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '上高野'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '下高野'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '十里柳'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '界沢'),
                Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                OikawaLineButton(busStopTitle: '上森台'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}