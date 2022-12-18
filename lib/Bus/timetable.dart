import 'package:flutter/material.dart';

import '../Common/commonAppBar.dart';

class Timetable extends StatefulWidget {
  Timetable(this.title, {Key? key}) : super(key: key);
  String title;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class PlaceItem {
  bool isExpanded;
  String name;
  String image;

  PlaceItem(this.isExpanded, this.name, this.image);
}

ExpansionPanel _createPanel(PlaceItem place) {
  return ExpansionPanel(
    headerBuilder: (BuildContext context, bool isExpanded) {
      int index;
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(left: 10)),
            Text(place.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),)
          ],
        ),
      );
    },
    body: Image.asset('images/' + place.image),
    isExpanded: place.isExpanded,
  );
}

class _State extends State<Timetable> {

  final _controller = PageController(initialPage: 0);
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(widget.title), appBar: AppBar(),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
            controller : _controller,
            children: <Widget>[
              if(widget.title == '笈川線(平日・土)')...[
                ListView(
                  children: <Widget>[
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _placeList[index].isExpanded = !_placeList[index].isExpanded;
                        });
                        },
                      children: _placeList.map(_createPanel).toList(),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _placeList2[index].isExpanded = !_placeList2[index].isExpanded;
                        });
                        },
                      children: _placeList2.map(_createPanel).toList(),
                    )
                  ],
                ),
              ],
              if(widget.title == '笈川線(日・祝日)')...[
                ListView(
                  children: <Widget>[
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _placeList3[index].isExpanded = !_placeList3[index].isExpanded;
                        });
                      },
                      children: _placeList3.map(_createPanel).toList(),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _placeList4[index].isExpanded = !_placeList4[index].isExpanded;
                        });
                      },
                      children: _placeList4.map(_createPanel).toList(),
                    )
                  ],
                ),
              ],
              if(widget.title == '塩川・喜多方線(平日)')...[
                ListView(
                  children: <Widget>[
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _placeList5[index].isExpanded = !_placeList5[index].isExpanded;
                        });
                      },
                      children: _placeList5.map(_createPanel).toList(),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _placeList6[index].isExpanded = !_placeList6[index].isExpanded;
                        });
                      },
                      children: _placeList6.map(_createPanel).toList(),
                    )
                  ],
                ),
              ],
              if(widget.title == '塩川・喜多方線(土・日・祝日)')...[
                ListView(
                  children: <Widget>[
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _placeList7[index].isExpanded = !_placeList7[index].isExpanded;
                        });
                      },
                      children: _placeList7.map(_createPanel).toList(),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _placeList8[index].isExpanded = !_placeList8[index].isExpanded;
                        });
                      },
                      children: _placeList8.map(_createPanel).toList(),
                    )
                  ],
                ),
              ],
            ],
          onPageChanged: (index) {setState(() {
            _currentIndex = index;
          });
              },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        selectedFontSize: 20,
        items: [
          if(widget.title == '笈川線(平日・土)' || widget.title == '笈川線(日・祝日)')...[
          const BottomNavigationBarItem(
            icon:  SizedBox.shrink(),
            label: "笈川学校方面",
          ),
          ],
          if(widget.title != '笈川線(平日・土)' && widget.title != '笈川線(日・祝日)')...[
            const BottomNavigationBarItem(
              icon:  SizedBox.shrink(),
              label: "喜多方駅方面",
            ),
          ],
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: "西若松駅方面",
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

  final _placeList = <PlaceItem>[];    //笈川線・平日・笈川方面
  final _placeList2 = <PlaceItem>[];   //笈川線・平日・西若松方面
  final _placeList3 = <PlaceItem>[];   //笈川線・祝日・笈川方面
  final _placeList4 = <PlaceItem>[];   //笈川線・祝日・西若松方面
  final _placeList5 = <PlaceItem>[];   //喜多方線・平日・喜多方駅方面
  final _placeList6 = <PlaceItem>[];   //喜多方線・平日・西若松方面
  final _placeList7 = <PlaceItem>[];   //喜多方線・祝日・喜多方駅方面
  final _placeList8 = <PlaceItem>[];   //喜多方線・祝日・西若松方面

  @override
  void initState() {
    //笈川線・平日・笈川方面
    _placeList.add(PlaceItem(false, '1.   上荒久田', 'oikawaLine/oikawa/kamiarakuda1.png'),);
    _placeList.add(PlaceItem(false, '2.   会津アピオ入口', 'oikawaLine/oikawa/aizuapioiriguchi1.png'),);
    _placeList.add(PlaceItem(false, '3.   会津アピオ中央', 'oikawaLine/oikawa/aizuapiochuuou1.png'),);
    _placeList.add(PlaceItem(false, '4.   会津アピオ南口', 'oikawaLine/oikawa/aizuapiominamiguchi1.png'),);
    _placeList.add(PlaceItem(false, '5.   中の明', 'oikawaLine/oikawa/nakanomyo1.png'),);
    _placeList.add(PlaceItem(false, '6.   達磨', 'oikawaLine/oikawa/daruma1.png'),);
    _placeList.add(PlaceItem(false, '7.   上高野', 'oikawaLine/oikawa/kamikouya1.png'),);
    _placeList.add(PlaceItem(false, '8.   下高野', 'oikawaLine/oikawa/shimokouya1.png'),);
    _placeList.add(PlaceItem(false, '9.   十里柳', 'oikawaLine/oikawa/juuriyanagi1.png'),);
    _placeList.add(PlaceItem(false, '10.  界沢', 'oikawaLine/oikawa/sakaizawa1.png'),);
    _placeList.add(PlaceItem(false, '11.  上森台', 'oikawaLine/oikawa/kamimoridai1.png'),);
    //笈川線・平日・西若松方面
    _placeList2.add(PlaceItem(false, '1.   上森台', 'oikawaLine/nishiwakamatsu/kamimoridai1.png'),);
    _placeList2.add(PlaceItem(false, '2.   界沢', 'oikawaLine/nishiwakamatsu/sakaizawa1.png'),);
    _placeList2.add(PlaceItem(false, '3.   十里柳', 'oikawaLine/nishiwakamatsu/juuriyanagi1.png'),);
    _placeList2.add(PlaceItem(false, '4.   下高野', 'oikawaLine/nishiwakamatsu/shimokouya1.png'),);
    _placeList2.add(PlaceItem(false, '5.   上高野', 'oikawaLine/nishiwakamatsu/kamikouya1.png'),);
    _placeList2.add(PlaceItem(false, '6.   達磨', 'oikawaLine/nishiwakamatsu/daruma1.png'),);
    _placeList2.add(PlaceItem(false, '7.   中の明', 'oikawaLine/nishiwakamatsu/nakanomyo1.png'),);
    _placeList2.add(PlaceItem(false, '8.   会津アピオ南口', 'oikawaLine/nishiwakamatsu/aizuminamiguchi1.png'),);
    _placeList2.add(PlaceItem(false, '9.   会津アピオ中央', 'oikawaLine/nishiwakamatsu/aizuapiochuuou1.png'),);
    _placeList2.add(PlaceItem(false, '10.  会津アピオ入口', 'oikawaLine/nishiwakamatsu/aizuapioiriguchi1.png'),);
    _placeList2.add(PlaceItem(false, '11.  上荒久田', 'oikawaLine/nishiwakamatsu/kamiarakuda1.png'),);
    //笈川線・祝日・笈川方面
    _placeList3.add(PlaceItem(false, '1.   上荒久田', 'oikawaLine/oikawa/kamiarakuda2.png'),);
    _placeList3.add(PlaceItem(false, '2.   会津アピオ入口', 'oikawaLine/oikawa/aizuapioiriguchi2.png'),);
    _placeList3.add(PlaceItem(false, '3.   会津アピオ中央', 'oikawaLine/oikawa/aizuapiochuuou2.png'),);
    _placeList3.add(PlaceItem(false, '4.   会津アピオ南口', 'oikawaLine/oikawa/aizuapiominamiguchi2.png'),);
    _placeList3.add(PlaceItem(false, '5.   中の明', 'oikawaLine/oikawa/nakanomyo2.png'),);
    _placeList3.add(PlaceItem(false, '6.   達磨', 'oikawaLine/oikawa/daruma2.png'),);
    _placeList3.add(PlaceItem(false, '7.   上高野', 'oikawaLine/oikawa/kamikouya2.png'),);
    _placeList3.add(PlaceItem(false, '8.   下高野', 'oikawaLine/oikawa/shimokouya2.png'),);
    _placeList3.add(PlaceItem(false, '9.   十里柳', 'oikawaLine/oikawa/juuriyanagi2.png'),);
    _placeList3.add(PlaceItem(false, '10.  界沢', 'oikawaLine/oikawa/sakaizawa2.png'),);
    _placeList3.add(PlaceItem(false, '11.  上森台', 'oikawaLine/oikawa/kamimoridai2.png'),);
    //笈川線・祝日・西若松方面
    _placeList4.add(PlaceItem(false, '1.   上森台', 'oikawaLine/nishiwakamatsu/kamimoridai2.png'),);
    _placeList4.add(PlaceItem(false, '2.   界沢', 'oikawaLine/nishiwakamatsu/sakaizawa2.png'),);
    _placeList4.add(PlaceItem(false, '3.   十里柳', 'oikawaLine/nishiwakamatsu/juuriyanagi2.png'),);
    _placeList4.add(PlaceItem(false, '4.   下高野', 'oikawaLine/nishiwakamatsu/shimokouya2.png'),);
    _placeList4.add(PlaceItem(false, '5.   上高野', 'oikawaLine/nishiwakamatsu/kamikouya2.png'),);
    _placeList4.add(PlaceItem(false, '6.   達磨', 'oikawaLine/nishiwakamatsu/daruma2.png'),);
    _placeList4.add(PlaceItem(false, '7.   中の明', 'oikawaLine/nishiwakamatsu/nakanomyo2.png'),);
    _placeList4.add(PlaceItem(false, '8.   会津アピオ南口', 'oikawaLine/nishiwakamatsu/aizuminamiguchi2.png'),);
    _placeList4.add(PlaceItem(false, '9.   会津アピオ中央', 'oikawaLine/nishiwakamatsu/aizuapiochuuou2.png'),);
    _placeList4.add(PlaceItem(false, '10.  会津アピオ入口', 'oikawaLine/nishiwakamatsu/aizuapioiriguchi2.png'),);
    _placeList4.add(PlaceItem(false, '11.  上荒久田', 'oikawaLine/nishiwakamatsu/kamiarakuda2.png'),);
    //喜多方線・平日・喜多方駅方面
    _placeList5.add(PlaceItem(false, '1.   上荒久田', 'kitakataLine/kitakata/kamiarakuda1.png'),);
    _placeList5.add(PlaceItem(false, '2.   荒久田', 'kitakataLine/kitakata/arakuda1.png'),);
    _placeList5.add(PlaceItem(false, '3.   下荒久田', 'kitakataLine/kitakata/shimoarakuda1.png'),);
    _placeList5.add(PlaceItem(false, '4.   会津丸運前', 'kitakataLine/kitakata/aizumaruunmae1.png'),);
    _placeList5.add(PlaceItem(false, '5.   沼木倉庫前', 'kitakataLine/kitakata/numagisoukomae1.png'),);
    _placeList5.add(PlaceItem(false, '6.   鶴沼入口', 'kitakataLine/kitakata/tsurunumairiguchi1.png'),);
    _placeList5.add(PlaceItem(false, '7.   会津アピオ入口', 'kitakataLine/kitakata/aizuapioiriguchi1.png'),);
    _placeList5.add(PlaceItem(false, '8.   沼木', 'kitakataLine/kitakata/numagi1.png'),);
    _placeList5.add(PlaceItem(false, '9.   平塚', 'kitakataLine/kitakata/hiratsuka1.png'),);
    _placeList5.add(PlaceItem(false, '10.  木流', 'kitakataLine/kitakata/kinagashi1.png'),);
    //喜多方線・平日・西若松方面
    _placeList6.add(PlaceItem(false, '1.   木流', 'kitakataLine/nishiwakamatsu/kinagashi1.png'),);
    _placeList6.add(PlaceItem(false, '2.   平塚', 'kitakataLine/nishiwakamatsu/hiratsuka1.png'),);
    _placeList6.add(PlaceItem(false, '3.   沼木', 'kitakataLine/nishiwakamatsu/numagi1.png'),);
    _placeList6.add(PlaceItem(false, '4.   会津アピオ入口', 'kitakataLine/nishiwakamatsu/aizuapioiriguchi1.png'),);
    _placeList6.add(PlaceItem(false, '5.   鶴沼入口', 'kitakataLine/nishiwakamatsu/tsurunumairiguchi1.png'),);
    _placeList6.add(PlaceItem(false, '6.   沼木倉庫前', 'kitakataLine/nishiwakamatsu/numagisoukomae1.png'),);
    _placeList6.add(PlaceItem(false, '7.   会津丸運前', 'kitakataLine/nishiwakamatsu/aizumaruunmae1.png'),);
    _placeList6.add(PlaceItem(false, '8.   下荒久田', 'kitakataLine/nishiwakamatsu/shimoarakuda1.png'),);
    _placeList6.add(PlaceItem(false, '9.   荒久田', 'kitakataLine/nishiwakamatsu/arakuda1.png'),);
    _placeList6.add(PlaceItem(false, '10.  上荒久田', 'kitakataLine/nishiwakamatsu/kamiarakuda1.png'),);
    //喜多方線・祝日・喜多方駅方面
    _placeList7.add(PlaceItem(false, '1.   上荒久田', 'kitakataLine/kitakata/kamiarakuda2.png'),);
    _placeList7.add(PlaceItem(false, '2.   荒久田', 'kitakataLine/kitakata/arakuda2.png'),);
    _placeList7.add(PlaceItem(false, '3.   下荒久田', 'kitakataLine/kitakata/shimoarakuda2.png'),);
    _placeList7.add(PlaceItem(false, '4.   会津丸運前', 'kitakataLine/kitakata/aizumaruunmae2.png'),);
    _placeList7.add(PlaceItem(false, '5.   沼木倉庫前', 'kitakataLine/kitakata/numagisoukomae2.png'),);
    _placeList7.add(PlaceItem(false, '6.   鶴沼入口', 'kitakataLine/kitakata/tsurunumairiguchi2.png'),);
    _placeList7.add(PlaceItem(false, '7.   会津アピオ入口', 'kitakataLine/kitakata/aizuapioiriguchi1.png'),);
    _placeList7.add(PlaceItem(false, '8.   沼木', 'kitakataLine/kitakata/numagi1.png'),);
    _placeList7.add(PlaceItem(false, '9.   平塚', 'kitakataLine/kitakata/hiratsuka2.png'),);
    _placeList7.add(PlaceItem(false, '10.  木流', 'kitakataLine/kitakata/kinagashi2.png'),);
    //喜多方線・祝日・西若松方面
    _placeList8.add(PlaceItem(false, '1.   木流', 'kitakataLine/nishiwakamatsu/kinagashi2.png'),);
    _placeList8.add(PlaceItem(false, '2.   平塚', 'kitakataLine/nishiwakamatsu/hiratsuka2.png'),);
    _placeList8.add(PlaceItem(false, '3.   沼木', 'kitakataLine/nishiwakamatsu/numagi1.png'),);
    _placeList8.add(PlaceItem(false, '4.   会津アピオ入口', 'kitakataLine/nishiwakamatsu/aizuapioiriguchi1.png'),);
    _placeList8.add(PlaceItem(false, '5.   鶴沼入口', 'kitakataLine/nishiwakamatsu/tsurunumairiguchi2.png'),);
    _placeList8.add(PlaceItem(false, '6.   沼木倉庫前', 'kitakataLine/nishiwakamatsu/numagisoukomae2.png'),);
    _placeList8.add(PlaceItem(false, '7.   会津丸運前', 'kitakataLine/nishiwakamatsu/aizumaruunmae2.png'),);
    _placeList8.add(PlaceItem(false, '8.   下荒久田', 'kitakataLine/nishiwakamatsu/shimoarakuda2.png'),);
    _placeList8.add(PlaceItem(false, '9.   荒久田', 'kitakataLine/nishiwakamatsu/arakuda2.png'),);
    _placeList8.add(PlaceItem(false, '10.  上荒久田', 'kitakataLine/nishiwakamatsu/kamiarakuda2.png'),);

    super.initState();
  }
}
