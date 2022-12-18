import 'package:flutter/material.dart';
import 'package:odekeke/Common/commonAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Common/tel_button.dart';

class tel extends StatefulWidget {
  const tel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<tel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: const Text('電話したい会社を選ぶ'), appBar: AppBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/taxi1.jpeg'),
              fit: BoxFit.cover,
            ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(15)),
                TelButton(label: 'あいづタクシー', number: '+0120692468',
                    onPressed: () {
                      var tel = '+0120692468';
                      _launchUrl('tel:$tel');
                }),
                TelButton(label: '白虎タクシー', number: '+0120286801',
                    onPressed: () {
                      var tel = '+0120286801';
                      _launchUrl('tel:$tel');
                    }),
                TelButton(label: '若松タクシー', number: '+0242266655',
                    onPressed: () {
                      var tel = '+0242266655';
                      _launchUrl('tel:$tel');
                    }),
                TelButton(label: '(資)広田タクシー', number: '+0242752321',
                    onPressed: () {
                      var tel = '+0242752321';
                      _launchUrl('tel:$tel');
                    }),
                TelButton(label: '葵観光タクシー', number: '+02423715333',
                    onPressed: () {
                      var tel = '+02423715333';
                      _launchUrl('tel:$tel');
                    }),
                const Padding(padding: EdgeInsets.all(5)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('電話に失敗しました'),
          duration: Duration(seconds: 5),//5秒
        ),
      );
    }
  }
}