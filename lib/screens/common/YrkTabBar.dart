import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'YrkTextStyle.dart';

class CustomTapBar extends StatelessWidget implements PreferredSizeWidget {
  CustomTapBar(
      {required this.tabs,
        this.tabWidth,
        this.height = 40,
        this.isScrollable = false,
        this.controller});

  final List<Tuple2<String, int>> tabs;
  final double? tabWidth;
  final double? height;
  final bool isScrollable;
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    double getTabWidth() {
      double result = 0;
      for (int i = 0; i < tabs.length; i++)
        result += tabs[i].item1.length * 16 + 30;
      return result;
    }

    double _tabWidth =
    tabWidth != null ? tabWidth! * tabs.length : getTabWidth();
    final TabController? _controller =
        controller ?? DefaultTabController.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: _tabWidth,
        height: height,
        child: TabBar(
          controller: _controller,
          isScrollable: isScrollable,
          indicatorColor: const Color(0xfff5df4d),
          labelPadding: EdgeInsets.zero,
          labelStyle: YrkTextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
          YrkTextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          tabs: tabs
              .map((tab) => Tab(
              child: Container(
                  width: tabWidth ?? tab.item1.length * 16 + 30,
                  child: Text(
                    tab.item1,
                    textAlign: TextAlign.center,
                  ))))
              .toList(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}