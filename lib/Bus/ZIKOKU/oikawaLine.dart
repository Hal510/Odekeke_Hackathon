import 'package:flutter/material.dart';

import '../../newmain.dart';
import 'oikawaJikoku.dart';



class OikawaLinePage extends StatefulWidget {
  const OikawaLinePage();

  @override
  State<OikawaLinePage> createState() => _OikawaLinePageState();
}

class _OikawaLinePageState extends State<OikawaLinePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('笈川線'),
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
          ),
                 ]
        ),
          body: Container(
          decoration: const BoxDecoration(
               image: DecorationImage(
               image: AssetImage('images/bus2.jpeg'),
                 fit: BoxFit.cover,
               )
          ),
      child: Center(
          child:SingleChildScrollView(
              child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget>[
                    const Padding(padding: EdgeInsets.all(15)),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('上荒久田',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('上荒久田'))
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
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('会津アピオ入口'))
                          );
                        },
                      ),
                    ),
                    Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('会津アピオ中央',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('会津アピオ中央'))
                          );
                        },
                      ),
                    ),
                    Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('会津アピオ南口',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('会津アピオ南口'))
                          );
                        },
                      ),
                    ),
                    Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('中の明',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('中の明'))
                          );
                        },
                      ),
                    ),
                    Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('達磨',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('達磨'))
                          );
                        },
                      ),
                    ),
                    Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('上高野',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('上高野'))
                          );
                        },
                      ),
                    ),
                    Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('下高野',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('下高野'))
                          );
                        },
                      ),
                    ),
                    Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('十里柳',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('十里柳'))
                          );
                        },
                      ),
                    ),
                    Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('界沢',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('界沢'))
                          );
                        },
                      ),
                    ),
                    Text('|',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 80, // Widgetの高さを指定
                      width: 320, // Widgetの幅を指定
                      child: RaisedButton(
                        child: Text('上森台',
                          style: TextStyle(fontSize: 35),),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OikawaJikokuPage('上森台'))
                          );
                        },
                      ),
                    ),
                  ]
              )
          )
      ),
    ),
    );
  }
}