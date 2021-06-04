import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/main.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/board/BoardReviewCard.dart';
import 'package:yoroke/screens/board/BoardJobFinding.dart';
import 'package:yoroke/screens/board/BoardQna.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/board/model/BoardBlock.dart';
import 'package:yoroke/screens/board/model/QnaPostApiResponse.dart';
import 'package:yoroke/screens/board/model/QnaPostBlock.dart';
import 'package:yoroke/screens/board/model/JobFindingPostApiResponse.dart';
import 'package:yoroke/screens/board/model/JobFindingPostBlock.dart';
import 'package:yoroke/screens/board/model/ReviewCardApiResponse.dart';
import 'package:yoroke/screens/board/model/ReviewPostBlock.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkPage.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> implements Screen<BoardBlock> {
  late BoardBlock boardBlock;
  late QnaPostBlock qnaPostBlock;
  late JobFindingPostBlock jobFindingPostBlock;
  late ReviewPostBlock reviewPostBlock;

  final PageController _qnaPageController = PageController();
  final PageController _jobFindingPageController = PageController();

  @override
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  BoardBlock get block => this.block;

  @override
  BoardBlock makeBlock(YrkRequestContext reqCtx) {
    BoardBlock boardBlock = BoardBlock();
    boardBlock.blocks = <YrkBlock>[];
    YrkBlock block = QnaPostBlock();

    Map<String, dynamic> jsonResponse = TestQnaPostData().jsonResponse;
    YrkApiResponse apiResponse = QnaPostApiResponse.fromJson(jsonResponse);
    List<YrkListItemV2Model> items =
        (apiResponse as QnaPostApiResponse).qnaPosts;
    block.items = items;
    (block as QnaPostBlock).title = apiResponse.title;
    boardBlock.blocks!.add(block);

    block = JobFindingPostBlock();
    jsonResponse = TestJobFindingPostData().jsonResponse;
    apiResponse = JobFindingPostApiResponse.fromJson(jsonResponse);
    items = (apiResponse as JobFindingPostApiResponse).jobFindingPosts;
    block.items = items;
    (block as JobFindingPostBlock).title = apiResponse.title;
    boardBlock.blocks!.add(block);

    block = ReviewPostBlock();
    jsonResponse = TestReviewCardData().jsonResponse;
    apiResponse = ReviewCardApiResponse.fromJson(jsonResponse);
    List<BoardReviewCardModel> cardItems =
        (apiResponse as ReviewCardApiResponse).reviewCards;
    block.items = cardItems;
    boardBlock.blocks!.add(block);

    return boardBlock;
  }

  @override
  void initState() {
    boardBlock = makeBlock(reqCtx);
    qnaPostBlock = boardBlock.findFirstBlockWhere('QnaPost') as QnaPostBlock;
    jobFindingPostBlock =
        boardBlock.findFirstBlockWhere('JobFindingPost') as JobFindingPostBlock;
    reviewPostBlock =
        boardBlock.findFirstBlockWhere('ReviewPost') as ReviewPostBlock;
    super.initState();
  }

  List<Widget> _buildItems(YrkBlock block) {
    final int pageItemLimit = 4;

    List<YrkModel> items = block.items!;
    List<Widget> pageListItems = items
        .cast<YrkListItemV2Model>()
        .map((model) => YrkPageListItemV2(type: block.type, model: model))
        .toList();

    return partition(pageListItems, pageItemLimit)
        .map((list) => ListView(
              children: [...list],
              physics: NeverScrollableScrollPhysics(),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YrkAppBar(
            type: YrkAppBarType.accountCircleAll,
            curPageItem: RootPageItem.board),
        drawer: yrkDrawer,
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board),
        body: ListView(children: <Widget>[
          YrkTabHeaderView(title: "후기"),
          BoardReviewCard(
            models: reviewPostBlock.items as List<BoardReviewCardModel>,
            onTap: (index) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BoardReview(index: index))),
          ),
          YrkTabHeaderView(
            title: qnaPostBlock.title,
            clickable: true,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => BoardQna())),
          ),
          YrkPage(
              page: _buildItems(qnaPostBlock),
              controller: _qnaPageController,
              isIndicatorEnabled: true),
          YrkTabHeaderView(
              title: jobFindingPostBlock.title,
              clickable: true,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BoardJobFinding()))),
          YrkPage(
              page: _buildItems(jobFindingPostBlock),
              controller: _jobFindingPageController,
              isIndicatorEnabled: true)
        ]));
  }
}
