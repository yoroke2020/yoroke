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

class _BoardReviewState extends State<BoardReview> {
  final ScrollController _scrollController = ScrollController();
  final int bardCardListItemCount = 12;

  static final int loadPageCount = 20;
  late List<Widget> _popularReviewFeedList;
  late List<Widget> _newReviewFeedList;
  int _popularReviewFeedListItemCount = loadPageCount;
  int _newReviewFeedListItemCount = loadPageCount;
  int _curTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _popularReviewFeedList = <Widget>[];
    _newReviewFeedList = <Widget>[];
    _buildReviewTabViewListItem(_popularReviewFeedList, 0, 0, loadPageCount);
    _buildReviewTabViewListItem(_newReviewFeedList, 1, 0, loadPageCount);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
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
          _buildReviewTabViewListItem(_popularReviewFeedList, 0, 0, loadPageCount);
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
        onPushNavigator: widget.onPushNavigator,
      ));
    }
    return list;
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
