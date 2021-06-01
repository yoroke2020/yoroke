import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/common/YrkListItem.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'BoardQnaCardListItem.dart';

class BoardQna extends StatefulWidget {
  BoardQna();

  @override
  _BoardQnaState createState() => _BoardQnaState();
}

class _BoardQnaState extends State<BoardQna> {
  static final int _loadPageCount = 20;
  static final int _boardQnaCardListItemCount = 10;

  late int _boardQnaItemListCount;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
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
          backgroundColor: const Color(0xffffffff),
          title: Stack(
            children: <Widget>[
              YrkAppBar(
                type: YrkAppBarType.arrowBackAll,
                curPageItem: "boardQna",
                isStatusBar: false,
              ),
              YrkScrollOpacity(
                  scrollController: _scrollController,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 48.0),
                      height: 48.0,
                      child: Text("고민/질문",
                          style:
                              const YrkTextStyle(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left)))
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          height: 232.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return BoardQnaCardListItem();
            },
            itemCount: _boardQnaCardListItemCount,
          ),
        )),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return YrkPageListItem(
              pageIndex: 0,
              listIndex: 0,
              //TODO: Change it to index when data is fully implemented
              pageType: "boardQna",
              nextPageItem: "post",
            );
          }, childCount: _boardQnaItemListCount),
        )
      ]),
      bottomNavigationBar: BottomBarNavigation.getInstance(RootPageItem.board),
    );
  }

  void _initBoardQnaState() {
    _boardQnaItemListCount = _loadPageCount;
  }

  void _loadMoreData() {
    setState(() {
      _boardQnaItemListCount += _loadPageCount;
    });
  }
}
