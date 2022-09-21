import 'package:flutter/material.dart';

import '../../newmain.dart';
import 'kitakataJikoku.dart';


class KitakataLinePage extends StatefulWidget {
  const KitakataLinePage();


  @override
  State<KitakataLinePage> createState() => _KitakataLinePageState();
}

class _KitakataLinePageState extends State<KitakataLinePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('塩川・喜多方線'),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.all(15)),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: const Text('上荒久田',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KitakataJikokuPage('上荒久田'),
                              ),
                            );
                          },
                        ),
                      ),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: Text('荒久田',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => KitakataJikokuPage('荒久田'))
                            );
                          },
                        ),
                      ),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: Text('下荒久田',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => KitakataJikokuPage('下荒久田'))
                            );
                          },
                        ),
                      ),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: Text('会津丸運前',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => KitakataJikokuPage('会津丸運前'))
                            );
                          },
                        ),
                      ),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: Text('沼木倉庫前',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => KitakataJikokuPage('沼木倉庫前'))
                            );
                          },
                        ),
                      ),

                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: Text('鶴沼入口',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => KitakataJikokuPage('鶴沼入口'))
                            );
                          },
                        ),
                      ),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: Text('会津アピオ入口',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => KitakataJikokuPage('会津アピオ入口'))
                            );
                          },
                        ),
                      ),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: Text('沼木',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => KitakataJikokuPage('沼木'))
                            );
                          },
                        ),
                      ),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: Text('平塚',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => KitakataJikokuPage('平塚'))
                            );
                          },
                        ),
                      ),
                      Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80, // Widgetの高さを指定
                        width: 320, // Widgetの幅を指定
                        child: RaisedButton(
                          child: Text('木流',
                            style: TextStyle(fontSize: 35),),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => KitakataJikokuPage('木流'))
                            );
                          },
                        ),
                      ),
                    ]
                ),
              )
          )
      ),
    );
  }
}