import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/navigator/TabItem.dart';
import 'package:helloflutter/models/YrkData.dart';
import 'package:helloflutter/views/YrkListView.dart';

class BoardQnaList extends YorokeWidgetList {
  @override
  BoardQnaList({
    @required this.items,
    @required this.widgetRatio,
    @required this.listLength,
    @required this.itemLength,
    @required this.data,
    @required this.onPushNavigator,
  }) : super(
            items: items,
            widgetRatio: widgetRatio,
            listLength: listLength,
            itemLength: itemLength,
            data: data,
            onPushNavigator: onPushNavigator);

  @override
  final List<String> items;
  @override
  final double widgetRatio;
  @override
  final int listLength;
  @override
  final int itemLength;
  @override
  final YrkData data;
  @override
  final ValueChanged<YrkData> onPushNavigator;

  @override
  List<Widget> getWidgetList();

  @override
  Widget createWidget(int currentIndex) {
    return AspectRatio(
        aspectRatio: widgetRatio,
        child: InkWell(
            onTap: () => onPushNavigator(new YrkData(DetailItem.qna,
                "This is # " + currentIndex.toString() + " in 고민/질문")),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    border: Border(
                        top: BorderSide(
                            width: 1, color: const Color(0x14000000)))),
                child: Row(children: <Widget>[
                  Expanded(
                      flex: 295,
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 37,
                                        child: Text("질문",
                                            style: const TextStyle(
                                                color: const Color(0x99000000),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "NotoSansCJKkr",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0),
                                            textAlign: TextAlign.left),
                                      ),
                                      Expanded(
                                          flex: 258,
                                          child: Text(
                                              items.elementAt(currentIndex),
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xe6000000),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "NotoSansCJKkr",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.left))
                                    ])),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 86,
                                        child: Text("2020.10.21",
                                            style: const TextStyle(
                                                color: const Color(0x4d000000),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "NotoSansCJKkr",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            textAlign: TextAlign.left)),
                                    Expanded(
                                        flex: 14,
                                        child: Image.asset(
                                            "assets/icons/thumb_up_16_px.png")),
                                    Expanded(flex: 5, child: Container()),
                                    Expanded(
                                        flex: 195,
                                        child: Text("15k",
                                            style: const TextStyle(
                                                color: const Color(0x4d000000),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansCJKkr",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.0),
                                            textAlign: TextAlign.left))
                                  ],
                                ))
                          ]))),
                  Expanded(
                      flex: 65,
                      child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                            Expanded(
                              flex: 14,
                              child: Image.asset(
                                  "assets/icons/mode_comment_16_px.png"),
                            ),
                            Expanded(
                                flex: 51,
                                child: Container(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text("152",
                                        style: const TextStyle(
                                            color: const Color(0xe6000000),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "NotoSansCJKkr",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        textAlign: TextAlign.left)))
                          ])))
                ]))));
  }
}
