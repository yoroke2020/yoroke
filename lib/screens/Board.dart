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
          item: BoardCardListItem(136.0, 120.0),
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
                item: BoardQnaListItem(
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
                item: BoardQnaListItem(double.maxFinite, 65.0)),
            YrkListView(
                height: 260.0,
                index: 2,
                itemCount: 4,
                clickable: true,
                onPushNavigator: widget.onPushNavigator,
                nextSubPageItem: SubPageItem.boardQna,
                item: BoardQnaListItem(double.maxFinite, 65.0)),
            YrkListView(
                height: 260.0,
                index: 3,
                itemCount: 4,
                clickable: true,
                onPushNavigator: widget.onPushNavigator,
                nextSubPageItem: SubPageItem.boardQna,
                item: BoardQnaListItem(
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
              item: BoardJobFindingListItem(
                double.maxFinite,
                65.0,
              )),
          YrkListView(
              index: 1,
              itemCount: 4,
              clickable: true,
              onPushNavigator: widget.onPushNavigator,
              nextSubPageItem: SubPageItem.boardJobFinding,
              item: BoardJobFindingListItem(double.maxFinite, 65.0)),
          YrkListView(
              index: 2,
              itemCount: 4,
              clickable: true,
              onPushNavigator: widget.onPushNavigator,
              nextSubPageItem: SubPageItem.boardJobFinding,
              item: BoardJobFindingListItem(double.maxFinite, 65.0)),
          YrkListView(
              index: 3,
              itemCount: 4,
              clickable: true,
              onPushNavigator: widget.onPushNavigator,
              nextSubPageItem: SubPageItem.boardJobFinding,
              item: BoardJobFindingListItem(
                double.maxFinite,
                65.0,
              ))
        ], controller: findJobPageController, isIndicatorEnabled: true)
      ],
    ));
  }
}
