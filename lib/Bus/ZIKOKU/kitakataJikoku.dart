import 'package:flutter/material.dart';
import 'package:odekeke/Common/CommonAppBar.dart';


class KitakataJikokuPage extends StatefulWidget {
  KitakataJikokuPage(this.busStop);
  String busStop;

  @override
  State<KitakataJikokuPage> createState() => _KitakataJikokuPageState();
}

class _KitakataJikokuPageState extends State<KitakataJikokuPage>{

  final _controller = PageController(initialPage: 0);
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: Text(widget.busStop), appBar: AppBar(),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bus2.jpeg'),
                fit: BoxFit.cover,
              )
          ),
          child:PageView(
            controller : _controller,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(15)),
                    Text('平日', style: TextStyle(fontSize: 45, backgroundColor: Colors.white),),
                    Padding(padding: EdgeInsets.all(15)),
                    if(widget.busStop == '上荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/kamiarakuda1.png'))
                    ]
                    else if(widget.busStop == '荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/arakuda1.png'))
                    ]
                    else if(widget.busStop == '下荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/shimoarakuda1.png'))
                      ]
                      else if(widget.busStop == '会津丸運前')...[
                        const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/aizumaruunmae1.png'))
                        ]
                        else if(widget.busStop == '沼木倉庫前')...[
                          const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/numagisoukomae1.png'))
                          ]
                          else if(widget.busStop == '鶴沼入口')...[
                            const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/tsurunumairiguchi1.png'))
                            ]
                            else if(widget.busStop == '会津アピオ入口')...[
                              const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/aizuapioiriguchi1.png'))
                              ]
                              else if(widget.busStop == '沼木')...[
                                const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/numagi1.png'))
                                ]
                                else if(widget.busStop == '平塚')...[
                                  const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/hiratsuka1.png'))
                                  ]
                                  else if(widget.busStop == '木流')...[
                                    const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/kinagashi1.png'))
                                    ],
                    Padding(padding: EdgeInsets.all(15)),
                    Text('土・日・祝', style: TextStyle(fontSize: 45, backgroundColor: Colors.white),),
                    Padding(padding: EdgeInsets.all(15)),
                    if(widget.busStop == '上荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/kamiarakuda2.png'))
                    ]
                    else if(widget.busStop == '荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/arakuda2.png'))
                    ]
                    else if(widget.busStop == '下荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/shimoarakuda2.png'))
                      ]
                      else if(widget.busStop == '会津丸運前')...[
                        const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/aizumaruunmae2.png'))
                        ]
                        else if(widget.busStop == '沼木倉庫前')...[
                          const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/numagisoukomae2.png'))
                          ]
                          else if(widget.busStop == '鶴沼入口')...[
                            const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/tsurunumairiguchi2.png'))
                            ]
                            else if(widget.busStop == '会津アピオ入口')...[
                              const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/aizuapioiriguchi1.png'))
                              ]
                              else if(widget.busStop == '沼木')...[
                                const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/numagi1.png'))
                                ]
                                else if(widget.busStop == '平塚')...[
                                  const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/hiratsuka2.png'))
                                  ]
                                  else if(widget.busStop == '木流')...[
                                    const Image(image: AssetImage('images/kitakataLine/nishiwakamatsu/kinagashi2.png'))
                                    ],
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(15)),
                    Text('平日', style: TextStyle(fontSize: 45, backgroundColor: Colors.white),),
                    Padding(padding: EdgeInsets.all(15)),
                    if(widget.busStop == '上荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/kitakata/kamiarakuda1.png'))
                    ]
                    else if(widget.busStop == '荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/kitakata/arakuda1.png'))
                    ]
                    else if(widget.busStop == '下荒久田')...[
                        const Image(image: AssetImage('images/kitakataLine/kitakata/shimoarakuda1.png'))
                      ]
                      else if(widget.busStop == '会津丸運前')...[
                          const Image(image: AssetImage('images/kitakataLine/kitakata/aizumaruunmae1.png'))
                        ]
                        else if(widget.busStop == '沼木倉庫前')...[
                            const Image(image: AssetImage('images/kitakataLine/kitakata/numagisoukomae1.png'))
                          ]
                          else if(widget.busStop == '鶴沼入口')...[
                              const Image(image: AssetImage('images/kitakataLine/kitakata/tsurunumairiguchi1.png'))
                            ]
                            else if(widget.busStop == '会津アピオ入口')...[
                                const Image(image: AssetImage('images/kitakataLine/kitakata/aizuapioiriguchi1.png'))
                              ]
                              else if(widget.busStop == '沼木')...[
                                  const Image(image: AssetImage('images/kitakataLine/kitakata/numagi1.png'))
                                ]
                                else if(widget.busStop == '平塚')...[
                                    const Image(image: AssetImage('images/kitakataLine/kitakata/hiratsuka1.png'))
                                  ]
                                  else if(widget.busStop == '木流')...[
                                      const Image(image: AssetImage('images/kitakataLine/kitakata/kinagashi1.png'))
                                    ],
                    Padding(padding: EdgeInsets.all(15)),
                    Text('土・日・祝', style: TextStyle(fontSize: 45, backgroundColor: Colors.white)),
                    Padding(padding: EdgeInsets.all(15)),
                    if(widget.busStop == '上荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/kitakata/kamiarakuda2.png'))
                    ]
                    else if(widget.busStop == '荒久田')...[
                      const Image(image: AssetImage('images/kitakataLine/kitakata/arakuda2.png'))
                    ]
                    else if(widget.busStop == '下荒久田')...[
                        const Image(image: AssetImage('images/kitakataLine/kitakata/shimoarakuda2.png'))
                      ]
                      else if(widget.busStop == '会津丸運前')...[
                          const Image(image: AssetImage('images/kitakataLine/kitakata/aizumaruunmae2.png'))
                        ]
                        else if(widget.busStop == '沼木倉庫前')...[
                            const Image(image: AssetImage('images/kitakataLine/kitakata/numagisoukomae2.png'))
                          ]
                          else if(widget.busStop == '鶴沼入口')...[
                              const Image(image: AssetImage('images/kitakataLine/kitakata/tsurunumairiguchi2.png'))
                            ]
                            else if(widget.busStop == '会津アピオ入口')...[
                                const Image(image: AssetImage('images/kitakataLine/kitakata/aizuapioiriguchi1.png'))
                              ]
                              else if(widget.busStop == '沼木')...[
                                  const Image(image: AssetImage('images/kitakataLine/kitakata/numagi1.png'))
                                ]
                                else if(widget.busStop == '平塚')...[
                                    const Image(image: AssetImage('images/kitakataLine/kitakata/hiratsuka2.png'))
                                  ]
                                  else if(widget.busStop == '木流')...[
                                      const Image(image: AssetImage('images/kitakataLine/kitakata/kinagashi2.png'))
                                    ],
                  ],
                ),
              ),
            ],
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              }
              );
              },
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          iconSize: 10,
          selectedFontSize: 20,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: "西若松駅方面",
            ),
            BottomNavigationBarItem(
              icon:  SizedBox.shrink(),
              label: "喜多方方面",
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _controller.jumpToPage(index);
            });
            },
        ),
    );
  }
}
