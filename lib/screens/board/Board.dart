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
import 'package:yoroke/screens/board/BoardCardListItem.dart';
import 'package:yoroke/screens/board/BoardJobFinding.dart';
import 'package:yoroke/screens/board/BoardQna.dart';
import 'package:yoroke/screens/board/model/BoardBlock.dart';
import 'package:yoroke/screens/board/model/QnaPostApiResponse.dart';
import 'package:yoroke/screens/board/model/QnaPostBlock.dart';
import 'package:yoroke/screens/board/model/JobFindingPostApiResponse.dart';
import 'package:yoroke/screens/board/model/JobFindingPostBlock.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkPage.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

class Board extends StatefulWidget implements Screen<BoardBlock> {
  @override
  _BoardState createState() => _BoardState();

  @override
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  BoardBlock get block => this.block;

  @override
  BoardBlock makeBlock(YrkRequestContext reqCtx) {
    BoardBlock boardBlock = BoardBlock();
    boardBlock.blocks = <YrkBlock>[];
    QnaPostBlock qnaPostBlock = QnaPostBlock();
    JobFindingPostBlock jobFindingPostBlock = JobFindingPostBlock();

    Map<String, dynamic> jsonResponse = TestQnaPostData().jsonResponse;
    YrkApiResponse apiResponse = QnaPostApiResponse.fromJson(jsonResponse);

    List<YrkListItemV2Model> items =
        (apiResponse as QnaPostApiResponse).qnaPosts;
    qnaPostBlock.items = items;

    boardBlock.blocks!.add(qnaPostBlock);

    jsonResponse = TestJobFindingPostData().jsonResponse;
    apiResponse = JobFindingPostApiResponse.fromJson(jsonResponse);

    items = (apiResponse as JobFindingPostApiResponse).jobFindingPosts;
    jobFindingPostBlock.items = items;
    jobFindingPostBlock.title = "구인구직";

    boardBlock.blocks!.add(jobFindingPostBlock);

    return boardBlock;
  }
}

class _BoardState extends State<Board> {
  late BoardBlock boardBlock;
  late QnaPostBlock qnaPostBlock;
  late JobFindingPostBlock jobFindingPostBlock;

  final int _boardCardListItemCount = 12;

  final PageController _qnaPageController = PageController();
  final PageController _jobFindingPageController = PageController();

  @override
  void initState() {
    boardBlock = widget.makeBlock(widget.reqCtx);
    qnaPostBlock =
        boardBlock.findFirstBlockWhere('QnaPostBlock') as QnaPostBlock;
    jobFindingPostBlock = boardBlock.findFirstBlockWhere('JobFindingPostBlock')
        as JobFindingPostBlock;
    super.initState();
  }

  List<Widget> _buildList(YrkBlock block) {
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
          YrkTabHeaderView(title: "후기", nextSubPageItem: "boardReview"),
          Container(
              height: 100.0,
              alignment: Alignment.centerLeft,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _boardCardListItemCount,
                  itemBuilder: (BuildContext context, int index) {
                    return BoardCardListItem(
                        index: index, listLength: _boardCardListItemCount);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 18.0);
                  })),
          YrkTabHeaderView(
            title: qnaPostBlock.title,
            clickable: true,
            nextSubPageItem: "boardQna",
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => BoardQna())),
          ),
          YrkPage(
              page: _buildList(qnaPostBlock),
              controller: _qnaPageController,
              isIndicatorEnabled: true),
          YrkTabHeaderView(
              title: jobFindingPostBlock.title,
              clickable: true,
              nextSubPageItem: "boardJobFinding",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BoardJobFinding()))),
          YrkPage(
              page: _buildList(jobFindingPostBlock),
              controller: _jobFindingPageController,
              isIndicatorEnabled: true)
        ]));
  }
}
