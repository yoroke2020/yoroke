import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/temp/TestData.dart';
import 'package:yoroke/temp/YrkData.dart';
import 'package:yoroke/temp/TestPage.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/post/Post.dart';

class YrkPageListItem extends StatelessWidget {
  YrkPageListItem({
    required this.pageIndex,
    required this.listIndex,
    required this.pageType,
    required this.nextPageItem,
  });

  final int pageIndex;
  final int listIndex;
  final pageType;
  final nextPageItem;

  void _onItemClicked(BuildContext context, nextPageItem) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        switch (nextPageItem) {
          case "post":
            return Post(data: new YrkData());
          default:
            return TestPage();
        }
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Text or Button appears before a title. If it is true, a text appears.
    // If it is false, a button appears
    bool isText = true;
    // Best Icon appears next to a title
    bool isBestIcon = false;
    // Rating appears next to a comment icon on the second line
    bool isRating = false;

    // Add case here when new kinds of pageListItem is defined
    switch (pageType) {
      case "boardJobFinding":
        isText = false;
        break;
      case "post":
        isRating = true;
        isBestIcon = true;
        break;
      default:
        break;
    }

    return InkWell(
      onTap: () => _onItemClicked(context, nextPageItem),
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
                                textStyle: YrkTextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 4.0),
                          child: Text(testLongString[listIndex],
                              style: const YrkTextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left)),
                      isBestIcon
                          ? Container(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: YrkButton(
                                buttonType: ButtonType.chip,
                                width: 32,
                                height: 16,
                                label: "BEST",
                                textStyle: YrkTextStyle(
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "OpenSans",
                                ),
                                clickable: false,
                                onPressed: () {},
                              ))
                          : Container()
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
                            child: YrkIconButton(icon: "icon_thumb_up.svg"))),
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
                            child: YrkIconButton(icon: "icon_comment.svg"))),
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
                    isRating
                        ? Container(
                            child: Row(children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(right: 3.0),
                                width: 12.0,
                                height: 12.0,
                                child: Icon(
                                  Icons.star,
                                  color: const Color(0xfff5df4d),
                                  size: 12,
                                )),
                            Container(
                                child: Text("4.8",
                                    style: const TextStyle(
                                      color: const Color(0x4d000000),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                      fontFamily: "OpenSans",
                                    ),
                                    textAlign: TextAlign.left))
                          ]))
                        : Container(),
                  ],
                )
              ])),
    );
  }
}
