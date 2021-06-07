import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/board/model/BoardReviewBlock.dart';
import 'package:yoroke/screens/board/model/ReviewPostApiResponse.dart';
import 'package:yoroke/screens/board/model/ReviewPostBlock.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'BoardReviewCard.dart';
import 'model/ReviewCardApiResponse.dart';

class BoardReview extends StatefulWidget {
  BoardReview({@deprecated this.data, this.index = 0});

  final YrkData? data;
  final int index;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<BoardReview> {
  final ScrollController _scrollController = ScrollController();

  late int _curIndex;
  late BoardReviewBlock _boardReviewBlock;
  late ReviewPostBlock _reviewCardBlock;

  List<Tuple2<String, int>> _tabs = [];
  List<List<Widget>> _postItems = [];
  List<int> _postItemCounts = [];

  @override
  // TODO: implement block
  BoardReviewBlock get block => this.block;

  @override
  // TODO: implement reqCtx
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  BoardReviewBlock makeBlock(YrkRequestContext reqCtx) {
    BoardReviewBlock boardReviewBlock = BoardReviewBlock();
    // boardReviewBlock.blocks = <YrkBlock>[];
    boardReviewBlock.title = "후기";

    ReviewPostBlock block = ReviewPostBlock();
    Map<String, dynamic> jsonResponse = TestReviewPostData().jsonResponse;
    YrkApiResponse apiResponse = ReviewPostApiResponse.fromJson(jsonResponse);
    List<YrkModel> items = (apiResponse as ReviewPostApiResponse).reviewPosts;
    block.items = items as List<YrkListItemV2Model>;
    block.title = "최신글";
    // boardReviewBlock.blocks!.add(block);

    block = ReviewPostBlock();
    jsonResponse = TestReviewPostData().jsonResponse;
    apiResponse = ReviewPostApiResponse.fromJson(jsonResponse);
    items = apiResponse.reviewPosts;
    block.items = items;
    block.title = "인기글";
    // boardReviewBlock.blocks!.add(block);

    //TODO: ReqCtx로 받아서 하는 방법으로 변경
    block = ReviewPostBlock();
    jsonResponse = TestReviewCardData().jsonResponse;
    apiResponse = ReviewCardApiResponse.fromJson(jsonResponse);
    List<BoardReviewCardModel> cardItems =
        (apiResponse as ReviewCardApiResponse).reviewCards;
    block.items = cardItems;
    // boardReviewBlock.blocks!.add(block);

    return boardReviewBlock;
  }

  void _loadItems() {
    _boardReviewBlock = makeBlock(reqCtx);
    //TODO: ReqCtx로 받아서 하는 방법으로 변경 후 주석처리 해제
    // for (int i = 0; i < _boardReviewBlock.blocks!.length; i++) {
    for (int i = 0; i < 2; i++) {
      ReviewPostBlock block = _boardReviewBlock.blocks![i] as ReviewPostBlock;
      List<Widget> items = _buildItems(block.type, block.items!);
      _tabs.add(Tuple2(block.title, i));
      _postItems.add(items);
      _postItemCounts.add(items.length);
    }
  }

  void _loadMoreItems(int index) {
    setState(() {
      Map<String, dynamic> jsonResponse = TestReviewPostData().jsonResponse;
      YrkApiResponse apiResponse = ReviewPostApiResponse.fromJson(jsonResponse);
      List<YrkModel> items = (apiResponse as ReviewPostApiResponse).reviewPosts;
      _postItems[index]
          .addAll(_buildItems(_boardReviewBlock.blocks![index].type, items));
      _postItemCounts[index] = _postItems[index].length;
    });
  }

  @override
  void initState() {
    super.initState();
    _curIndex = widget.index;
    _loadItems();
    _reviewCardBlock = _boardReviewBlock.blocks![2] as ReviewPostBlock;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: _tabs.length,
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
                                expandedHeight: 236.0,
                                backgroundColor: const Color(0xffffffff),
                                title: Stack(children: <Widget>[
                                  YrkAppBar(
                                    type: YrkAppBarType.arrowBackAll,
                                    curPageItem: "boardReview",
                                    isStatusBar: false,
                                  ),
                                  YrkScrollOpacity(
                                      scrollController: _scrollController,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(left: 48.0),
                                          height: 48.0,
                                          child: Text("요양병원 후기",
                                              style: const YrkTextStyle(
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.left)))
                                ]),
                                flexibleSpace: YrkScrollOpacity(
                                    scrollController: _scrollController,
                                    reversed: true,
                                    child: FlexibleSpaceBar(
                                        background: Container(
                                            color: const Color(0xffffffff),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 48.0 +
                                                        MediaQuery.of(context)
                                                            .padding
                                                            .top,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16.0,
                                                        top: 8.0,
                                                        bottom: 8.0),
                                                    child: Text("후기",
                                                        style:
                                                            const YrkTextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 22.0),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                  // BoardReviewCards(
                                                  //     index: _curIndex,
                                                  //     onTap: (index) =>
                                                  //         _onTapReviewCard(
                                                  //             context, index),
                                                  //     models: _reviewCardBlock
                                                  //             .items
                                                  //         as List<
                                                  //             BoardReviewCardModel>)
                                                ])))),
                                forceElevated: innerBoxIsScrolled,
                                bottom:
                                    CustomTapBar(tabs: _tabs, tabWidth: 72.0)))
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
                                        (BuildContext context, int index) {
                                          return _postItems[tab.item2][index];
                                        },
                                        childCount: _postItemCounts[tab.item2],
                                      ))
                                    ]));
                          }));
                    }).toList())))),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
  }

  List<Widget> _buildItems(String type, List<YrkModel> items) {
    return items
        .cast<YrkListItemV2Model>()
        .map((model) => YrkPageListItemV2(type: type, model: model))
        .toList();
  }

  bool _onScrollNotification(ScrollNotification notification, int index) {
    if (notification is! ScrollEndNotification) return false;

    if (notification.metrics.extentBefore ==
        notification.metrics.maxScrollExtent) {
      setState(() {
        _loadMoreItems(index);
      });
    }
    return true;
  }

  void _onTapReviewCard(BuildContext context, int index) {
    if (_curIndex != index)
      setState(() {
        _curIndex = index;
        DefaultTabController.of(context)!.animateTo(0);
        _postItems.removeRange(0, _postItems.length);
        _postItemCounts.removeRange(0, _postItemCounts.length);
        _tabs.removeRange(0, _tabs.length);
        _loadItems();
      });
  }
}
