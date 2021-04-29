import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'NoticeListItem.dart';

class Notice extends StatefulWidget {
  Notice({Key? key, required this.data}) : super(key: key);

  final YrkData? data;

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  YrkData? data;

  @override
  initState() {
    data = widget.data;
    super.initState();
  }

  List<Widget> _noticeCardList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(NoticeListItem(
          width: MediaQuery.of(context).size.width, height: 64, index: i));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YrkAppBar(
          type: YrkAppBarType.arrowBackOnly,
        ),
        body: ListView(children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(color: const Color(0xffffffff)),
              alignment: Alignment.centerLeft,
              child: Container(
                height: 24,
                decoration: BoxDecoration(color: const Color(0xffffffff)),
                margin: const EdgeInsets.only(left: 16),
                child: Text("오늘",
                    style: const TextStyle(
                        color: const Color(0xe6000000),
                        fontWeight: FontWeight.w700,
                        fontFamily: "NotoSansCJKKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: _noticeCardList()),
          ),
          Container(
              width: 360,
              height: 40,
              decoration: BoxDecoration(color: const Color(0xffffffff)),
              alignment: Alignment.centerLeft,
              child: Container(
                height: 24,
                decoration: BoxDecoration(color: const Color(0xffffffff)),
                margin: const EdgeInsets.only(left: 16),
                child: Text("어제",
                    style: const TextStyle(
                        color: const Color(0xe6000000),
                        fontWeight: FontWeight.w700,
                        fontFamily: "NotoSansCJKKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: _noticeCardList()),
          ),
        ]),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
  }
}
