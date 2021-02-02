import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/YrkData.dart';

abstract class YorokeWidgetList {
  YorokeWidgetList(
      {@required this.items,
      @required this.widgetRatio,
      this.listLength = 1,
      @required this.itemLength,
      @required this.data,
      @required this.onPushNavigator});

  final List<String> items;
  final double widgetRatio;
  final int listLength;
  final int itemLength;
  final YrkData data;
  final ValueChanged<YrkData> onPushNavigator;

  List<Widget> widgetList;

  Widget createWidget(int currentIndex);

  List<Widget> getWidgetList() {
    if (widgetList == null) {
      widgetList = List<Widget>();
      for (int i = 0; i < listLength; i++) {
        List<Widget> list = List<Widget>();
        for (int j = 0; j < itemLength; j++)
          list.add(createWidget(i * itemLength + j));
        widgetList.add(Wrap(children: list));
      }
    }

    return widgetList;
  }
}
