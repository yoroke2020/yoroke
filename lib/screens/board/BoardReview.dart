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

  late var _reviewFeedList;
  late List<int> _reviewFeedListItemCount;
  late int _curTabIndex;
  late int _curCardIndex;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _reviewFeedList = [<Widget>[], <Widget>[]];
    _reviewFeedListItemCount = [loadPageCount, loadPageCount];
    _initBoardReviewState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  void _initBoardReviewState() {
    for (int i = 0; i < 2; i++) {
      _buildReviewTabViewListItem(i, 0, loadPageCount);
      _reviewFeedListItemCount[i] = loadPageCount;
    }
    _curTabIndex = 0;
    _curCardIndex = 0;
  }

  void _loadMoreData() {
    print("loadMoreData at curTabIndex = " + _curTabIndex.toString());
    setState(() {
      if (_reviewFeedListItemCount[_curTabIndex] >= _reviewFeedList.length) {
        //TODO: 추후 API 갯수 카운트 후 몇개씩 로드할 것인지 정해야 함
        _buildReviewTabViewListItem(_curTabIndex, 0, loadPageCount);
        _reviewFeedListItemCount[_curTabIndex] += loadPageCount;
      }
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
      for (int i = 0; i < 2; i++)
        _reviewFeedList[i].removeRange(0, _reviewFeedList[i].length);
      _initBoardReviewState();
      _curCardIndex = data.i1!;
    });
  }

  void onChangedCurTabIndex(int index) {
    print("onChangedCurTabIndex");
    setState(() {
      _curTabIndex = index;
      _reviewFeedListItemCount[_curTabIndex] = loadPageCount;
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
        SliverToBoxAdapter(
            child: YrkTabBarView(
                length: 2,
                tabTextList: ["최신글", "인기글"],
                tabWidth: 72,
                tabBarViewHeight: 65.0 * _reviewFeedListItemCount[_curTabIndex],
                onChanged: (index) => onChangedCurTabIndex(index),
                tabViewList: [
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
                ]))
      ]),
      bottomNavigationBar: BottomBarNavigation.getInstance(RootPageItem.board),
    );
  }
}
