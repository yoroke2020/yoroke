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
  });

  final List<String> textList;
  final TabController controller;
  final double? width;
  final double? height;
  final double? tabWidth;
  final Widget? following;

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

  @override
  Widget build(BuildContext context) {
    return Container(
          height: height,
          width: width,
          alignment: Alignment.centerLeft,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
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
              Spacer(),
              Container(
                  margin: this.following != null ? EdgeInsets.all(0) : EdgeInsets.only(right: 16.0),
                  child: this.following != null ? this.following! : null)
            ]),
          );
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
