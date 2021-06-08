import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/core/model/YrkTestModelData.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/PostModel.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';

class BoardJob extends StatefulWidget {
  BoardJob();

  @override
  _BoardJobState createState() => _BoardJobState();
}

class _BoardJobState extends State<BoardJob>
    with ScreenState<YrkBlock2> {
  final ScrollController _scrollController = ScrollController();

  List<Tuple2<String, int>> tabs = [];
  List<List<Widget>> posts = [];

  @override
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  void initBlock() {
    Map<String, dynamic> jsonResponse = TestBoardJobData().jsonResponse;
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    String type = apiResponse.type ?? "";
    String title = apiResponse.title ?? "";
    List<YrkBlock2> blocks = apiResponse.body ?? [];
    this.block = YrkBlock2()..blocks = blocks;
    this.block.type = type;
    this.block.title = title;
  }

  @override
  void updateBlockOn(String action) {
    int index = int.parse(action);
    setState(() {
      Map<String, dynamic> jsonResponse = TestBoardJobData().jsonResponse;
      YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
      YrkBlock2 block = (apiResponse.body ?? [])[0];
      posts[index].addAll(_buildPosts(block.blocks![index]));
    });
  }

  @override
  void initState() {
    super.initState();
    initBlock();

    YrkBlock2 tabBlock = this.block.blocks![0] as YrkBlock2;
    print(tabBlock.blocks!.length);
    for (int i = 0; i < tabBlock.blocks!.length; i++) {
      List<Widget> items = _buildPosts(tabBlock.blocks![i]);
      tabs.add(Tuple2(tabBlock.blocks![i].title, i));
      posts.add(items);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: tabs.length,
            child: Scaffold(
                body: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverOverlapAbsorber(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
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
                                toolbarHeight: 48.0,
                                expandedHeight: 144.0,
                                backgroundColor: const Color(0xffffffff),
                                title: Stack(children: <Widget>[
                                  YrkAppBar(
                                    type: YrkAppBarType.arrowBackAll,
                                    curPageItem: "boardJobFinding",
                                    isStatusBar: false,
                                  ),
                                  YrkScrollOpacity(
                                      scrollController: _scrollController,
                                      child: Container(
                                          height: 48.0,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(left: 48.0),
                                          child: Text(this.block.title ?? "",
                                              style: const YrkTextStyle(
                                                  color:
                                                      const Color(0xe6000000),
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.left)))
                                ]),
                                flexibleSpace: FlexibleSpaceBar(
                                    background: Container(
                                        color: const Color(0xffffffff),
                                        child: Column(children: <Widget>[
                                          Container(
                                            width: double.maxFinite,
                                            height: 48.0 +
                                                MediaQuery.of(context)
                                                    .padding
                                                    .top,
                                          ),
                                          Container(
                                              width: double.maxFinite,
                                              height: 48.0,
                                              margin:
                                                  EdgeInsets.only(left: 16.0),
                                              child: Text(
                                                  this.block.title ?? "",
                                                  style: const YrkTextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 22.0),
                                                  textAlign: TextAlign.left)),
                                        ]))),
                                forceElevated: innerBoxIsScrolled,
                                bottom:
                                    CustomTapBar(tabs: tabs, tabWidth: 72.0)))
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
                                    _onScrollNotification(
                                        notification, tab.item2),
                                child: CustomScrollView(
                                    key: PageStorageKey<String>(tab.item1),
                                    slivers: <Widget>[
                                      SliverOverlapInjector(
                                        handle: NestedScrollView
                                            .sliverOverlapAbsorberHandleFor(
                                                context),
                                      ),
                                      SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                              (BuildContext context,
                                                  int index) {
                                        return posts[tab.item2][index];
                                      }, childCount: posts[tab.item2].length))
                                    ]));
                          }));
                    }).toList())))),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
  }

  List<Widget> _buildPosts(YrkBlock2 block) {
    List items = block.items!.cast<PostModel>();
    return items.map((model) => YrkPageListItemV2(model: model)).toList();
  }

  bool _onScrollNotification(ScrollNotification notification, int index) {
    if (notification is! ScrollEndNotification) return false;

    if (notification.metrics.extentBefore ==
        notification.metrics.maxScrollExtent) {
      updateBlockOn("$index");
    }
    return true;
  }
}
