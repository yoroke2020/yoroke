import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/views/widgets/YrkDotsIndicator.dart';

class YrkTabBarView extends StatelessWidget {
  YrkTabBarView({
    this.tabViewList,
    this.controller,
    @required this.tabTextList,
    @required this.viewRatio,
    @required this.tabSize,
    @required this.length,
  });

  final List<Widget> tabViewList;
  final TabController controller;
  final List<String> tabTextList;
  final double viewRatio;
  final int tabSize;
  final int length;

  @override
  Widget build(BuildContext context) {
    List<Tab> _buildTabs() {
      List<Tab> tabs = List<Tab>();
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
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (tabController.indexIsChanging) {}
        });
        return Column(children: <Widget>[
          Container(
              height: 40,
              alignment: Alignment.centerLeft,
              child: Row(children: <Widget>[
                Expanded(
                    flex: tabSize * length,
                    child: TabBar(
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
              height: 650,
              child: TabBarView(
                children: tabViewList,
              )),
        ]);
      }),
    );
  }
}
