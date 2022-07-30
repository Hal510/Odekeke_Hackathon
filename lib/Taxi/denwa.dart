import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odekeke/mewmain.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
  MaterialApp(
    home: denwa(),
  ),
);

class denwa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<denwa> {
  var _status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('電話をかける'),
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
      ),    child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround, //つめつめになる
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(10)),
              Text('かけたい会社を選んで下さい',
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
                  child: Text('あいづタクシー',
                  style: TextStyle(fontSize: 25),),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text("あいづタクシーに電話をかける",style: TextStyle(fontSize: 16,color: Colors.red),),
                          content: Text('ポップ外を押すとcancel'),
                          actions: [
                            CupertinoDialogAction(
                                child: Text('+0120692468 に発信'),
                                isDestructiveAction: false,
                              onPressed: () {
                                var tel = '+0120692468';
                                _launchUrl2('tel:$tel');
                              },
                            )
                          ],
                        ));
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
                  child: Text('白虎タクシー',
                    style: TextStyle(fontSize: 25),),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text("白虎タクシーに電話をかける",style: TextStyle(fontSize: 16,color: Colors.red),),
                          content: Text('ポップ外を押すとcancel'),
                          actions: [
                            CupertinoDialogAction(
                                child: Text('+0120286801 に発信'),
                              isDestructiveAction: false,
                              onPressed: () {
                                var tel = '+0120286801';
                                _launchUrl2('tel:$tel');
                              },
                            )
                          ],
                        ));
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
                  child: Text('若松タクシー',
                    style: TextStyle(fontSize: 25),),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text("若松タクシーに電話をかける",style: TextStyle(fontSize: 16,color: Colors.red),),
                          content: Text('ポップ外を押すとcancel'),
                          actions: [
                            CupertinoDialogAction(
                                child: Text('+0242266655 に発信'),
                                isDestructiveAction: false,
                              onPressed: () {
                                var tel = '+0242266655';
                                _launchUrl2('tel:$tel');
                              },
                            )
                          ],
                        ));
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
                  child: Text('(資)広田タクシー',
                    style: TextStyle(fontSize: 25),),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text("(資)広田タクシーに電話をかける",style: TextStyle(fontSize: 16,color: Colors.red),),
                          content: Text('ポップ外を押すとcancel'),
                          actions: [
                            CupertinoDialogAction(
                                child: Text('+0242752321 に発信'),
                              onPressed: () {
                                var tel = '+0242752321';
                                _launchUrl2('tel:$tel');
                              },
                            )
                          ],
                        ));
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
                  child: Text('葵観光タクシー',
                    style: TextStyle(fontSize: 25),),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text("葵観光タクシーに電話をかける",style: TextStyle(fontSize: 16,color: Colors.red),),
                          content: Text('ポップ外を押すとcancel'),
                          actions: [
                            CupertinoDialogAction(
                              child: Text('+02423715333 に発信'),
                              onPressed: () {
                                var tel = '+0242371533';
                                _launchUrl2('tel:$tel');
                              },
                            )
                          ],
                        )
                    );
                  },
                ),
              ),
              Padding(padding: const EdgeInsets.all(5)),

              Text(_status,
              style: TextStyle(color: Colors.black,fontSize: 17,backgroundColor: Colors.white),)
            ],
          ),
        ),
      ),
    ),
    );
  }

  _launchUrl2(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      setState(() {
        _status = 'Unable to launch url $url';
      });
    }
  }
}