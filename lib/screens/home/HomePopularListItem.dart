import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';

class HomePopularListItem extends StatelessWidget {
  HomePopularListItem({required this.index, this.onPushNavigator});

  final int index;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onPushNavigator!(new YrkData(
              nextPageItem: SubPageItem.boardReview,
            )),
        child: Container(
            width: double.maxFinite,
            height: 65.0,
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
                                      child: Text(testLongString[index],
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
                                    flex: 64,
                                    child: Text("사용자ID",
                                        style: const TextStyle(
                                            color: const Color(0x4d000000),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "NotoSansCJKKR",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left)),
                                Expanded(
                                    flex: 86,
                                    child: Text(testDate[index],
                                        style: const TextStyle(
                                            color: const Color(0x4d000000),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NotoSansCJKkr",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        textAlign: TextAlign.left)),
                                Expanded(
                                    flex: 14,
                                    child: YrkIconButton(
                                        icon:
                                            "assets/icons/icon_thumb_up_16_px.svg")),
                                Expanded(flex: 5, child: Container()),
                                Expanded(
                                    flex: 21,
                                    child: Text(testNumberString[index],
                                        style: const TextStyle(
                                            color: const Color(0x4d000000),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "NotoSansCJKkr",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left)),
                                Expanded(
                                    flex: 14,
                                    child: YrkIconButton(
                                        icon:
                                            "assets/icons/icon_mode_comment_16_px.svg")),
                                Expanded(flex: 5, child: Container()),
                                Expanded(
                                    flex: 120,
                                    child: Text(testNumberString[index],
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
                          child: YrkIconButton(
                              icon: "assets/icons/icon_mode_comment_16_px.svg"),
                        ),
                        Expanded(
                            flex: 51,
                            child: Container(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(testNumberString[index],
                                    style: const TextStyle(
                                        color: const Color(0xe6000000),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NotoSansCJKkr",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left)))
                      ])))
            ])));
  }
}
