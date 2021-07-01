import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/FacilityModel.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';
import 'package:yoroke/screens/find/model/FindSortOption.dart';
import 'package:yoroke/temp/YrkTestModelData.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';

import 'FindLocationData.dart';
import 'FindLocationSetting.dart';
import 'model/FindFacilityPost.dart';

class Find extends StatefulWidget {
  Find();

  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> with ScreenState<YrkBlock2> {
  List<Tuple2<String, int>> tabs = [];
  List<List<Widget>> posts = [];

  final ScrollController _scrollController = ScrollController();

  StringBuffer _locBuffer = StringBuffer("지역 선택");
  List<List<bool>> _locSelects = [];
  int _locCount = 0;

  int optionIndex = 0;

  @override
  void initBlock() {
    Map<String, dynamic> jsonResponse = TestFindData().jsonResponse;
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    String title = apiResponse.title ?? "";
    List<YrkBlock2> blocks = apiResponse.body!;
    this.block = YrkBlock2()..blocks = blocks;
    this.block.title = title;
  }

  @override
  void updateBlockOn(String action) {
    int index = int.parse(action);
    setState(() {
      Map<String, dynamic> jsonResponse = TestFindData().jsonResponse;
      YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
      YrkBlock2 block = (apiResponse.body ?? [])[1];
      posts[index].addAll(_buildPosts(block.blocks![index]));
    });
  }

  @override
  void initState() {
    super.initState();
    initBlock();
    _loadItems();
    for (int i = 0; i < LocName.cities.length; i++)
      _locSelects.add(List<bool>.filled(LocName.cities[i].length, false));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarNavigation.getInstance(RootPageItem.find),
      body: DefaultTabController(
        length: tabs.length,
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
                            label: "시설찾기"),
                        bottom: PreferredSize(
                            preferredSize: Size.fromHeight(88.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // [2] - Select Location
                                  GestureDetector(
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
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  color:
                                                      const Color(0xfff5df4d),
                                                  clickable: false,
                                                ),
                                                Text(
                                                  _locBuffer.toString(),
                                                  style: const YrkTextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                  CustomTapBar(tabs: tabs, isScrollable: true),
                                  // [4] - Options for TabView
                                ]))))
              ];
            },
            body: TabBarView(
                children: tabs.map((Tuple2 tab) {
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
                                  child: FindSortOption(
                                      block: this.block.blocks![0],
                                      onPressed: (index) =>
                                          _onPressedOptionButton(index))),
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
                                return posts[tab.item2][index];
                              }, childCount: posts[tab.item2].length))
                            ]));
                  }));
            }).toList())),
      ),
    );
  }

  void _loadItems() {
    YrkBlock2 tabBlock = this.block.blocks![1] as YrkBlock2;
    for (int i = 0; i < tabBlock.blocks!.length; i++) {
      List<Widget> items = _buildPosts(tabBlock.blocks![i]);
      tabs.add(Tuple2(tabBlock.blocks![i].title, i));
      posts.add(items);
    }
  }

  List<Widget> _buildPosts(YrkBlock2 block) {
    List items = block.items!.cast<FacilityModel>();
    return items.map((model) => FindFacilityPost(model: model)).toList();
  }

  bool _onScrollNotification(ScrollNotification notification, int index) {
    if (notification is! ScrollEndNotification) return false;

    if (notification.metrics.extentBefore ==
        notification.metrics.maxScrollExtent) {
      setState(() {
        updateBlockOn("$index");
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
      optionIndex = optionIndex;
      print("hello");
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
