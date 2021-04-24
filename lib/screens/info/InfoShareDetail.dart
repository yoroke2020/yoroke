import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/AppBarXLargeImage.dart';
import 'package:yoroke/screens/info/InfoShareCardListItem.dart';

// ignore: must_be_immutable
class InfoShareDetail extends StatefulWidget {
  InfoShareDetail({Key? key, required this.data, required this.onPushNavigator})
      : super(key: key);

  YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _InfoShareDetailState createState() => _InfoShareDetailState();
}

class _InfoShareDetailState extends State<InfoShareDetail> {
  List<String> titleList = [
    "요양병원 후기/리뷰",
    "요양원 후기/리뷰",
    "복지관 후기/리뷰",
    "간병인 후기/리뷰"
  ];

  List<String> date = [
    "2020.04.21",
  ];

  bool isScrolled = false;
  double? appbarHeight;

  String _sampleText(String s) {
    String str = "";
    for (int i = 0; i < 100; i++) {
      str += s;
    }
    return str;
  }

  List<Widget> _infoShareCardListItem(int pageIndex) {
    double _expandWidth = MediaQuery.of(context).size.width - 32 - 16;

    List<Widget> list = <Widget>[];
    for (int i = 0; i < 6; i += 2) {
      list.add(Container(
          width: _expandWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InfoShareCardListItem(
                width: (_expandWidth - 24) / 2,
                height: 172,
                index: i,
                onPushNavigator: widget.onPushNavigator,
              ),
              InfoShareCardListItem(
                width: (_expandWidth - 24) / 2,
                height: 172,
                index: i + 1,
                onPushNavigator: widget.onPushNavigator,
              ),
            ],
          )));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarXLargeImage(
        titleText: widget.data!.str0!,
        date: widget.data!.str1!,
        height: appbarHeight,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (_scrollNotification) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            setState(() {
              appbarHeight = _scrollNotification.metrics.pixels;
            });
          });
          return true;
        },
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(16),
                child: Text(_sampleText("요양병원 후기 "),
                    style: YrkTextStyle(height: 1.5, fontSize: 16.0),
                    textAlign: TextAlign.left)),
            Container(
                padding: EdgeInsets.all(16),
                // width: double.maxFinite,
                child: Text("연관정보",
                    style: YrkTextStyle(
                        height: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left)),
            YrkListView(
              height: MediaQuery.of(context).size.height - 200,
              pageIndex: 0,
              itemCount: 3,
              item: _infoShareCardListItem(2),
              itemPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ],
        ),
      ),
    );
  }
}
