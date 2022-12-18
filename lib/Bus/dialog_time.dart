import 'package:flutter/material.dart';
import 'timetable.dart';

//時刻表ボタンが押された時のダイアログ

class OikawaDialogSample extends StatelessWidget {
  const OikawaDialogSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('(笈川線)\nどちらの時刻表を見ますか？', style: TextStyle(fontSize: 25),),
      children: [
        SimpleDialogOption(
          child: const Text('平日・土', style: TextStyle(fontSize: 23, color: Colors.green),),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Timetable('笈川線(平日・土)'),),);
          },
        ),
        SimpleDialogOption(
          child: const Text('日・祝日', style: TextStyle(fontSize: 23,  color: Colors.green),),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Timetable('笈川線(日・祝日)'),),);
          },
        )
      ],
    );
  }
}

class KitakataDialogSample extends StatelessWidget {
  const KitakataDialogSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('(塩川・喜多方線)\nどちらの時刻表を見ますか？', style: TextStyle(fontSize: 25),),
      children: [
        SimpleDialogOption(
          child: const Text('平日', style: TextStyle(fontSize: 23, color: Colors.green),),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Timetable('塩川・喜多方線(平日)'),),);
          },
        ),
        SimpleDialogOption(
          child: const Text('土・日・祝日', style: TextStyle(fontSize: 23, color: Colors.green),),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Timetable('塩川・喜多方線(土・日・祝日)'),),);
          },
        )
      ],
    );
  }
}

