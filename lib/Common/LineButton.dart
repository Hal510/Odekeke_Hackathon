import 'package:flutter/material.dart';
import 'package:odekeke/Bus/ZIKOKU/kitakataJikoku.dart';
import '../Bus/ZIKOKU/oikawaJikoku.dart';

//oikawaLinePage・kitakataLinePageそれぞれ共通のボタン

class OikawaLineButton extends StatelessWidget {
  late final String busStopTitle;

  OikawaLineButton({required this.busStopTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: 320,
        child: RaisedButton(
          child: Text(busStopTitle, style: TextStyle(fontSize: 35),),
          color: Colors.orange,
          textColor: Colors.white,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => OikawaJikokuPage(busStopTitle))
            );
            },
        ),
    );
  }
}

class KitakataLineButton extends StatelessWidget {
  late final String busStopTitle;

  KitakataLineButton({required this.busStopTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 320,
      child: RaisedButton(
        child: Text(busStopTitle, style: TextStyle(fontSize: 35),),
        color: Colors.orange,
        textColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => KitakataJikokuPage(busStopTitle))
          );
        },
      ),
    );
  }
}