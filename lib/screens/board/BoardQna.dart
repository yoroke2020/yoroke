import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/PostModel.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/temp/YrkTestModelData.dart';

import 'model/BoardQnaCard.dart';

class BoardQna extends StatefulWidget {
  @override
  _BoardQnaState createState() => _BoardQnaState();
}

class _BoardQnaState extends State<BoardQna> with ScreenState<YrkBlock2> {
  late List<Widget> cards;
  late List<Widget> posts;

  late ScrollController _scrollController;

  @override
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  void initBlock() {
    Map<String, dynamic> jsonResponse = TestBoardQnaData().jsonResponse;
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    String type = apiResponse.type ?? "";
    String title = apiResponse.title ?? "";
    List<YrkBlock2> blocks = apiResponse.body ?? [];
    this.block = YrkBlock2()..blocks = blocks;
    this.block.type = type;
    this.block.title = title;
  }

  @override
  void updateBlockOn(String action) {
    setState(() {
      Map<String, dynamic> jsonResponse = TestBoardQnaData().jsonResponse;
      YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
      YrkBlock2 block = (apiResponse.body ?? [])[1];
      posts.addAll(_buildPosts(block));
    });
  }

  @override
  void initState() {
    super.initState();
    initBlock();
    cards = _buildCards(this.block.blocks![0]);
    posts = _buildPosts(this.block.blocks![1]);

    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        updateBlockOn("post");
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
                      child: Text(block.title!,
                          style:
                              const YrkTextStyle(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left)))
            ]),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            child: Text(block.title!,
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
                return cards[index];
              },
              itemCount: cards.length,
            ),
          )),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return posts[index];
            }, childCount: posts.length),
          )
        ]),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.community));
  }

  List<Widget> _buildPosts(YrkBlock2 block) {
    List items = block.items!.cast<PostModel>();
    return items.map((model) => YrkPageListItemV2(model: model)).toList();
  }

  List<Widget> _buildCards(YrkBlock2 block) {
    List items = block.items!.cast<PostModel>();
    return items.map((model) => BoardQnaCard(model: model)).toList();
  }
}
