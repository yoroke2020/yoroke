import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/main.dart';
import 'package:yoroke/models/CardModel.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/board/BoardJobFinding.dart';
import 'package:yoroke/screens/board/BoardQna.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/board/BoardReviewCard.dart';
import 'package:yoroke/screens/board/model/BoardApiResponse.dart';
import 'package:yoroke/screens/board/model/BoardBlock.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkPage.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> with ScreenState<BoardBlock> {
  // late BoardBlock boardBlock;
  // late QnaPostBlock qnaPostBlock;
  // late JobFindingPostBlock jobFindingPostBlock;
  // late ReviewPostBlock reviewPostBlock;

  final PageController _qnaPageController = PageController();
  final PageController _jobFindingPageController = PageController();

  @override
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  void initBlock() {
    Map<String, dynamic> jsonResponse = TestBoardData().jsonResponse;
    print(
        "-------------------- STEP 1. FROM \"API RESPONSE (JSON)\" TO \"BLOCK\" --------------------");
    BoardApiResponse apiResponse = BoardApiResponse.fromJson(jsonResponse);
    print("RESULT: " + apiResponse.body.toString());

    print(
        "-------------------- STEP 2. SET \"BOARD BLOCK\"-------------------------------------------");
    List<YrkBlock2> blocks = apiResponse.body;
    // (before)
    // HomeBlock homeBlock = HomeBlock()
    //       ..type = "HomeBlock"
    //       ..blocks = (<YrkBlock>[
    //         PopularPostBlock()
    //           ..type = "PopularPostBlock"
    //           ..items = items
    //           ..title = "인기 게시글"
    //       ]);
    BoardBlock boardBlock = BoardBlock()..blocks = blocks;
    this.block = boardBlock;

    print("THIS IS BoardBlock");
    int counter = 0;
    boardBlock.blocks!.forEach((element) {
      print("[block instance#" + counter.toString() + "]");
      print("  " + element.toString());
      if (element.items == null) {
        print("  [blocks of block instance#" + counter.toString() + "]");
        print("    " + element.blocks.toString());
        element.blocks!
            .forEach((block) => print("      " + block.items.toString()));
      } else {
        print("  [items of block instance#" + counter.toString() + "]");
        print("    " + element.items.toString());
      }
      counter++;
    });
  }

  @override
  void updateBlockOn(String action) {
    // TODO: implement updateBlockOn
  }

  @override
  void initState() {
    initBlock();
    // boardBlock = makeBlock(reqCtx);
    // qnaPostBlock = boardBlock.findFirstBlockWhere('QnaPost') as QnaPostBlock;
    // jobFindingPostBlock =
    //     boardBlock.findFirstBlockWhere('JobFindingPost') as JobFindingPostBlock;
    // reviewPostBlock =
    //     boardBlock.findFirstBlockWhere('ReviewPost') as ReviewPostBlock;
    super.initState();
  }

  List<Widget> _buildItems(YrkBlock2 block) {
    final int pageItemLimit = 4;

    List items = block.items!;
    List<Widget> pageListItems = items
        .map((model) =>
            YrkPageListItemV2(type: block.type, model: YrkListItemV2Model()))
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
              page: _buildItems(this.block.blocks![1]),
              controller: _qnaPageController,
              isIndicatorEnabled: true),
          YrkTabHeaderView(
              title: this.block.blocks![2].title,
              clickable: true,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BoardJobFinding()))),
          YrkPage(
              page: _buildItems(this.block.blocks![2]),
              controller: _jobFindingPageController,
              isIndicatorEnabled: true)
        ]));
  }
}
