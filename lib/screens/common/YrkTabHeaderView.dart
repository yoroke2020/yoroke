import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';

import 'YrkTextStyle.dart';

class YrkTabHeaderView extends StatelessWidget {
  YrkTabHeaderView({
    this.width = double.maxFinite,
    this.height = 40,
    this.margin = const EdgeInsets.only(left: 16.0, right: 16.0),
    this.clickable = false,
    this.onPushNavigator,
    this.nextSubPageItem,
    this.title = "",
  });

  final double width;
  final double height;
  final EdgeInsets margin;
  final bool clickable;
  final ValueChanged<YrkData>? onPushNavigator;
  final SubPageItem? nextSubPageItem;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: clickable
            ? () => onPushNavigator!(new YrkData(nextPageItem: nextSubPageItem))
            : null,
        child: Container(
            width: this.width,
            height: this.height,
            margin: this.margin,
            color: const Color(0xffffffff),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(this.title,
                      style: const YrkTextStyle(fontSize: 16.0),
                      textAlign: TextAlign.left),
                  Spacer(),
                  SvgPicture.asset(
                    "assets/icons/icon_navigate_next_24_px.svg",
                    width: 24.0,
                    height: 24.0,
                  )
                ])));
  }
}
