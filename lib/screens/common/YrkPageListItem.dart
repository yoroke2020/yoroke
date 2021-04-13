import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

enum YrkPageListItemType {
  boardQna,
  boardJobFind,
  boardReview
}

class YrkPageListItem extends StatelessWidget {
  YrkPageListItem({
    required this.pageIndex,
    required this.listIndex,
    required this.yrkPageListItemType,
    this.onPushNavigator,
  });

  final int pageIndex;
  final int listIndex;
  final YrkPageListItemType yrkPageListItemType;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  Widget build(BuildContext context) {
    bool isText = true;
    switch (yrkPageListItemType) {
      case YrkPageListItemType.boardQna:
        isText = true;
        break;
      case YrkPageListItemType.boardJobFind:
        isText = false;
        break;
      case YrkPageListItemType.boardReview:
        isText = true;
        break;
    }
    return InkWell(
      onTap: () =>
          onPushNavigator!(
              new YrkData(
                  SubPageItem.boardQna, i1: listIndex + pageIndex * 10)),
      //TODO: YrkData -> API Call
      child: Container(
          width: double.maxFinite,
          height: 65.0,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(
              color: const Color(0xffffffff),
              border: Border(
                  top: BorderSide(width: 1, color: const Color(0x14000000)))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: isText
                            ? Text(testShortString[listIndex],
                            style: const YrkTextStyle(
                                color: const Color(0x99000000),
                                fontSize: 14.0),
                            textAlign: TextAlign.left)
                            : YrkButton(
                            buttonType: ButtonType.solid,
                            label: "구인중",
                            onPressed: () {},
                            width: 60.0,
                            height: 24.0,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansCJKKR",
                            fontStyle: FontStyle.normal),
                      ),
                      Container(
                          child: Text(testLongString[listIndex],
                              style: const YrkTextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left))
                    ]),
                Container(width: double.maxFinite, height: 6.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text(testShortString[listIndex],
                            style: const TextStyle(
                                color: const Color(0x4d000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                            textAlign: TextAlign.left)),
                    Container(
                        margin: EdgeInsets.only(right: 9.0),
                        child: Text(testDate[listIndex],
                            style: const TextStyle(
                              color: const Color(0x4d000000),
                              fontSize: 12.0,
                              fontFamily: "OpenSans",
                            ),
                            textAlign: TextAlign.left)),
                    Container(
                        margin: EdgeInsets.only(right: 3.0),
                        width: 14.0,
                        height: 12.0,
                        child: Center(
                            child: Image.asset(
                                "assets/icons/thumb_up_16_px.png"))),
                    Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text(testNumberString[listIndex],
                            style: const TextStyle(
                              color: const Color(0x4d000000),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              fontFamily: "OpenSans",
                            ),
                            textAlign: TextAlign.left)),
                    Container(
                        margin: EdgeInsets.only(right: 3.0),
                        width: 12.0,
                        height: 12.0,
                        child: Center(
                            child: Image.asset(
                                "assets/icons/mode_comment_16_px.png"))),
                    Container(
                        child: Text(testNumberString[listIndex],
                            style: const TextStyle(
                              color: const Color(0x4d000000),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              fontFamily: "OpenSans",
                            ),
                            textAlign: TextAlign.left))
                  ],
                )
              ])),
    );
  }
}
