import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/views/board/BoardCardList.dart';
import 'package:yoroke/views/board/BoardJobFindingList.dart';
import 'package:yoroke/views/board/BoardQnaList.dart';
import 'package:yoroke/views/components/YrkCardView.dart';
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

  final int qnaListPageCount = 4;
  final int findJobListPageCount = 4;
  final int qnaListItemCount = 4;
  final int findJobListItemCount = 4;
  final double qnaPageRatio = 360 / 260;
  final double findJobPageRatio = 360 / 260;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        YrkTabHeaderView(titleName: "후기"),
        YrkCardView(
          height: 136,
          onPushNavigator: widget.onPushNavigator,
          onTapPageIndex: SubItem.boardReview.index,
          item: BoardCardList(136.0, 120.0),
          itemCount: 4,
        ),
        YrkTabHeaderView(titleName: "고민/질문"),
        YrkPageView(
          page: [
            YrkListView(
                index: 0,
                itemCount: 4,
                onPushNavigator: widget.onPushNavigator,
                item: BoardQnaList(
                  double.maxFinite,
                  65.0,
                )),
            YrkListView(
                index: 1,
                itemCount: 4,
                onPushNavigator: widget.onPushNavigator,
                item: BoardQnaList(double.maxFinite, 65.0)),
            YrkListView(
                index: 2,
                itemCount: 4,
                onPushNavigator: widget.onPushNavigator,
                item: BoardQnaList(double.maxFinite, 65.0)),
            YrkListView(
                index: 3,
                itemCount: 4,
                onPushNavigator: widget.onPushNavigator,
                item: BoardQnaList(
                  double.maxFinite,
                  65.0,
                ))
          ],
          controller: qnaPageController,
          isIndicatorEnabled: true,
        ),
        YrkTabHeaderView(titleName: "구인구직"),
        YrkPageView(page: [
          YrkListView(
              index: 0,
              itemCount: 4,
              onPushNavigator: widget.onPushNavigator,
              item: BoardJobFindingList(
                double.maxFinite,
                65.0,
              )),
          YrkListView(
              index: 1,
              itemCount: 4,
              onPushNavigator: widget.onPushNavigator,
              item: BoardJobFindingList(double.maxFinite, 65.0)),
          YrkListView(
              index: 2,
              itemCount: 4,
              onPushNavigator: widget.onPushNavigator,
              item: BoardJobFindingList(double.maxFinite, 65.0)),
          YrkListView(
              index: 3,
              itemCount: 4,
              onPushNavigator: widget.onPushNavigator,
              item: BoardJobFindingList(
                double.maxFinite,
                65.0,
              ))
        ], controller: findJobPageController, isIndicatorEnabled: true)
      ],
    ));
  }
}
