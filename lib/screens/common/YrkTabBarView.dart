import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

class YrkTabBar extends StatelessWidget {
  YrkTabBar({
    required this.textList,
    required this.controller,
    this.width = double.maxFinite,
    this.height = 40.0,
    this.tabWidth = 100,
    this.following,
    this.tabScrollable = false,
  });

  final List<String> textList;
  final TabController controller;
  final double? width;
  final double? height;
  final double? tabWidth;
  final Widget? following;
  final bool? tabScrollable;

  get _tabList {
    List<Tab> tabList = <Tab>[];
    for (int i = 0; i < textList.length; i++) {
      tabList.add(Tab(
          child: Text(
        textList.elementAt(i),
        style: TextStyle(
          color: const Color(0xe6000000),
        ),
      )));
    }
    return tabList;
  }

  get _getTabBarWidgetList {
    List<Widget> list = <Widget>[];
    list.add(
      Container(
          width: tabWidth! * textList.length.toDouble(),
          height: height,
          child: TabBar(
            controller: controller,
            tabs: _tabList,
            indicatorColor: const Color(0xfff5df4d),
            labelPadding: EdgeInsets.zero,
            labelStyle:
                YrkTextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            unselectedLabelStyle:
                YrkTextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          )),
    );

    if (!tabScrollable!)
      list.add(Spacer());

    list.add(Container(
        margin: this.following != null
            ? EdgeInsets.all(0)
            : EdgeInsets.only(right: 16.0),
        child: this.following != null ? this.following! : null));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        alignment: Alignment.centerLeft,
        child: tabScrollable!
            ? ListView(
                scrollDirection: Axis.horizontal,
                children: _getTabBarWidgetList)
            : Row(
                children: _getTabBarWidgetList,
              ));
  }
}

class YrkTabView extends StatelessWidget {
  YrkTabView({
    required this.viewList,
    required this.controller,
    this.width = double.maxFinite,
    this.height = 650.0,
    this.swipeable = false,
  });

  final List<Widget> viewList;
  final TabController controller;
  final double? width;
  final double? height;
  final bool? swipeable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TabBarView(
        physics: swipeable!
            ? AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        children: viewList,
        controller: controller,
      ),
    );
  }
}

class YrkTabBarView extends StatelessWidget {
  YrkTabBarView({
    required this.tabViewList,
    required this.tabTextList,
    required this.controller,
    this.tabBarWidth = double.maxFinite,
    this.tabBarHeight = 40.0,
    this.tabWidth = 100,
    this.tabScrollable = false,
    this.tabViewWidth = double.maxFinite,
    this.tabViewHeight = 100.0,
    this.tabBarFollowing,
    this.tabViewSwipable = false,
  });

  final List<Widget> tabViewList;
  final List<String> tabTextList;
  final TabController? controller;
  final double? tabBarWidth;
  final double? tabBarHeight;
  final double? tabWidth;
  final bool? tabScrollable;
  final double? tabViewWidth;
  final double? tabViewHeight;
  final Widget? tabBarFollowing;
  final bool? tabViewSwipable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        YrkTabBar(
            textList: tabTextList,
            controller: controller!,
            width: tabBarWidth,
            height: tabBarHeight,
            tabWidth: tabWidth,
            tabScrollable: tabScrollable,
            following: tabBarFollowing),
        YrkTabView(
          viewList: tabViewList,
          controller: controller!,
          width: tabViewWidth,
          height: tabViewHeight,
          swipeable: tabViewSwipable,
        )
      ],
    );
  }
}
