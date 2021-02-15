import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';

class YrkListView extends StatelessWidget {
  YrkListView({
    this.itemCount = 1,
    this.onPushNavigator,
    this.clickable = true,
    @required this.item,
    this.index = 0,
  });

  final int itemCount;
  final ValueChanged<YrkData> onPushNavigator;
  final bool clickable;
  YrkListItem item;
  int index;

  Widget _widget(int index) {
    YrkListItem item = this.item.clone();
    item.parentIndex = this.index;
    item.index = index;
    return InkWell(
        onTap: clickable ? () => onPushNavigator(new YrkData(
                SubItem.boardQna, "This is # " + item.parentIndex.toString() + "-" + item.index.toString())) : null,
        child: item);
  }

  Widget _widgetList() {
    List<Widget> list = List<Widget>();
    for (int j = 0; j < itemCount; j++) list.add(_widget(j));
    return Wrap(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return _widgetList();
  }
}

abstract class YrkListItem extends StatelessWidget {
  YrkListItem(this.width, this.height, {Key key}) : super(key: key);

  final double width;
  final double height;

  int parentIndex;
  int index;

  clone();
}
