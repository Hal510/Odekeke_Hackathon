import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:odekeke/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'お出かけ永和',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'お出かけ永和',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const Home(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(child: child, opacity: animation);
                          },
                      ),
                    );
                    },
                  child: Image.asset('images/top2.jpeg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const Home(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(child: child, opacity: animation);
                            },
                        ),
                      );
                      },
                    child:Center(
                        child: Column(
                            children: <Widget>[
                              const Padding(padding: EdgeInsets.all(120)),
                              const Text('おでかけ永和', style: TextStyle(color: Colors.white, fontSize: 50, shadows: <Shadow>[Shadow(offset: Offset(5.0, 10.0), blurRadius: 2.0, color: Colors.black)])),
                              const Padding(padding: EdgeInsets.all(60)),
                              AnimatedTextKit(
                                  animatedTexts: [
                                    FadeAnimatedText('~タップして始める~', textStyle: const TextStyle(fontSize: 30, color: Colors.white))
                                  ]
                              ),
                            ]
                        ),
                    ),
                ),
              ],
          ),
        ),
    );
  }
}
