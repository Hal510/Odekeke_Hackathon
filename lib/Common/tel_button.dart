import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TelButton extends StatelessWidget {
  final String label;
  final String number;
  final GestureTapCallback onPressed;

  const TelButton({Key? key, required this.label, required this.number, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 80,
            width: 330,
          child:RaisedButton(
            color: Colors.orange,
            textColor: Colors.white,
            child: Text(label, style: const TextStyle(fontSize: 35),),
            onPressed: () {
              showDialog(context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: Text(label+"に電話をかける",style: const TextStyle(fontSize: 16,color: Colors.red),),
                  content: const Text('ポップ外を押すとcancel'),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(number+"に発信"),
                      isDestructiveAction: false,
                      onPressed: onPressed,
                    )
                  ],
                ),
              );
            },
          ),
        ),
        const Padding(padding: EdgeInsets.all(10)),
      ],
    );
  }
}

