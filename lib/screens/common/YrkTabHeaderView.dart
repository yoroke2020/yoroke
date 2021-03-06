import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

import 'YrkTextStyle.dart';

class YrkTabHeaderView extends StatelessWidget {
  YrkTabHeaderView({
    this.width = double.maxFinite,
    this.height = 40,
    this.margin = const EdgeInsets.only(left: 16.0, right: 16.0),
    this.clickable = false,
    @deprecated
    this.nextSubPageItem,
    this.title = "",
    this.titleStyle = const YrkTextStyle(fontSize: 16.0),
    this.customIcon,
    this.onTap
  });

  final double width;
  final double height;
  final EdgeInsets margin;
  final bool clickable;
  final String? nextSubPageItem;
  final String title;
  final YrkTextStyle titleStyle;
  final Widget? customIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: clickable ? onTap ?? null : null,
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
                      style: titleStyle, textAlign: TextAlign.left),
                  Spacer(),
                  Container(
                      child: customIcon != null
                          ? customIcon
                          : clickable
                              ? YrkIconButton(
                                  icon: "icon_navigate_next.svg",
                                  padding: EdgeInsets.zero,
                                  clickable: false,
                                  iconSize: 24.0,
                                )
                              : null)
                ])));
  }
}
