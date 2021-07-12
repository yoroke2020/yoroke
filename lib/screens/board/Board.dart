import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/temp/YrkTestModelData.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/main.dart';
import 'package:yoroke/models/CardModel.dart';
import 'package:yoroke/models/PostModel.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/board/BoardJob.dart';
import 'package:yoroke/screens/board/BoardQna.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/board/model/BoardReviewCard.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkPage.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> with ScreenState<YrkBlock2> {
  final PageController _qnaPageController = PageController();
  final PageController _jobFindingPageController = PageController();

  @override
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  void initBlock() {
    Map<String, dynamic> jsonResponse = TestBoardData().jsonResponse;
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    List<YrkBlock2> blocks = apiResponse.body!;
    this.block = YrkBlock2()..blocks = blocks;
  }

  @override
  void updateBlockOn(String action) {
    // TODO: implement updateBlockOn
  }

  @override
  void initState() {
    super.initState();
    initBlock();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YrkAppBar(
            type: YrkAppBarType.accountCircleAll,
            curPageItem: RootPageItem.board),
        drawer: yrkDrawer,
        body: ListView(children: <Widget>[
          YrkTabHeaderView(title: "후기"),
          BoardReviewCards(
            models: this.block.blocks![0].items.cast<CardModel>(),
            onTap: (index) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BoardReview(index: index))),
          ),
          YrkTabHeaderView(
            title: this.block.blocks![1].title,
            clickable: true,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => BoardQna())),
          ),
          YrkPage(
              page: _buildPosts(this.block.blocks![1]),
              controller: _qnaPageController,
              isIndicatorEnabled: true),
          YrkTabHeaderView(
              title: this.block.blocks![2].title,
              clickable: true,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BoardJob()))),
          YrkPage(
              page: _buildPosts(this.block.blocks![2]),
              controller: _jobFindingPageController,
              isIndicatorEnabled: true)
        ]));
  }

  List<Widget> _buildPosts(YrkBlock2 block) {
    final int pageItemLimit = 4;

    List items = block.items!.cast<PostModel>();
    List<Widget> pageListItems = items
        .map((model) =>
        YrkPageListItemV2(model: model))
        .toList();

    return partition(pageListItems, pageItemLimit)
        .map((list) => ListView(
      children: [...list],
      physics: NeverScrollableScrollPhysics(),
    ))
        .toList();
  }
}
