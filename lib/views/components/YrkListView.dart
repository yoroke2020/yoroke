import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';

abstract class YrkListItem extends StatelessWidget {
  YrkListItem(this.width, this.height, {Key key}) : super(key: key);

  final double width;
  final double height;

  int parentIndex;
  int index;

  clone();
}

class YrkListView extends StatelessWidget {
  YrkListView({
    this.width = double.maxFinite,
    this.height = 120.0,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.scrollable = false,
    this.scrollDirection = Axis.vertical,
    this.clickable = true,
    this.onPushNavigator,
    this.index = 0,
    this.nextSubPageItem,
    @required this.item,
    this.itemCount = 1,
    this.itemMargin = const EdgeInsets.all(0),
    this.itemPadding = const EdgeInsets.all(0),
  });

  final Axis scrollDirection;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets itemMargin;
  final EdgeInsets itemPadding;
  final ValueChanged<YrkData> onPushNavigator;
  final SubPageItem nextSubPageItem;
  final int itemCount;
  final double width;
  final double height;
  final bool clickable;
  final bool scrollable;

  YrkListItem item;
  int index;

  Widget _widget(int index) {
    YrkListItem item = this.item.clone();
    item.parentIndex = this.index;
    item.index = index;
    return item;
  }

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
                        ? () => onPushNavigator(new YrkData(
                              nextSubPageItem,
                              str0: "This is # " +
                                  this.index.toString() +
                                  " - " +
                                  index.toString(),
                              i0: this.index,
                              i1: index,
                            ))
                        : null,
                    child: _widget(index)));
          },
        ));
  }
}
