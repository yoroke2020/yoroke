import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class BoardCardListItem extends StatelessWidget {
  BoardCardListItem(
      {required this.index,
      required this.listLength,
      this.onPushNavigator,
      this.isBorder = false});

  final int index;
  final int listLength;
  final ValueChanged<YrkData>? onPushNavigator;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onPushNavigator!(new YrkData(
              nextPageItem: SubPageItem.boardReview,
              i1: index,
            )),
        child: Container(
            margin: index == 0
                ? EdgeInsets.only(left: 17.0)
                : index == listLength - 1
                    ? EdgeInsets.only(right: 17.0)
                    : EdgeInsets.zero,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 48.0,
                    height: 48.0,
                    margin: EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: new DecorationImage(
                          image: new AssetImage(testCardImage.elementAt(index)),
                          fit: BoxFit.fill,
                        ),
                        border: isBorder
                            ? Border.all(
                                color: const Color(0xfff5df4d), width: 2)
                            : null),
                  ),
                  Text(
                    testShortString.elementAt(index),
                    style: const YrkTextStyle(
                        color: const Color(0x99000000),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ])));
  }
}
