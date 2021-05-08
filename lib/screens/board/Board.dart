import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkPageView.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

import 'BoardCardListItem.dart';

class Board extends StatelessWidget {
  Board({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  final int _boardCardListItemCount = 12;

  final PageController _qnaPageController = PageController();
  final PageController _jobFindingPageController = PageController();

  get _getBoardReviewCardList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < _boardCardListItemCount; i++) {
      list.add(BoardCardListItem(
        width: 64.0,
        height: 76.0,
        index: i,
        onPushNavigator: onPushNavigator,
      ));
    }
    return list;
  }

  List<Widget> _buildBoardYrkListView(SubPageItem subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkListView(
          itemCount: 4, item: _buildList(i, subPageItem)));
    }
    return list;
  }

  List<Widget> _buildList(int pageIndex, SubPageItem subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        pageType: subPageItem,
        nextPageItem: SubPageItem.post,
        onPushNavigator: onPushNavigator,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YrkAppBar(
          type: YrkAppBarType.accountCircleAll,
          onPushNavigator: onPushNavigator,
          curPageItem: RootPageItem.board,
        ),
        drawer: YrkDrawer(),
        body: ListView(
          children: <Widget>[
            YrkTabHeaderView(
              title: "후기",
              clickable: true,
              onPushNavigator: onPushNavigator,
              nextSubPageItem: SubPageItem.boardReview,
            ),
            YrkListView(
              height: 100.0,
              padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
              scrollable: true,
              scrollDirection: Axis.horizontal,
              item: _getBoardReviewCardList,
              itemCount: _boardCardListItemCount,
            ),
            YrkTabHeaderView(
              title: "고민/질문",
              clickable: true,
              onPushNavigator: onPushNavigator,
              nextSubPageItem: SubPageItem.boardQna,
            ),
            YrkPageView(
              page: _buildBoardYrkListView(SubPageItem.boardQna),
              controller: _qnaPageController,
              isIndicatorEnabled: true,
            ),
            YrkTabHeaderView(
              title: "구인구직",
              clickable: true,
              onPushNavigator: onPushNavigator,
              nextSubPageItem: SubPageItem.boardJobFinding,
            ),
            YrkPageView(
                page: _buildBoardYrkListView(SubPageItem.boardJobFinding),
                controller: _jobFindingPageController,
                isIndicatorEnabled: true)
          ],
        ));
  }
}
