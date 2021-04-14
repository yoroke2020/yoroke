import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkPageView.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';

import 'BoardCardListItem.dart';

class Board extends StatefulWidget {
  Board({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final bardCardListItemCount = 12;

  final qnaPageController = PageController();
  final findJobPageController = PageController();

  List<Widget> _buildBoardReviewCardList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < bardCardListItemCount; i++) {
      list.add(BoardCardListItem(
        width: 64.0,
        height: 76.0,
        index: i,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
    return list;
  }

  List<Widget> _buildBoardYrkListView(SubPageItem subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkListView(
          itemCount: 4,
          item: _buildList(
              i,
              subPageItem,
              widget.onPushNavigator!)));
    }
    return list;
  }

  List<Widget> _buildList(int pageIndex, SubPageItem subPageItem,
      ValueChanged<YrkData> onPushNavigator) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        onPushNavigator: onPushNavigator,
        subPageItem: subPageItem,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        YrkTabHeaderView(title: "후기"),
        YrkListView(
          height: 100.0,
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
          scrollable: true,
          scrollDirection: Axis.horizontal,
          clickable: false,
          item: _buildBoardReviewCardList(),
          itemCount: bardCardListItemCount,
        ),
        YrkTabHeaderView(title: "고민/질문"),
        YrkPageView(
          page: _buildBoardYrkListView(SubPageItem.boardQna),
          controller: qnaPageController,
          isIndicatorEnabled: true,
        ),
        YrkTabHeaderView(title: "구인구직"),
        YrkPageView(
            page: _buildBoardYrkListView(SubPageItem.boardJobFinding),
            controller: findJobPageController,
            isIndicatorEnabled: true)
      ],
    ));
  }
}
