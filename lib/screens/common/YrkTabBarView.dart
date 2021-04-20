import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YrkTabBarView extends StatelessWidget {
  YrkTabBarView(
      {this.tabViewList,
      this.controller,
      required this.tabTextList,
      required this.tabSize,
      required this.length,
      this.height = 650,
      this.onTap,
      this.tabController});

  final List<Widget>? tabViewList;
  final TabController? controller;
  final List<String> tabTextList;
  final int tabSize;
  final int length;
  final double? height;
  final ValueChanged<int>? onTap;
  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    List<Tab> _buildTabs() {
      List<Tab> tabs = <Tab>[];
      for (int i = 0; i < length; i++) {
        tabs.add(Tab(
            child: Text(tabTextList.elementAt(i),
                style: const TextStyle(
                  color: const Color(0xe6000000),
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center)));
      }
      return tabs;
    }

    List<Tab> tabs = _buildTabs();

    return DefaultTabController(
      length: length,
      initialIndex: 0,
      child: Builder(builder: (BuildContext context) {
        return Column(children: <Widget>[
          Container(
              height: 40,
              alignment: Alignment.centerLeft,
              child: Row(children: <Widget>[
                Expanded(
                    flex: tabSize * length,
                    child: TabBar(
                      controller: tabController,
                      onTap: (index) {
                        if (onTap != null) onTap!(index);
                      },
                      tabs: tabs,
                      indicatorColor: const Color(0xfff5df4d),
                      labelStyle: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400),
                    )),
                Expanded(flex: 360 - tabSize * length, child: Container())
              ])),
          Container(
              height: height,
              child: TabBarView(
                children: tabViewList!,
              )),
        ]);
      }),
    );
  }
}
