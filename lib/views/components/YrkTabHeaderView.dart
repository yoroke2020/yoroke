import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';

class YrkTabHeaderView extends StatelessWidget {
  YrkTabHeaderView(
      {this.width = double.maxFinite,
      this.height = 40,
      this.margin = const EdgeInsets.only(left: 16.0, right: 16.0),
      this.clickable = false,
      this.onPushNavigator,
      this.nextSubPageItem,
      this.title = "",
      this.widget});

  final double width;
  final double height;
  final EdgeInsets margin;
  final bool clickable;
  final ValueChanged<YrkData> onPushNavigator;
  final SubPageItem nextSubPageItem;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: clickable
            ? () => onPushNavigator(new YrkData(nextSubPageItem))
            : null,
        child: Container(
            width: this.width,
            height: this.height,
            margin: this.margin,
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Text(this.title,
                        style: const TextStyle(
                            color: const Color(0xe6000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                  Expanded(child: Container()),
                  this.widget != null
                      ? widget
                      : Container(
                          width: 24.0,
                          height: 24.0,
                          child: Image.asset(
                              "assets/icons/navigate_next_24_px.png"),
                        ),
                ])));
  }
}
