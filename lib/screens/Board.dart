import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/views/board/BoardCardList.dart';
import 'package:yoroke/views/board/BoardJobFindingList.dart';
import 'package:yoroke/views/board/BoardQnaList.dart';
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
          item: BoardCardList(136.0, 120.0),
          itemCount: 4,
        ),
        YrkTabHeaderView(title: "고민/질문"),
        YrkPageView(
          page: [
            YrkListView(
                height: 260.0,
                index: 0,
                itemCount: 4,
                clickable: true,
                onPushNavigator: widget.onPushNavigator,
                nextSubPageItem: SubPageItem.boardQna,
                item: BoardQnaList(
                  double.maxFinite,
                  65.0,
                )),
            YrkListView(
                height: 260.0,
                index: 1,
                itemCount: 4,
                clickable: true,
                onPushNavigator: widget.onPushNavigator,
                nextSubPageItem: SubPageItem.boardQna,
                item: BoardQnaList(double.maxFinite, 65.0)),
            YrkListView(
                height: 260.0,
                index: 2,
                itemCount: 4,
                clickable: true,
                onPushNavigator: widget.onPushNavigator,
                nextSubPageItem: SubPageItem.boardQna,
                item: BoardQnaList(double.maxFinite, 65.0)),
            YrkListView(
                height: 260.0,
                index: 3,
                itemCount: 4,
                clickable: true,
                onPushNavigator: widget.onPushNavigator,
                nextSubPageItem: SubPageItem.boardQna,
                item: BoardQnaList(
                  double.maxFinite,
                  65.0,
                ))
          ],
          controller: qnaPageController,
          isIndicatorEnabled: true,
        ),
        YrkTabHeaderView(title: "구인구직"),
        YrkPageView(page: [
          YrkListView(
              index: 0,
              itemCount: 4,
              clickable: true,
              onPushNavigator: widget.onPushNavigator,
              nextSubPageItem: SubPageItem.boardJobFinding,
              item: BoardJobFindingList(
                double.maxFinite,
                65.0,
              )),
          YrkListView(
              index: 1,
              itemCount: 4,
              clickable: true,
              onPushNavigator: widget.onPushNavigator,
              nextSubPageItem: SubPageItem.boardJobFinding,
              item: BoardJobFindingList(double.maxFinite, 65.0)),
          YrkListView(
              index: 2,
              itemCount: 4,
              clickable: true,
              onPushNavigator: widget.onPushNavigator,
              nextSubPageItem: SubPageItem.boardJobFinding,
              item: BoardJobFindingList(double.maxFinite, 65.0)),
          YrkListView(
              index: 3,
              itemCount: 4,
              clickable: true,
              onPushNavigator: widget.onPushNavigator,
              nextSubPageItem: SubPageItem.boardJobFinding,
              item: BoardJobFindingList(
                double.maxFinite,
                65.0,
              ))
        ], controller: findJobPageController, isIndicatorEnabled: true)
      ],
    ));
  }
}
