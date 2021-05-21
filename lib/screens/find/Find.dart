import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

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
  static final List<String> _optionStrings = [
    "별점 높은 순",
    "시설 등급 순",
    "가까운 순",
    "후기 많은 순"
  ];
  static final int unselectedOptionAll = -1;

  final List<Tuple2<String, int>> _tabs = <Tuple2<String, int>>[
    Tuple2('요양원', 0),
    Tuple2('요양병원', 1),
    Tuple2('요양원', 2),
    Tuple2('요양병원', 3),
    Tuple2('요양병원', 4),
  ];

  List<int> _childCount = [10, 10, 10, 10, 10];

  final ScrollController _scrollController = ScrollController();

  FindLocationData locationData = new FindLocationData();
  late String _locationText = "지역 선택";

  late List<Widget> _tabViewOptions;
  late int _tabViewOptionIndex = unselectedOptionAll;

  get tabViewOptions {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(
        Padding(
          padding: EdgeInsets.only(
              left: i == 0 ? 16.0 : 3.5, right: i == 3 ? 16.0 : 3.0),
          child: YrkButton(
            width: i != 2 ? 80.0 : 66.0,
            height: 32.0,
            buttonType: ButtonType.outlinechip,
            borderWidth: 1,
            fillColor: i == _tabViewOptionIndex
                ? const Color(0xfff5df4d)
                : const Color(0xffffffff),
            borderColor: i == _tabViewOptionIndex
                ? const Color(0xfff5df4d)
                : const Color(0x4d000000),
            label: _optionStrings[i],
            textStyle: YrkTextStyle(
                color: i == _tabViewOptionIndex
                    ? const Color(0xe6000000)
                    : const Color(0x99000000),
                fontSize: 13.0),
            onPressed: () => _onPressedOptionButton(i),
          ),
        ),
      );
    }
    return list;
  }

  @override
  void initState() {
    _tabViewOptions = tabViewOptions;
    super.initState();
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
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                            automaticallyImplyLeading: false,
                            snap: false,
                            pinned: true,
                            floating: false,
                            centerTitle: false,
                            titleSpacing: 0.0,
                            shadowColor: const Color(0xffffffff),
                            elevation: 0.0,
                            toolbarHeight: 192.0,
                            expandedHeight: 192.1,
                            backgroundColor: const Color(0xffffffff),
                            forceElevated: innerBoxIsScrolled,
                            title: PreferredSize(
                              preferredSize: Size.fromHeight(192.0),
                              child: Column(children: [
                                //  [1] - AppBar
                                YrkAppBar(
                                  type: YrkAppBarType.TextSearch,
                                  label: "시설찾기",
                                ),
                                // [2] - Select Location
                                InkWell(
                                  onTap: () {
                                    showFindLocationSetting(
                                        context: context,
                                        statusBarHeight:
                                        MediaQuery.of(context).padding.top,
                                        locationData: locationData,
                                        onPressedSaveButton: (data) =>
                                            _onPressedLocationSaveButton(data));
                                  },
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
                                            icon:
                                            "assets/icons/icon_find_facility_24_px.svg",
                                            width: 24.0,
                                            height: 24.0,
                                            padding:
                                            EdgeInsets.only(right: 8.0),
                                            color: const Color(0xfff5df4d),
                                            clickable: false,
                                          ),
                                          Text(
                                            _locationText,
                                            style: const YrkTextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.0),
                                          ),
                                          YrkIconButton(
                                            icon:
                                            "assets/icons/icon_navigate_next_24_px.svg",
                                            width: 24.0,
                                            height: 24.0,
                                            padding: EdgeInsets.only(left: 6.0),
                                            clickable: false,
                                          ),
                                        ],
                                      )),
                                ),
                                // [3] - TabBar
                                CustomTapBar(
                                  tabs: _tabs,
                                  isScrollable: true,
                                ),
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
                                        children: _tabViewOptions,
                                      ),
                                    )),
                              ]),
                            )))
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
                                            .sliverOverlapAbsorberHandleFor(
                                            context),
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
                    }).toList())));
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

  void _onPressedLocationSaveButton(FindLocationData data) {
    locationData = data;
    setState(() {
      int totalCityCount = 0;
      _locationText = "";
      if (locationData.selectedCityCount > 0) {
        for (int i = 0; i < locationData.regionListLength; i++) {
          RegionData regionData = locationData.regionList[i];
          if (regionData.isSelected) {
            totalCityCount++;
            if (_locationText.isEmpty)
              _locationText = LocationName.regionNameList[i];
          } else {
            SplayTreeSet<int> selectedCity = regionData.selectedCity;
            if (selectedCity.isNotEmpty) {
              if (_locationText.isEmpty)
                _locationText = LocationName.regionNameList[i] +
                    " " +
                    LocationName.cityNameList[i][selectedCity.first];
              totalCityCount += selectedCity.length;
            }
          }
        }

        if (totalCityCount > 1) {
          _locationText += " 외 " + (totalCityCount - 1).toString() + "곳";
        }
      } else
        _locationText = "지역 선택";
    });
  }

  void _onPressedOptionButton(int index) {
    setState(() {
      _tabViewOptionIndex =
      _tabViewOptionIndex == index ? unselectedOptionAll : index;
      //TODO: LoadData
    });
  }
}
