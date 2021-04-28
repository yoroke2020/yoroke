import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkScrollFadedWidget.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'BoardCardListItem.dart';

class BoardReview extends StatefulWidget {
  BoardReview({Key? key, required this.data, required this.onPushNavigator})
      : super(key: key);

  YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<BoardReview>
    with TickerProviderStateMixin {
  static final int loadPageCount = 20;
  static final int bardCardListItemCount = 12;
  static final int tabLength = 2;

  late var _reviewFeedList;
  late List<int> _reviewFeedListItemCount;
  late int _curTabIndex;
  late int _curCardIndex;

  late final ScrollController _scrollController;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = new TabController(vsync: this, length: tabLength);

    _reviewFeedList = [<Widget>[], <Widget>[]];
    _reviewFeedListItemCount = [0, 0];
    _initBoardReviewState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });

    _tabController.addListener(() {
      setState(() {
        if (_tabController.indexIsChanging &&
            _scrollController.offset >= 148.0) {
          _scrollController.animateTo(148.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        }
        _curTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _initBoardReviewState() {
    for (int i = 0; i < tabLength; i++) {
      _reviewFeedList[i].removeRange(
          0, _reviewFeedList[i].length); //TODO: 좀 더 좋은 방법의 메모리 클리어 방법 고안 필요
      _buildReviewTabViewListItem(i, 0, loadPageCount);
      _reviewFeedListItemCount[i] = loadPageCount;
    }
    _curTabIndex = 0;
    _curCardIndex = 0;
  }

  void _loadMoreData() {
    setState(() {
      _buildReviewTabViewListItem(_curTabIndex, 0, loadPageCount);
      _reviewFeedListItemCount[_curTabIndex] += loadPageCount;
    });
  }

  void _buildReviewTabViewListItem(int pageIndex, int start, int end) {
    for (int i = start; i < end; i++) {
      _reviewFeedList[pageIndex].add(new YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        subPageItem: SubPageItem.boardReviewFeed,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
  }

  List<Widget> _buildBoardReviewCardList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < bardCardListItemCount; i++) {
      list.add(BoardCardListItem(
        width: 64.0,
        height: 76.0,
        index: i,
        isBorder: i == _curCardIndex ? true : false,
        onPushNavigator: (data) => _onPushChangeReviewCard(data),
      ));
    }
    return list;
  }

  void _onPushChangeReviewCard(YrkData data) {
    print("onPushChangeReviewCard");
    setState(() {
      _tabController.index = 0;
      _initBoardReviewState();
      _curCardIndex = data.i1!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarArrowBack(),
      body: CustomScrollView(controller: _scrollController, slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          snap: false,
          pinned: true,
          floating: false,
          centerTitle: false,
          titleSpacing: 0.0,
          toolbarHeight: 48.0,
          expandedHeight: 236.0,
          backgroundColor: const Color(0xffffffff),
          title: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: Stack(
                children: <Widget>[
                  YrkScrollFadedWidget(
                      scrollController: _scrollController,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 48.0),
                          height: 48.0,
                          child: Text("요양병원 후기",
                              style: const YrkTextStyle(
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left)))
                ],
              )),
          flexibleSpace: FlexibleSpaceBar(
              background: PreferredSize(
            preferredSize: Size.fromHeight(196.0),
            child: Container(
              color: const Color(0xffffffff),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    height: 48.0 + MediaQuery.of(context).padding.top,
                  ),
                  Container(
                      width: double.maxFinite,
                      height: 48.0,
                      margin: EdgeInsets.only(left: 16.0),
                      child: Text("후기",
                          style: const YrkTextStyle(
                              fontWeight: FontWeight.w700, fontSize: 22.0),
                          textAlign: TextAlign.left)),
                  YrkListView(
                    height: 100.0,
                    padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                    scrollable: true,
                    scrollDirection: Axis.horizontal,
                    item: _buildBoardReviewCardList(),
                    itemCount: bardCardListItemCount,
                  ),
                ],
              ),
            ),
          )),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: YrkTabBar(
                  textList: ["최신글", "인기글"],
                  tabWidth: 72,
                  height: 40.0,
                  controller: _tabController)),
        ),
        SliverToBoxAdapter(
            child: YrkTabView(
          height: 65.0 * _reviewFeedListItemCount[_curTabIndex],
          controller: _tabController,
          swipeable: true,
          viewList: [
            YrkListView(
                pageIndex: 0,
                itemCount: _reviewFeedListItemCount[0],
                isIndicator: true,
                item: _reviewFeedList[0]),
            YrkListView(
                pageIndex: 1,
                itemCount: _reviewFeedListItemCount[1],
                isIndicator: true,
                item: _reviewFeedList[1]),
          ],
        ))
      ]),
      bottomNavigationBar: BottomBarNavigation.getInstance(RootPageItem.board),
    );
  }
}
