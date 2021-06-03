import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/board/model/BoardQnaBlock.dart';
import 'package:yoroke/screens/board/model/QnaPostApiResponse.dart';
import 'package:yoroke/screens/board/model/QnaPostBlock.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'BoardQnaCardListItem.dart';

class BoardQna extends StatefulWidget implements Screen<BoardQnaBlock> {
  @override
  _BoardQnaState createState() => _BoardQnaState();

  @override
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  BoardQnaBlock get block => this.block;

  @override
  BoardQnaBlock makeBlock(YrkRequestContext reqCtx) {
    BoardQnaBlock boardQnaBlock = BoardQnaBlock();
    boardQnaBlock.blocks = <YrkBlock>[];
    QnaPostBlock qnaPostBlock = QnaPostBlock();

    Map<String, dynamic> jsonResponse = TestQnaPostData().jsonResponse;
    YrkApiResponse apiResponse = QnaPostApiResponse.fromJson(jsonResponse);
    List<YrkListItemV2Model> items =
        (apiResponse as QnaPostApiResponse).qnaPosts;
    qnaPostBlock.items = items;

    boardQnaBlock.blocks!.add(qnaPostBlock);
    return boardQnaBlock;
  }
}

class _BoardQnaState extends State<BoardQna> {
  static final int _boardQnaCardListItemCount = 10;

  late BoardQnaBlock boardQnaBlock;
  late QnaPostBlock qnaPostBlock;

  late List<Widget> postItems;
  late int postItemCount;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    boardQnaBlock = widget.makeBlock(widget.reqCtx);
    qnaPostBlock =
        boardQnaBlock.findFirstBlockWhere('QnaPostBlock') as QnaPostBlock;

    postItems = _buildItems(qnaPostBlock.type, qnaPostBlock.items!);
    postItemCount = postItems.length;

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
                        child: Text(qnaPostBlock.title,
                            style:
                                const YrkTextStyle(fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left)))
              ])),
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

  void _loadMoreItems() {
    setState(() {
      Map<String, dynamic> jsonResponse = TestQnaPostData().jsonResponse;
      YrkApiResponse apiResponse = QnaPostApiResponse.fromJson(jsonResponse);
      List<YrkListItemV2Model> items =
          (apiResponse as QnaPostApiResponse).qnaPosts;

      qnaPostBlock.items!.addAll(items);
      postItems.addAll(_buildItems(qnaPostBlock.type, items));
      postItemCount = postItems.length;
    });
  }
}
