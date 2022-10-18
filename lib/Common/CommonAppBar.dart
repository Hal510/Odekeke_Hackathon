import 'package:flutter/material.dart';
import '../newmain.dart';

//全画面共通のAppBar

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = const Color(0xFFFF7235);
  final Text title;
  final AppBar appBar;
  const CommonAppBar({Key? key, required this.title, required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Colors.green,
      centerTitle: true,
      actions: <Widget>[
        // IconButton(
        //   icon: Icon(Icons.favorite, color: Colors.white,), onPressed: () {  },
        // ),
        IconButton(
          icon: Icon(Icons.home, color: Colors.white,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => MyApp2(),
                fullscreenDialog: true,
              ),
            );
            },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}