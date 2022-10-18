import 'package:flutter/material.dart';
import 'package:odekeke/Common/CommonAppBar.dart';

class OikawaJikokuPage extends StatefulWidget {
  OikawaJikokuPage(this.busStop);
  String busStop;

  @override
  State<OikawaJikokuPage> createState() => _OikawaJikokuPageState();
}

class _OikawaJikokuPageState extends State<OikawaJikokuPage>{

  final _controller = PageController(initialPage: 0);
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: Text(widget.busStop), appBar: AppBar(),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bus2.jpeg'),
                fit: BoxFit.cover,
              ),
          ),
          child:PageView(
            controller : _controller,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(15)),
                    Text('平日・土', style: TextStyle(fontSize: 45, backgroundColor: Colors.white),),
                    Padding(padding: EdgeInsets.all(15)),
                    if(widget.busStop == '上荒久田')...[
                      const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/kamiarakuda1.png'))
                    ]
                    else if(widget.busStop == '会津アピオ入口')...[
                      const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/aizuapioiriguchi1.png'))
                    ]
                    else if(widget.busStop == '会津アピオ中央')...[
                      const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/aizuapiochuuou1.png'))
                      ]
                      else if(widget.busStop == '会津アピオ南口')...[
                        const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/aizuminamiguchi1.png'))
                        ]
                        else if(widget.busStop == '中の明')...[
                          const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/nakanomyo1.png'))
                          ]
                          else if(widget.busStop == '達磨')...[
                            const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/daruma1.png'))
                            ]
                            else if(widget.busStop == '上高野')...[
                              const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/kamikouya1.png'))
                              ]
                              else if(widget.busStop == '下高野')...[
                                const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/shimokouya1.png'))
                                ]
                                else if(widget.busStop == '十里柳')...[
                                  const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/juuriyanagi1.png'))
                                  ]
                                  else if(widget.busStop == '界沢')...[
                                    const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/sakaizawa1.png'))
                                    ]
                                    else if(widget.busStop == '上森台')...[
                                      const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/kamimoridai1.png'))
                                      ],
                    Padding(padding: EdgeInsets.all(15)),
                    Text('日・祝', style: TextStyle(fontSize: 45, backgroundColor: Colors.white),),
                    Padding(padding: EdgeInsets.all(15)),
                    if(widget.busStop == '上荒久田')...[
                      const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/kamiarakuda2.png'))
                    ]
                    else if(widget.busStop == '会津アピオ入口')...[
                      const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/aizuapioiriguchi2.png'))
                    ]
                    else if(widget.busStop == '会津アピオ中央')...[
                      const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/aizuapiochuuou2.png'))
                      ]
                      else if(widget.busStop == '会津アピオ南口')...[
                        const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/aizuminamiguchi2.png'))
                        ]
                        else if(widget.busStop == '中の明')...[
                          const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/nakanomyo2.png'))
                          ]
                          else if(widget.busStop == '達磨')...[
                            const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/daruma2.png'))
                            ]
                            else if(widget.busStop == '上高野')...[
                              const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/kamikouya2.png'))
                              ]
                              else if(widget.busStop == '下高野')...[
                                const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/shimokouya2.png'))
                                ]
                                else if(widget.busStop == '十里柳')...[
                                  const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/juuriyanagi2.png'))
                                  ]
                                  else if(widget.busStop == '界沢')...[
                                    const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/sakaizawa2.png'))
                                    ]
                                    else if(widget.busStop == '上森台')...[
                                      const Image(image: AssetImage('images/oikawaLine/nishiwakamatsu/kamimoridai2.png'))
                                      ],
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(15)),
                    Text('平日・土', style: TextStyle(fontSize: 45, backgroundColor: Colors.white),),
                    Padding(padding: EdgeInsets.all(15)),
                    if(widget.busStop == '上荒久田')...[
                      const Image(image: AssetImage('images/oikawaLine/oikawa/kamiarakuda1.png'))
                    ]
                    else if(widget.busStop == '会津アピオ入口')...[
                      const Image(image: AssetImage('images/oikawaLine/oikawa/aizuapioiriguchi1.png'))
                    ]
                    else if(widget.busStop == '会津アピオ中央')...[
                      const Image(image: AssetImage('images/oikawaLine/oikawa/aizuapiochuuou1.png'))
                      ]
                      else if(widget.busStop == '会津アピオ南口')...[
                        const Image(image: AssetImage('images/oikawaLine/oikawa/aizuapiominamiguchi1.png'))
                        ]
                        else if(widget.busStop == '中の明')...[
                          const Image(image: AssetImage('images/oikawaLine/oikawa/nakanomyo1.png'))
                          ]
                          else if(widget.busStop == '達磨')...[
                            const Image(image: AssetImage('images/oikawaLine/oikawa/daruma1.png'))
                            ]
                            else if(widget.busStop == '上高野')...[
                              const Image(image: AssetImage('images/oikawaLine/oikawa/kamikouya1.png'))
                              ]
                              else if(widget.busStop == '下高野')...[
                                const Image(image: AssetImage('images/oikawaLine/oikawa/shimokouya1.png'))
                                ]
                                else if(widget.busStop == '十里柳')...[
                                  const Image(image: AssetImage('images/oikawaLine/oikawa/juuriyanagi1.png'))
                                  ]
                                  else if(widget.busStop == '界沢')...[
                                    const Image(image: AssetImage('images/oikawaLine/oikawa/sakaizawa1.png'))
                                    ]
                                    else if(widget.busStop == '上森台')...[
                                      const Image(image: AssetImage('images/oikawaLine/oikawa/kamimoridai1.png'))
                                      ],
                    Padding(padding: EdgeInsets.all(15)),
                    Text('日・祝', style: TextStyle(fontSize: 45, backgroundColor: Colors.white),),
                    Padding(padding: EdgeInsets.all(15)),
                    if(widget.busStop == '上荒久田')...[
                      const Image(image: AssetImage('images/oikawaLine/oikawa/kamiarakuda2.png'))
                    ]
                    else if(widget.busStop == '会津アピオ入口')...[
                      const Image(image: AssetImage('images/oikawaLine/oikawa/aizuapioiriguchi2.png'))
                    ]
                    else if(widget.busStop == '会津アピオ中央')...[
                      const Image(image: AssetImage('images/oikawaLine/oikawa/aizuapiochuuou2.png'))
                      ]
                      else if(widget.busStop == '会津アピオ南口')...[
                        const Image(image: AssetImage('images/oikawaLine/oikawa/aizuapiominamiguchi2.png'))
                        ]
                        else if(widget.busStop == '中の明')...[
                          const Image(image: AssetImage('images/oikawaLine/oikawa/nakanomyo2.png'))
                          ]
                          else if(widget.busStop == '達磨')...[
                            const Image(image: AssetImage('images/oikawaLine/oikawa/daruma2.png'))
                            ]
                            else if(widget.busStop == '上高野')...[
                              const Image(image: AssetImage('images/oikawaLine/oikawa/kamikouya2.png'))
                              ]
                              else if(widget.busStop == '下高野')...[
                                const Image(image: AssetImage('images/oikawaLine/oikawa/shimokouya2.png'))
                                ]
                                else if(widget.busStop == '十里柳')...[
                                  const Image(image: AssetImage('images/oikawaLine/oikawa/juuriyanagi2.png'))
                                  ]
                                  else if(widget.busStop == '界沢')...[
                                    const Image(image: AssetImage('images/oikawaLine/oikawa/sakaizawa2.png'))
                                    ]
                                    else if(widget.busStop == '上森台')...[
                                      const Image(image: AssetImage('images/oikawaLine/oikawa/kamimoridai2.png'))
                                      ],
                  ],
                ),
              ),
            ],
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 20,
          selectedFontSize: 20,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: "西若松駅方面",
            ),
            BottomNavigationBarItem(
              icon:  SizedBox.shrink(),
              label: "笈川学校方面",
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _controller.jumpToPage(index);
            });
            },
        )
    );
  }
}
