import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/components/YrkListView.dart';

class BoardQnaList extends YrkListItem {
  BoardQnaList(width, height, {Key key, @required this.data})
      : super(width, height);

  final YrkData data;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            border: Border(
                top: BorderSide(width: 1, color: const Color(0x14000000)))),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  child: Text(testLongString[this.index],
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
                            Expanded(
                                flex: 86,
                                child: Text(testDate[this.index],
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
                                child: Text(testNumberString[this.index],
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
                      child: Image.asset("assets/icons/mode_comment_16_px.png"),
                    ),
                    Expanded(
                        flex: 51,
                        child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(testNumberString[this.index],
                                style: const TextStyle(
                                    color: const Color(0xe6000000),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left)))
                  ])))
        ]));
  }

  @override
  clone() {
    return BoardQnaList(width, height);
  }
}
