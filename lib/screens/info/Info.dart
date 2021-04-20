import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/TestPage.dart';
import 'package:yoroke/screens/LogIn/LogIn.dart';
import 'package:yoroke/screens/board/BoardCardListItem.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/info/InfoShareCardListItem.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  List<Widget> _infoShareCardListItem(int pageIndex) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 10; i++) {
      list.add(InfoShareCardListItem(width: 100, height: 100, index: i));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Container(
        child: YrkTabBarView(
            length: 3,
            tabSize: 99,
            tabTextList: ["의료시설", "복지시설", "돌봄서비스"],
            viewRatio: 360 / 690,
            tabViewList: [
              YrkListView(
                  index: 0, itemCount: 4, item: _infoShareCardListItem(0)),
              YrkListView(
                  index: 1, itemCount: 8, item: _infoShareCardListItem(1)),
              YrkListView(
                  index: 2, itemCount: 4, item: _infoShareCardListItem(2)),
            ]),
      ),
    ]));
  }
}
