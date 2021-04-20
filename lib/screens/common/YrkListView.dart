import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';

class YrkListView extends StatelessWidget {
  YrkListView(
      {this.width = double.maxFinite,
      this.height = 120.0,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(0),
      this.scrollable = false,
      this.scrollDirection = Axis.vertical,
      @Deprecated("deprecated") this.clickable = false,
      @Deprecated("deprecated") this.data,
      @Deprecated("deprecated") this.onPushNavigator,
      this.index = 0,
      @Deprecated("deprecated") this.nextSubPageItem,
      required this.item,
      this.itemCount = 1,
      this.itemMargin = const EdgeInsets.all(0),
      this.itemPadding = const EdgeInsets.all(0),
      this.isIndicator = false});

  final Axis scrollDirection;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets itemMargin;
  final EdgeInsets itemPadding;
  final YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;
  final SubPageItem? nextSubPageItem;
  final int itemCount;
  final double width;
  final double height;
  final bool clickable;
  final bool scrollable;
  final bool? isIndicator;
  final List<Widget> item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        child: ListView.builder(
          scrollDirection: scrollDirection,
          physics: scrollable
              ? new AlwaysScrollableScrollPhysics()
              : new NeverScrollableScrollPhysics(),
          itemCount: isIndicator! ? itemCount + 1 : itemCount,
          itemBuilder: (BuildContext context, int index) {
            if (isIndicator! && index == itemCount) {
              print("CircularProgressIndicator appears");
              return CircularProgressIndicator();
            }
            return Container(
                margin: itemMargin, padding: itemPadding, child: item[index]);
          },
        ));
  }
}
