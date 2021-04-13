import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageView.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';

import 'BoardCardListItem.dart';
import 'BoardJobFindingListItem.dart';
import 'BoardQnaListItem.dart';

class Board extends StatefulWidget {
  Board({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final bardCardListItemCount = 8;

  final qnaPageController = PageController();
  final findJobPageController = PageController();

  List<Widget> _reviewCardList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < bardCardListItemCount; i++) {
      list.add(BoardCardListItem(width: 48.0, height: 76.0, index: i));
    }

    return list;
  }

  List<Widget> _boardQnaList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(BoardQnaListItem(index: i));
    }
    return list;
  }

  List<Widget> _boardJobFindingList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(BoardJobFindingListItem(index: i));
    }
    return list;
  }

  List<Widget> _YrkListView(bool isQna) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkListView(
          index: i,
          itemCount: 4,
          clickable: true,
          onPushNavigator: widget.onPushNavigator,
          nextSubPageItem:
              isQna ? SubPageItem.boardQna : SubPageItem.boardJobFinding,
          item: isQna ? _boardQnaList() : _boardJobFindingList()));
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
          margin:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 16.0),
          scrollable: true,
          scrollDirection: Axis.horizontal,
          clickable: true,
          onPushNavigator: widget.onPushNavigator,
          nextSubPageItem: SubPageItem.boardReview,
          item: _reviewCardList(),
          itemCount: bardCardListItemCount,
        ),
        YrkTabHeaderView(title: "고민/질문"),
        YrkPageView(
          page: _YrkListView(true),
          controller: qnaPageController,
          isIndicatorEnabled: true,
        ),
        YrkTabHeaderView(title: "구인구직"),
        YrkPageView(
            page: _YrkListView(false),
            controller: findJobPageController,
            isIndicatorEnabled: true)
      ],
    ));
  }
}
