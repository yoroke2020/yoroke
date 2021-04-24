import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

class YrkTabBarView extends StatelessWidget {
  YrkTabBarView(
      {this.tabViewList,
      required this.tabTextList,
      required this.tabWidth,
      required this.length,
      this.tabBarHeight = 40.0,
      this.tabBarViewHeight = 100.0,
      this.onChanged});

  final List<Widget>? tabViewList;
  final List<String> tabTextList;
  final int tabWidth;
  final int length;
  final double? tabBarHeight;
  final double? tabBarViewHeight;
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    List<Tab> _buildTabs() {
      List<Tab> tabs = <Tab>[];
      for (int i = 0; i < length; i++) {
        tabs.add(Tab(
            child: Text(
          tabTextList.elementAt(i),
          style: TextStyle(
            color: const Color(0xe6000000),
          ),
        )));
      }
      return tabs;
    }

    return DefaultTabController(
        length: length,
        child: Builder(builder: (BuildContext context) {
          DefaultTabController.of(context)!.addListener(() {
            print("current tab index = " +
                DefaultTabController.of(context)!.index.toString());
            if (onChanged != null)
              onChanged!(DefaultTabController.of(context)!.index);
          });
          return Column(children: <Widget>[
            Container(
                height: tabBarHeight,
                alignment: Alignment.centerLeft,
                child: Row(children: <Widget>[
                  Expanded(
                      flex: tabWidth * length,
                      child: TabBar(
                        tabs: _buildTabs(),
                        indicatorColor: const Color(0xfff5df4d),
                        labelStyle: YrkTextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w700),
                        unselectedLabelStyle: YrkTextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w400),
                      )),
                  Expanded(flex: 360 - tabWidth * length, child: Container())
                ])),
            Container(
                height: tabBarViewHeight,
                child: TabBarView(
                  // physics: NeverScrollableScrollPhysics(),
                  children: tabViewList!,
                )),
          ]);
        }));
  }
}
