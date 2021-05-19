import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkScrollFadedWidget.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

import 'BoardCardListItem.dart';

class BoardReview extends StatefulWidget {
  BoardReview({Key? key, required this.data, required this.onPushNavigator})
      : super(key: key);

  final YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<BoardReview> with TickerProviderStateMixin {
  static final int loadPageCount = 20;
  static final int boardCardListItemCount = 12;
  static final int tabLength = 2;

  late List<Widget> _reviewCardList;
  late List<List<Widget>> _reviewFeedList;
  late List<int> _reviewFeedListItemCount;
  late int _curTabIndex;
  late int _curCardIndex = 0;

  late final ScrollController _scrollController;
  late final TabController _tabController;

  get _getReviewCardList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < boardCardListItemCount; i++) {
      list.add(BoardCardListItem(
        index: i,
        listLength: boardCardListItemCount,
        isBorder: i == _curCardIndex ? true : false,
        onPushNavigator: (data) => _onPushChangeReviewCard(data),
      ));
    }
    return list;
  }

  get _getReviewFeedList {
    List<Widget> list = <Widget>[];
    for(int i = 0; i < tabLength; i++) {
      list.add(ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _reviewFeedListItemCount[i],
        itemBuilder: (BuildContext context, int index) {
          return _reviewFeedList[i][index];
        },
      ));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = new TabController(vsync: this, length: tabLength);

    _reviewCardList = _getReviewCardList;
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
    return Material(
      child: CustomScrollView(controller: _scrollController, slivers: <Widget>[
        SliverAppBar(
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
            title: Stack(
              children: <Widget>[
                YrkAppBar(
                  type: YrkAppBarType.arrowBackAll,
                  onPushNavigator: widget.onPushNavigator!,
                  curPageItem: SubPageItem.boardReview,
                  isStatusBar: false,
                ),
                YrkScrollFadedWidget(
                    scrollController: _scrollController,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 48.0),
                        height: 48.0,
                        child: Text("요양병원 후기",
                            style:
                            const YrkTextStyle(fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left)))
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xffffffff),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 48.0 + MediaQuery.of(context).padding.top,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                      child: Text("후기",
                          style: const YrkTextStyle(
                              fontWeight: FontWeight.w700, fontSize: 22.0),
                          textAlign: TextAlign.left),
                    ),
                    Container(
                      height: 100.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: boardCardListItemCount,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 16.0);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return _reviewCardList[index];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
                child: YrkTabBar(
                    textList: ["최신글", "인기글"],
                    tabWidth: 72,
                    height: 40.0,
                    controller: _tabController),
                preferredSize: Size.fromHeight(40.0))),
        SliverToBoxAdapter(
          child: Container(
            height: 65.0 * _reviewFeedListItemCount[_curTabIndex],
            child: TabBarView(
              controller: _tabController,
              children: _getReviewFeedList,
            ),
          ),
        )
      ]),
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
        pageType: SubPageItem.boardReview,
        nextPageItem: SubPageItem.post,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
  }

  void _onPushChangeReviewCard(YrkData data) {
    setState(() {
      _tabController.index = 0;
      _initBoardReviewState();
      _curCardIndex = data.i1!;
    });
  }
}