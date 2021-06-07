import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/board/model/BoardQnaBlock.dart';
import 'package:yoroke/screens/board/model/QnaCardApiResponse.dart';
import 'package:yoroke/screens/board/model/QnaPostApiResponse.dart';
import 'package:yoroke/screens/board/model/QnaPostBlock.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'BoardQnaCard.dart';

class BoardQna extends StatefulWidget {
  @override
  _BoardQnaState createState() => _BoardQnaState();
}

class _BoardQnaState extends State<BoardQna> {
  static final int _boardQnaCardListItemCount = 10;

  late BoardQnaBlock boardQnaBlock;
  late QnaPostBlock qnaPostBlock;
  late QnaPostBlock qnaCardBlock;

  late List<Widget> cardItems;

  late List<Widget> postItems;
  late int postItemCount;

  late ScrollController _scrollController;

  @override
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  BoardQnaBlock get block => this.block;

  @override
  BoardQnaBlock makeBlock(YrkRequestContext reqCtx) {
    BoardQnaBlock boardQnaBlock = BoardQnaBlock();
    boardQnaBlock.title = "고민/질문";
    boardQnaBlock.blocks = <YrkBlock>[];

    QnaPostBlock block = QnaPostBlock();
    Map<String, dynamic> jsonResponse = TestQnaPostData().jsonResponse;
    YrkApiResponse apiResponse = QnaPostApiResponse.fromJson(jsonResponse);
    List<YrkModel> items = (apiResponse as QnaPostApiResponse).qnaPosts;
    block.items = items as List<YrkListItemV2Model>;
    block.title = apiResponse.title;
    boardQnaBlock.blocks!.add(block);

    block = QnaPostBlock();
    block.type = "QnaCard";
    jsonResponse = TestQnaCardData().jsonResponse;
    apiResponse = QnaCardApiResponse.fromJson(jsonResponse);
    items = (apiResponse as QnaCardApiResponse).qnaCards;
    block.items = items as List<BoardQnaCardModel>;
    boardQnaBlock.blocks!.add(block);

    return boardQnaBlock;
  }

  void _loadMoreItems() {
    setState(() {
      Map<String, dynamic> jsonResponse = TestQnaPostData().jsonResponse;
      YrkApiResponse apiResponse = QnaPostApiResponse.fromJson(jsonResponse);
      List<YrkModel> items = (apiResponse as QnaPostApiResponse).qnaPosts;

      qnaPostBlock.items!.addAll(items as List<YrkListItemV2Model>);
      postItems.addAll(_buildItems(qnaPostBlock.type, items));
      postItemCount = postItems.length;
    });
  }

  @override
  void initState() {
    super.initState();
    boardQnaBlock = makeBlock(reqCtx);
    // qnaPostBlock =
    // boardQnaBlock.findFirstBlockWhere('QnaPost') as QnaPostBlock;
    // qnaCardBlock =
    //     boardQnaBlock.findFirstBlockWhere('QnaCard') as QnaPostBlock;

    postItems = _buildItems(qnaPostBlock.type, qnaPostBlock.items!);
    postItemCount = postItems.length;

    cardItems = _buildCards(qnaCardBlock.items!);

    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
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
            title: Stack(children: <Widget>[
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
                      child: Text(boardQnaBlock.title,
                          style:
                              const YrkTextStyle(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left)))
            ]),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            child: Text(boardQnaBlock.title,
                style: const YrkTextStyle(
                    fontWeight: FontWeight.w700, fontSize: 22.0),
                textAlign: TextAlign.left),
          )),
          SliverToBoxAdapter(
              child: Container(
            height: 169.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return cardItems[index];
              },
              itemCount: _boardQnaCardListItemCount,
            ),
          )),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return postItems[index];
            }, childCount: postItemCount),
          )
        ]),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
  }

  List<Widget> _buildItems(String type, List<YrkModel> items) {
    return items
        .cast<YrkListItemV2Model>()
        .map((model) => YrkPageListItemV2(type: type, model: model))
        .toList();
  }

  List<Widget> _buildCards(List<YrkModel> items) {
    return items
        .cast<BoardQnaCardModel>()
        .map((model) => BoardQnaCard(model: model))
        .toList();
  }
}
