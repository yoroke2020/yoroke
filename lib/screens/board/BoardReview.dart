import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkScrollFadedWidget.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/AppBarNormalArrowBack.dart';
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

  late final ScrollController _scrollController;
  late final TabController _tabController;

  late List<Widget> _popularReviewFeedList;
  late List<Widget> _newReviewFeedList;
  late int _popularReviewFeedListItemCount;
  late int _newReviewFeedListItemCount;
  late int _curTabIndex;
  late int _curCardIndex;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _popularReviewFeedList = <Widget>[];
    _newReviewFeedList = <Widget>[];
    _initBoardReviewState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  void _initBoardReviewState() {
    _popularReviewFeedList.removeRange(0, _popularReviewFeedList.length);
    _newReviewFeedList.removeRange(0, _newReviewFeedList.length);
    _buildReviewTabViewListItem(_popularReviewFeedList, 0, 0, loadPageCount);
    _buildReviewTabViewListItem(_newReviewFeedList, 1, 0, loadPageCount);
    _popularReviewFeedListItemCount = loadPageCount;
    _newReviewFeedListItemCount = loadPageCount;
    _curTabIndex = 0;
    _curCardIndex = 0;
  }

  void _loadMoreData() {
    setState(() {
      if (_curTabIndex == 0) {
        print("length = " +
            _popularReviewFeedList.length.toString() +
            " itemCount = " +
            _popularReviewFeedListItemCount.toString());
        if (_popularReviewFeedListItemCount >= _popularReviewFeedList.length)
          //TODO: 추후 API 갯수 카운트 후 몇개씩 로드할 것인지 정해야 함
          // _buildReviewTabViewListItem(_popularReviewFeedList, 0,
          //     _popularReviewFeedListItemCount, _newReviewFeedListItemCount + loadPageCount);
          _buildReviewTabViewListItem(
              _popularReviewFeedList, 0, 0, loadPageCount);
        _popularReviewFeedListItemCount += loadPageCount;
      } else {
        if (_newReviewFeedListItemCount >= _newReviewFeedList.length)
          //TODO: 추후 API 갯수 카운트 후 몇개씩 로드할 것인지 정해야 함
          // _buildReviewTabViewListItem(_newReviewFeedList, 1,
          //     _newReviewFeedListItemCount, _newReviewFeedListItemCount + loadPageCount);
          _buildReviewTabViewListItem(_newReviewFeedList, 1, 0, loadPageCount);
        _newReviewFeedListItemCount += loadPageCount;
      }
    });
  }

  List<Widget> _buildReviewTabViewListItem(
      List<Widget> list, int pageIndex, int start, int end) {
    for (int i = start; i < end; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        subPageItem: SubPageItem.boardReviewFeed,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
    return list;
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
    setState(() {
      _initBoardReviewState();
      _curCardIndex = data.i1!;
      _tabController.animateTo(0);
    });
  }

  void onTapSetCurTabIndex(int index) {
    setState(() {
      _curTabIndex = index;
      if (_curTabIndex == 0)
        _popularReviewFeedListItemCount = loadPageCount;
      else
        _newReviewFeedListItemCount = loadPageCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          snap: false,
          pinned: true,
          floating: false,
          centerTitle: false,
          titleSpacing: 0.0,
          toolbarHeight: 48.0,
          title: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Stack(
                children: <Widget>[
                  AppBarNormalArrowBack(),
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
        ),
        SliverToBoxAdapter(
            child: Column(
          children: <Widget>[
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
        )),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return YrkTabBarView(
              length: 2,
              tabTextList: ["최신글", "인기글"],
              tabSize: 72,
              tabController: _tabController,
              height: _curTabIndex == 0
                  ? 65.0 * _popularReviewFeedListItemCount
                  : 65.0 * _newReviewFeedListItemCount,
              onTap: (index) => onTapSetCurTabIndex(index),
              tabViewList: [
                YrkListView(
                    index: 0,
                    itemCount: _popularReviewFeedListItemCount,
                    isIndicator: true,
                    item: _popularReviewFeedList),
                YrkListView(
                    index: 1,
                    itemCount: _newReviewFeedListItemCount,
                    isIndicator: true,
                    item: _newReviewFeedList),
              ]);
        }, childCount: 1))
      ]),
      bottomNavigationBar: BottomBarNavigation.getInstance(RootPageItem.board),
    );
  }
}
