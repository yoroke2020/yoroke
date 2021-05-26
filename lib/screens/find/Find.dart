import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';

import 'FindLocationData.dart';
import 'FindLocationSetting.dart';
import 'FindRecommendListItem.dart';

class Find extends StatefulWidget {
  Find({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> {
  static final List<String> _options = [
    "별점 높은 순",
    "시설 등급 순",
    "가까운 순",
    "후기 많은 순"
  ];

  final List<Tuple2<String, int>> _tabs = <Tuple2<String, int>>[
    Tuple2('요양원', 0),
    Tuple2('요양병원', 1),
    Tuple2('요양원', 2),
    Tuple2('요양병원', 3),
    Tuple2('요양병원', 4),
  ];

  List<int> _childCount = [10, 10, 10, 10, 10];

  final ScrollController _scrollController = ScrollController();

  StringBuffer _locBuffer = StringBuffer("지역 선택");
  List<List<bool>> _locSelects = [];
  int _locCount = 0;

  int _optionIndex = -1;

  get _optionButtons {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(Padding(
          padding: EdgeInsets.only(
              left: i == 0 ? 16.0 : 3.5, right: i == 3 ? 16.0 : 3.0),
          child: YrkButton(
              width: i != 2 ? 80.0 : 66.0,
              height: 32.0,
              buttonType: ButtonType.outlinechip,
              borderWidth: 1,
              fillColor: i == _optionIndex
                  ? const Color(0xfff5df4d)
                  : const Color(0xffffffff),
              borderColor: i == _optionIndex
                  ? const Color(0xfff5df4d)
                  : const Color(0x4d000000),
              label: _options[i],
              textStyle: YrkTextStyle(
                  color: i == _optionIndex
                      ? const Color(0xe6000000)
                      : const Color(0x99000000),
                  fontSize: 13.0),
              onPressed: () => _onPressedOptionButton(i))));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < LocName.cities.length; i++)
      _locSelects.add(List<bool>.filled(LocName.cities[i].length, false));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      snap: false,
                      pinned: true,
                      floating: false,
                      centerTitle: false,
                      titleSpacing: 0.0,
                      shadowColor: const Color(0xffffffff),
                      elevation: 0.0,
                      toolbarHeight: 48.0,
                      backgroundColor: const Color(0xffffffff),
                      forceElevated: innerBoxIsScrolled,
                      title: YrkAppBar(
                          //  [1] - AppBar
                          type: YrkAppBarType.TextSearch,
                          isStatusBar: false,
                          curPageItem: RootPageItem.find,
                          onPushNavigator: widget.onPushNavigator,
                          label: "시설찾기"),
                      bottom: PreferredSize(
                          preferredSize: Size.fromHeight(144.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // [2] - Select Location
                                InkWell(
                                    onTap: () => _onTapSelectLocation(),
                                    child: Container(
                                        width: double.maxFinite,
                                        height: 48.0,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              YrkIconButton(
                                                icon: "icon_location.svg",
                                                width: 24.0,
                                                height: 24.0,
                                                padding:
                                                    EdgeInsets.only(right: 8.0),
                                                color: const Color(0xfff5df4d),
                                                clickable: false,
                                              ),
                                              Text(
                                                _locBuffer.toString(),
                                                style: const YrkTextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18.0),
                                              ),
                                              YrkIconButton(
                                                  icon:
                                                      "icon_navigate_next.svg",
                                                  width: 24.0,
                                                  height: 24.0,
                                                  padding: EdgeInsets.only(
                                                      left: 6.0),
                                                  clickable: false)
                                            ]))),
                                // [3] - TabBar
                                CustomTapBar(tabs: _tabs, isScrollable: true),
                                // [4] - Options for TabView
                                Container(
                                    width: double.maxFinite,
                                    height: 56.0,
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: _optionButtons)))
                              ]))))
            ];
          },
          body: TabBarView(
              children: _tabs.map((Tuple2 tab) {
            return SafeArea(
                top: false,
                bottom: false,
                child: Builder(builder: (BuildContext context) {
                  return NotificationListener<ScrollNotification>(
                      onNotification: (notification) =>
                          _onScrollNotification(notification, tab.item2),
                      child: CustomScrollView(
                          key: PageStorageKey<String>(tab.item1),
                          slivers: <Widget>[
                            SliverOverlapInjector(
                              handle: NestedScrollView
                                  .sliverOverlapAbsorberHandleFor(context),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                  width: double.maxFinite,
                                  height: 48.0,
                                  padding: EdgeInsets.only(
                                      left: 16.0, bottom: 16.0, top: 8.0),
                                  child: Text("추천 시설",
                                      style: const YrkTextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0),
                                      textAlign: TextAlign.left)),
                            ),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                              return FindRecommendListItem(
                                pageIndex: tab.item2,
                                listIndex: index,
                                onPushNavigator: widget.onPushNavigator,
                              );
                            }, childCount: _childCount[tab.item2]))
                          ]));
                }));
          }).toList())),
    );
  }

  bool _onScrollNotification(ScrollNotification notification, int index) {
    if (notification is! ScrollEndNotification) return false;

    if (notification.metrics.extentBefore ==
        notification.metrics.maxScrollExtent) {
      setState(() {
        _childCount[index] += 10;
      });
    }
    return true;
  }

  void _onPressedLocationSaveButton() {
    setState(() {
      int cityCount = 0;
      _locBuffer.clear();
      for (int i = 0; i < _locSelects.length; i++) {
        if (_locSelects[i][0]) {
          cityCount += 1;
          _locBuffer.write(_locBuffer.isEmpty ? LocName.cities[i][0] : "");
          continue;
        }
        for (int j = 1; j < _locSelects[i].length; j++) {
          if (_locSelects[i][j]) {
            cityCount++;
            _locBuffer.write(_locBuffer.isEmpty ? LocName.cities[i][0] : "");
          }
        }
      }

      _locBuffer.write(cityCount > 1
          ? ' 외 ${(cityCount - 1)} 곳'
          : _locBuffer.isEmpty
              ? "지역 선택"
              : "");
    });
  }

  void _onPressedOptionButton(int index) {
    setState(() {
      _optionIndex = _optionIndex == index ? -1 : index;
      //TODO: LoadData
    });
  }

  void _onTapSelectLocation() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FindLocationSetting(
                locSelects: _locSelects, locCount: _locCount)));
    if (result != null) {
      _locSelects = result;
      print(_locSelects);
      _onPressedLocationSaveButton();
    }
  }
}
