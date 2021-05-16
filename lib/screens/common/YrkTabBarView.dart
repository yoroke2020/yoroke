import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/controllers/YrkSizeController.dart';

import 'YrkTextStyle.dart';

class YrkTabBar extends StatelessWidget {
  YrkTabBar({
    required this.textList,
    required this.controller,
    this.width = double.maxFinite,
    this.height = 40.0,
    this.tabWidth,
    this.following,
    this.tabScrollable = false,
  });

  final List<String> textList;
  final TabController controller;
  final double width;
  final double height;
  final double? tabWidth;
  final Widget? following;
  final bool tabScrollable;

  get _getTabBar {
    return TabBar(
      isScrollable: tabScrollable,
      controller: controller,
      tabs: _getTabs,
      indicatorColor: const Color(0xfff5df4d),
      labelPadding: EdgeInsets.zero,
      labelStyle: YrkTextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
      unselectedLabelStyle:
          YrkTextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
    );
  }

  get _getTabs {
    List<Tab> tabList = <Tab>[];
    for (int i = 0; i < textList.length; i++) {
      tabList.add(Tab(
          child: Container(
        width: tabWidth != null
            ? tabWidth!
            : textList.elementAt(i).length * 16 + 30,
        child: Text(
          textList.elementAt(i),
          style: TextStyle(
            color: const Color(0xe6000000),
          ),
          textAlign: TextAlign.center,
        ),
      )));
    }
    return tabList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        alignment: Alignment.centerLeft,
        child: tabScrollable
            ? _getTabBar
            : Row(children: <Widget>[
                Container(
                  width: tabWidth != null
                      ? tabWidth! * textList.length.toDouble()
                      : double.maxFinite,
                  height: height,
                  child: _getTabBar,
                ),
                Spacer(),
                Container(
                    margin: this.following != null
                        ? EdgeInsets.all(0)
                        : EdgeInsets.only(right: 16.0),
                    child: this.following != null ? this.following! : null)
              ]));
  }
}

class YrkTabView extends StatefulWidget {
  YrkTabView(
      {required this.viewList,
      required this.controller,
      this.width = double.maxFinite,
      this.height = 650,
      this.swipeable = false,
      this.sizeController});

  final List<Widget> viewList;
  final TabController controller;
  final double? width;
  final double? height;
  final bool? swipeable;

  final YrkSizeController? sizeController;

  @override
  _YrkTabViewState createState() => _YrkTabViewState();
}

class _YrkTabViewState extends State<YrkTabView> {
  late YrkSizeController _sizeController;
  late double _width;
  late double _height;

  @override
  void initState() {
    super.initState();
    _width = widget.width!;
    _height = widget.height!;
    _sizeController = widget.sizeController != null
        ? widget.sizeController!
        : YrkSizeController();
    _sizeController.addListener(() {
      _onChangeChildSize();
    });
  }

  @override
  void dispose() {
    _sizeController.removeListener(() {
      _onChangeChildSize();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      child: TabBarView(
        physics: widget.swipeable!
            ? AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        children: widget.viewList,
        controller: widget.controller,
      ),
    );
  }

  void _onChangeChildSize() {
    if (_sizeController.sizeIsChanging) {
      setState(() {
        _width = _sizeController.size.width;
        _height = _sizeController.size.height;
      });
    }
  }
}

class YrkTabBarView extends StatelessWidget {
  YrkTabBarView({
    required this.tabViewList,
    required this.tabTextList,
    required this.controller,
    this.tabBarWidth = double.maxFinite,
    this.tabBarHeight = 40.0,
    this.tabWidth,
    this.tabScrollable = false,
    this.tabViewWidth = double.maxFinite,
    this.tabViewHeight = 100.0,
    this.tabBarFollowing,
    this.tabViewSwipable = false,
    this.tabViewSizeController
  });

  final List<Widget> tabViewList;
  final List<String> tabTextList;
  final TabController? controller;
  final double tabBarWidth;
  final double tabBarHeight;
  final double? tabWidth;
  final bool tabScrollable;
  final double? tabViewWidth;
  final double? tabViewHeight;
  final Widget? tabBarFollowing;
  final bool? tabViewSwipable;
  final YrkSizeController? tabViewSizeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new YrkTabBar(
            textList: tabTextList,
            controller: controller!,
            width: tabBarWidth,
            height: tabBarHeight,
            tabWidth: tabWidth,
            tabScrollable: tabScrollable,
            following: tabBarFollowing),
        new YrkTabView(
          viewList: tabViewList,
          controller: controller!,
          width: tabViewWidth,
          height: tabViewHeight,
          swipeable: tabViewSwipable,
          sizeController: tabViewSizeController,
        )
      ],
    );
  }
}
