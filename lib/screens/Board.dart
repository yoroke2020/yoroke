import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/views/board/BoardCardListItem.dart';
import 'package:yoroke/views/board/BoardJobFindingListItem.dart';
import 'package:yoroke/views/board/BoardQnaListItem.dart';
import 'package:yoroke/views/components/YrkListView.dart';
import 'package:yoroke/views/components/YrkPageView.dart';
import 'package:yoroke/views/components/YrkTabHeaderView.dart';

class Board extends StatefulWidget {
  Board({@required this.onPushNavigator});

  final ValueChanged<YrkData> onPushNavigator;

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final qnaPageController = PageController();
  final findJobPageController = PageController();

  List<Widget> _reviewCardList() {
    List<Widget> list = List<Widget>();
    for (int i = 0; i < 4; i++) {
      list.add(BoardCardListItem(width: 136.0, height: 120.0, index: i));
    }

    return list;
  }

  List<Widget> _boardQnaList() {
    List<Widget> list = List<Widget>();
    for (int i = 0; i < 4; i++) {
      list.add(BoardQnaListItem(index: i));
    }
    return list;
  }

  List<Widget> _boardJobFindingList() {
    List<Widget> list = List<Widget>();
    for (int i = 0; i < 4; i++) {
      list.add(BoardJobFindingListItem(index: i));
    }
    return list;
  }

  List<Widget> _YrkListView(bool isQna) {
    List<Widget> list = List<Widget>();
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
          height: 136.0,
          margin: EdgeInsets.only(left: 8, right: 8),
          scrollable: true,
          scrollDirection: Axis.horizontal,
          clickable: true,
          onPushNavigator: widget.onPushNavigator,
          nextSubPageItem: SubPageItem.boardReview,
          item: _reviewCardList(),
          itemCount: 4,
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
