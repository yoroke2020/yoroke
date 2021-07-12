import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/BoardTabsModel.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/temp/YrkTestModelData.dart';
import 'package:yoroke/views/community/CommunityPreviewPost.dart';

class Community extends StatefulWidget {
  Community();

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> with ScreenState<YrkBlock2> {
  List<Tuple2<String, int>> tabs = [];
  List<List<Widget>> posts = [];
  List<List<Widget>> bestPosts = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initBlock() {
    Map<String, dynamic> jsonResponse = TestCommunityData().jsonResponse;
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    List<YrkBlock2> blocks = apiResponse.body!;
    this.block = YrkBlock2()..blocks = blocks;
  }

  @override
  void updateBlockOn(String action) {
    print(action);
    // int index = int.parse(action);
    // setState(() {
    //   Map<String, dynamic> jsonResponse = TestFindData().jsonResponse;
    //   YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    //   YrkBlock2 block = (apiResponse.body ?? [])[1];
    //   posts[index].addAll(_buildPosts(block.blocks![index]));
    // });
  }

  @override
  void initState() {
    super.initState();
    initBlock();
    _loadItems();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
            () {
              setState(() {
                updateBlockOn("pullToRefresh");
              });
            },
          );
        },
        child: Scaffold(
          bottomNavigationBar:
              BottomBarNavigation.getInstance(RootPageItem.community),
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
                                curPageItem: RootPageItem.community,
                                label: "커뮤니티"),
                            bottom: PreferredSize(
                                preferredSize: Size.fromHeight(48.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // [1] - TabBar
                                      CustomTapBar(
                                          tabs: tabs, isScrollable: true),
                                    ]))))
                  ];
                },
                body: TabBarView(
                    children: tabs.map((Tuple2 tab) {
                  return Builder(builder: (BuildContext context) {
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
                              ..._buildCustomScrollViewSilvers(tab),
                            ]));
                  });
                }).toList())),
          ),
        );
  }

  void _loadItems() {
    // tabs
    YrkBlock2 tabsBlock = this.block.blocks![1] as YrkBlock2;
    BoardTabsModel tabsModel = tabsBlock.items![0] as BoardTabsModel;

    for (int i = 0; i < tabsModel.boards!.length; i++) {
      bool isBestTab = i == 0 ? true : false;
      tabs.add(Tuple2(tabsModel.boards![i].boardLabel!, i));
      List<Widget> previewPosts =
          _buildPreviewPosts(tabsBlock.blocks![i], isBestTab);
      List<Widget> previewBestPosts =
          _buildPreviewPosts(tabsBlock.blocks![i], isBestTab, isBestPost: true);
      posts.add(previewPosts);
      bestPosts.add(previewBestPosts);
    }
  }

  List<Widget> _buildPreviewPosts(YrkBlock2 block, bool isBestTab,
      {bool isBestPost = false}) {
    return isBestTab
        ? _buildBestTabPreviewPostFrom(block)
        : _buildPreviewPostFrom(block, isBestPost: isBestPost);
  }

  List<Widget> _buildBestTabPreviewPostFrom(YrkBlock2 block) {
    List<Widget> list = <Widget>[];
    block.blocks!
        .cast<YrkBlock2>()
        .where((innerBlock) => innerBlock.type == 'boardSection')
        .forEach((innerBlock) => list.addAll(innerBlock.items!
            .map((item) => CommunityPreviewPost(model: item, isBestTab: true))
            .toList()));
    return list;
  }

  List<Widget> _buildPreviewPostFrom(YrkBlock2 block,
      {bool isBestPost = false}) {
    List<Widget> list = <Widget>[];
    block.blocks!
        .cast<YrkBlock2>()
        .where((innerBlock) => innerBlock.type == 'boardSection')
        .where((innerBlock) =>
            (isBestPost && (innerBlock.title == '인기글')) ||
            (!isBestPost && (innerBlock.title == '전체글')))
        .forEach((innerBlock) => list.addAll(innerBlock.items!
            .map((item) => CommunityPreviewPost(model: item, isBestTab: false))
            .toList()));
    return list;
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

  List<Widget> _buildCustomScrollViewSilvers(Tuple2 tab) {
    List<Widget> widgetList = <Widget>[];
    bool isBestTab = tab.item2 == 0 ? true : false;
    if (!isBestTab) {
      widgetList.add(SliverToBoxAdapter(
        child: Column(
          children: [
            YrkTabHeaderView(title: "인기글"),
            Container(
              width: double.maxFinite,
              height: 199.0,
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              decoration: BoxDecoration(
                  // color: const Color(0xF4F4F4)
                  color: const Color(0xFFBDBDBD)),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bestPosts[tab.item2].length,
                itemBuilder: (context, index) {
                  return bestPosts[tab.item2][index];
                },
              ),
            )
          ],
        ),
      ));
      widgetList.add(SliverToBoxAdapter(
        child: Column(
          children: [YrkTabHeaderView(title: "전체글")],
        ),
      ));
    }
    widgetList.add(SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return posts[tab.item2][index];
    }, childCount: posts[tab.item2].length)));
    return widgetList;
  }
}
