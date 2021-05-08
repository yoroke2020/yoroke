import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/YrkCustomScrollView.dart';

import 'BoardQnaCardListItem.dart';

class BoardQna extends StatefulWidget {
  BoardQna({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardQnaState createState() => _BoardQnaState();
}

class _BoardQnaState extends State<BoardQna> {
  static final int _loadPageCount = 20;
  static final int _boardQnaCardListItemCount = 10;

  late List<Widget> _boardQnaItemList;
  late int _boardQnaItemListCount;

  late ScrollController _scrollController;

  get _buildBoardQnaCardList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < _boardQnaCardListItemCount; i++) {
      list.add(BoardQnaCardListItem());
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    _boardQnaItemList = <Widget>[];
    _boardQnaItemListCount = 0;
    _initBoardQnaState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YrkCustomScrollView(
      controller: _scrollController,
      appBarHeight: 48.0,
      isFadedTitle: true,
      fadedTitle: "고민/질문",
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackAll,
        onPushNavigator: widget.onPushNavigator!,
        isStatusBar: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: 48.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color(0xffffffff),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("고민/질문",
                    style: const YrkTextStyle(
                        fontWeight: FontWeight.w700, fontSize: 22.0))),
          ),
          Container(
            width: double.maxFinite,
            height: 32.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color(0xffffffff),
            child: Align(
                alignment: Alignment.centerLeft,
                child: // 고민/질문
                    Text(
                  "최신 인기글",
                  style: const YrkTextStyle(
                    color: const Color(0x99000000),
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          YrkListView(
              height: 232.0,
              padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
              scrollable: true,
              scrollDirection: Axis.horizontal,
              item: _buildBoardQnaCardList,
              itemCount: _boardQnaCardListItemCount),
          YrkListView(
            item: _boardQnaItemList,
            itemCount: _boardQnaItemListCount,
            isIndicator: true,
            height: 65.0 * _boardQnaItemListCount,
          )
        ],
      ),
      bottomNavigatorBar: BottomBarNavigation.getInstance(RootPageItem.board),
    );
  }

  void _initBoardQnaState() {
    _buildBoardQnaListItem(0, _loadPageCount);
    _boardQnaItemListCount = _loadPageCount;
  }

  void _buildBoardQnaListItem(int start, int end) {
    for (int i = start; i < end; i++) {
      _boardQnaItemList.add(new YrkPageListItem(
        pageIndex: 0,
        listIndex: i,
        pageType: SubPageItem.boardQna,
        nextPageItem: SubPageItem.post,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
  }

  void _loadMoreData() {
    setState(() {
      _buildBoardQnaListItem(0, _loadPageCount);
      _boardQnaItemListCount += _loadPageCount;
    });
  }
}
