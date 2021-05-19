import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkScrollFadedWidget.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

class BoardJobFinding extends StatefulWidget {
  BoardJobFinding({Key? key, required this.onPushNavigator}) : super(key: key);

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardJobFindingState createState() => _BoardJobFindingState();
}

class _BoardJobFindingState extends State<BoardJobFinding>
    with TickerProviderStateMixin {
  static final int _loadPageCount = 20;
  static final int _tabLength = 2;

  late List<List<Widget>> _boardJobFindingItemList;
  late List<int> _boardJobFindingItemListCount;
  late int _curTabIndex;

  late ScrollController _scrollController;
  late TabController _tabController;

  get _getBoardJobFindingItemList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < _tabLength; i++) {
      list.add(ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _boardJobFindingItemListCount[i],
        itemBuilder: (BuildContext context, int index) {
          return _boardJobFindingItemList[i][index];
        },
      ));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = new TabController(vsync: this, length: _tabLength);

    _boardJobFindingItemList = [<Widget>[], <Widget>[]];
    _boardJobFindingItemListCount = [0, 0];
    _initBoardJobFindingState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });

    _tabController.addListener(() {
      setState(() {
        if (_tabController.indexIsChanging) {
          _scrollController.animateTo(0,
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
    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: <Widget>[
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
            expandedHeight: 144.0,
            backgroundColor: const Color(0xffffffff),
            title: Stack(
              children: <Widget>[
                YrkAppBar(
                  type: YrkAppBarType.arrowBackAll,
                  onPushNavigator: widget.onPushNavigator!,
                  curPageItem: SubPageItem.boardJobFinding,
                  isStatusBar: false,
                ),
                YrkScrollFadedWidget(
                    scrollController: _scrollController,
                    child: Container(
                        height: 48.0,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 48.0),
                        child: Text("구인구직",
                            style:
                                const YrkTextStyle(fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left)))
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
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
                      child: Text("구인구직",
                          style: const YrkTextStyle(
                              fontWeight: FontWeight.w700, fontSize: 22.0),
                          textAlign: TextAlign.left)),
                ],
              ),
            )),
            bottom: PreferredSize(
                child: YrkTabBar(
                    textList: ["구인", "구직"],
                    tabWidth: 72,
                    height: 40.0,
                    controller: _tabController),
                preferredSize: Size.fromHeight(40.01))),
        SliverToBoxAdapter(
            child: Container(
          height: 65.0 * _boardJobFindingItemListCount[_curTabIndex],
          child: TabBarView(
            controller: _tabController,
            children: _getBoardJobFindingItemList,
          ),
        ))
      ]),
      bottomNavigationBar: BottomBarNavigation.getInstance(RootPageItem.board),
    );
  }

  void _initBoardJobFindingState() {
    for (int i = 0; i < _tabLength; i++) {
      _boardJobFindingItemList[i].removeRange(
          0,
          _boardJobFindingItemList[i]
              .length); //TODO: 좀 더 좋은 방법의 메모리 클리어 방법 고안 필요
      _buildJobFindingTabViewListItem(i, 0, _loadPageCount);
      _boardJobFindingItemListCount[i] = _loadPageCount;
    }
    _curTabIndex = 0;
  }

  void _buildJobFindingTabViewListItem(int pageIndex, int start, int end) {
    for (int i = start; i < end; i++) {
      _boardJobFindingItemList[pageIndex].add(new YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        pageType: SubPageItem.boardJobFinding,
        nextPageItem: SubPageItem.post,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
  }

  void _loadMoreData() {
    setState(() {
      _buildJobFindingTabViewListItem(_curTabIndex, 0, _loadPageCount);
      _boardJobFindingItemListCount[_curTabIndex] += _loadPageCount;
    });
  }
}
