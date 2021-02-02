import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/navigator/DetailPage.dart';
import 'package:helloflutter/navigator/TabItem.dart';
import 'package:helloflutter/models/YrkData.dart';
import 'package:helloflutter/views/YrkListView.dart';

class BoardJobFindingList extends YrkListView {
  BoardJobFindingList({
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
                "This is # " + currentIndex.toString() + " in 구인구직")),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    border: Border(
                        top: BorderSide(
                            width: 1, color: const Color(0x14000000)))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(flex: 8, child: Container()),
                                Expanded(
                                    flex: 60,
                                    child: AspectRatio(
                                        aspectRatio: 60 / 24,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16)),
                                                color: const Color(0xfff5df4d)),
                                            child: Center(
                                                child: Text("구인중",
                                                    style: const TextStyle(
                                                        color: const Color(
                                                            0x99000000),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            "NotoSansCJKkr",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 12.0),
                                                    textAlign:
                                                        TextAlign.center))))),
                                Expanded(flex: 8, child: Container()),
                                Expanded(
                                    flex: 276,
                                    child: Text(items.elementAt(currentIndex),
                                        style: const TextStyle(
                                            color: const Color(0xe6000000),
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
                              Expanded(flex: 8, child: Container()),
                              Expanded(
                                  flex: 60,
                                  child: Text("사용자ID",
                                      style: const TextStyle(
                                          color: const Color(0x4d000000),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left)),
                              Expanded(
                                  flex: 77,
                                  child: Text("2020.10.21",
                                      style: const TextStyle(
                                          color: const Color(0x4d000000),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left)),
                              Expanded(
                                  flex: 14,
                                  child: Image.asset(
                                      "assets/icons/thumb_up_16_px.png")),
                              Expanded(flex: 5, child: Container()),
                              Expanded(
                                  flex: 36,
                                  child: Text("15k",
                                      style: const TextStyle(
                                          color: const Color(0x4d000000),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left)),
                              Expanded(
                                  flex: 12,
                                  child: Image.asset(
                                      "assets/icons/mode_comment_16_px.png")),
                              Expanded(flex: 5, child: Container()),
                              Expanded(
                                  flex: 132,
                                  child: Text("152",
                                      style: const TextStyle(
                                          color: const Color(0x4d000000),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left))
                            ],
                          ))
                    ]))));
  }
}
