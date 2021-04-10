import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';

class YrkListView extends StatelessWidget {
  YrkListView({
    this.width = double.maxFinite,
    this.height = 120.0,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.scrollable = false,
    this.scrollDirection = Axis.vertical,
    this.clickable = false,
    this.data,
    this.onPushNavigator,
    this.index = 0,
    this.nextSubPageItem,
    required this.item,
    this.itemCount = 1,
    this.itemMargin = const EdgeInsets.all(0),
    this.itemPadding = const EdgeInsets.all(0),
  });

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

  final List<Widget> item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: this.width,
        height: this.height,
        margin: this.margin,
        padding: this.padding,
        child: ListView.builder(
          scrollDirection: this.scrollDirection,
          physics: scrollable
              ? new AlwaysScrollableScrollPhysics()
              : new NeverScrollableScrollPhysics(),
          itemCount: this.itemCount,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: this.itemMargin,
                padding: this.itemPadding,
                child: InkWell(
                    onTap: clickable
                        ? () => onPushNavigator!(new YrkData(
                              nextSubPageItem,
                              str0: "This is # " +
                                  this.index.toString() +
                                  " - " +
                                  index.toString(),
                              i0: this.index,
                              i1: index,
                            ))
                        : null,
                    child: item[index]));
          },
        ));
  }

  YrkData? _getData(int index) {
    if (data != null)
      return data;
    else
      return new YrkData(nextSubPageItem, i0: this.index, i1: index);
  }
}
