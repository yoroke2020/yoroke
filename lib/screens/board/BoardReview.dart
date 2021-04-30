import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/YrkCustomScrollView.dart';

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
  static final int boardCardListItemCount = 12;
  static final int tabLength = 2;

  late List<List<Widget>> _reviewFeedList;
  late List<int> _reviewFeedListItemCount;
  late int _curTabIndex;
  late int _curCardIndex;

  late final ScrollController _scrollController;
  late final TabController _tabController;

  get _getBoardReviewCardList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < boardCardListItemCount; i++) {
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

  @override
  Widget build(BuildContext context) {
    return YrkCustomScrollView(
      controller: _scrollController,
      appBarHeight: 48.0,
      expandedHeight: 236.0,
      isFadedTitle: true,
      fadedTitle: "요양병원 후기",
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackAll,
        onPushNavigator: widget.onPushNavigator!,
        isStatusBar: false,
      ),
      flexibleSpaceHeight: 196.0,
      flexibleSpace: Container(
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
                  item: _getBoardReviewCardList,
                  itemCount: boardCardListItemCount,
                ),
              ],
            ),
          ),
      bottomHeight: 40.0,
      bottom: YrkTabBar(
              textList: ["최신글", "인기글"],
              tabWidth: 72,
              height: 40.0,
              controller: _tabController),
      body: YrkTabView(
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
      ),
      bottomNavigatorBar: BottomBarNavigation.getInstance(RootPageItem.board),
    );
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
        subPageItem: SubPageItem.post,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
  }

  void _onPushChangeReviewCard(YrkData data) {
    print("onPushChangeReviewCard");
    setState(() {
      _tabController.index = 0;
      _initBoardReviewState();
      _curCardIndex = data.i1!;
    });
  }
}
