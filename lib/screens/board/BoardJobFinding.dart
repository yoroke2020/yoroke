import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/PostModel.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/board/model/BoardJobFindingBlock.dart';
import 'package:yoroke/screens/board/model/JobFindingPostApiResponse.dart';
import 'package:yoroke/screens/board/model/JobFindingPostBlock.dart';
import 'package:yoroke/screens/common/YrkListItem.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';

class BoardJobFinding extends StatefulWidget {
  BoardJobFinding();

  @override
  _BoardJobFindingState createState() => _BoardJobFindingState();
}

class _BoardJobFindingState extends State<BoardJobFinding>
    {
  final ScrollController _scrollController = ScrollController();

  late BoardJobFindingBlock boardJobFindingBlock;

  List<Tuple2<String, int>> tabs = [];
  List<List<Widget>> postItems = [];
  List<int> postItemCounts = [];

  @override
  // TODO: implement block
  BoardJobFindingBlock get block => this.block;

  @override
  // TODO: implement reqCtx
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  BoardJobFindingBlock makeBlock(YrkRequestContext reqCtx) {
    BoardJobFindingBlock boardJobFindingBlock = BoardJobFindingBlock();
    boardJobFindingBlock.blocks = <YrkBlock>[];
    boardJobFindingBlock.title = "구인구직";

    JobFindingPostBlock block = JobFindingPostBlock();
    Map<String, dynamic> jsonResponse = TestJobFindingInternalPostData().jsonResponse;
    YrkApiResponse apiResponse =
        JobFindingPostApiResponse.fromJson(jsonResponse);
    List<YrkModel> items =
        (apiResponse as JobFindingPostApiResponse).jobFindingPosts;
    block.items = items as List<YrkListItemV2Model>;
    block.title = "구인";
    boardJobFindingBlock.blocks!.add(block);

    block = JobFindingPostBlock();
    jsonResponse = TestJobFindingInternalPostData().jsonResponse;
    apiResponse = JobFindingPostApiResponse.fromJson(jsonResponse);
    items = (apiResponse).jobFindingPosts;
    block.items = items;
    block.title = "구직";
    boardJobFindingBlock.blocks!.add(block);

    return boardJobFindingBlock;
  }

  void _loadMoreItems(int index) {
    setState(() {
      Map<String, dynamic> jsonResponse = TestJobFindingInternalPostData().jsonResponse;
      YrkApiResponse apiResponse =
          JobFindingPostApiResponse.fromJson(jsonResponse);
      List<YrkModel> items =
          (apiResponse as JobFindingPostApiResponse).jobFindingPosts;
      postItems[index].addAll(_buildItems(boardJobFindingBlock.blocks![index].type, items));
      postItemCounts[index] = postItems[index].length;
    });
  }

  @override
  void initState() {
    super.initState();
    boardJobFindingBlock = makeBlock(reqCtx);

    for(int i = 0; i < boardJobFindingBlock.blocks!.length; i++) {
      JobFindingPostBlock block = boardJobFindingBlock.blocks![i] as JobFindingPostBlock;
      List<Widget> items = _buildItems(block.type, block.items!);
      tabs.add(Tuple2(block.title, i));
      postItems.add(items);
      postItemCounts.add(items.length);
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
                                          child: Text(
                                              boardJobFindingBlock.title!,
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
                                                  boardJobFindingBlock.title!,
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
                                        return postItems[tab.item2][index];
                                      }, childCount: postItemCounts[tab.item2]))
                                    ]));
                          }));
                    }).toList())))),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
  }

  List<Widget> _buildItems(String type, List<YrkModel> items) {
    return items
        .cast<YrkListItemV2Model>()
        .map((model) => YrkPageListItemV2(type: type, model: PostModel()))
        .toList();
  }

  bool _onScrollNotification(ScrollNotification notification, int index) {
    if (notification is! ScrollEndNotification) return false;

    if (notification.metrics.extentBefore ==
        notification.metrics.maxScrollExtent) {
      _loadMoreItems(index);
    }
    return true;
  }
}
