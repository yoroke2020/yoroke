import 'package:flutter/material.dart';
import 'package:helloflutter/screens/board/BoardReviewTabViewList.dart';
import 'package:helloflutter/tools/Data.dart';
import 'package:helloflutter/tools/YorokeTabBarView.dart';
import 'package:helloflutter/tools/YorokeTitleView.dart';

class BoardReview extends StatefulWidget {
  BoardReview(this.data, this.onPushNavigator);

  final Data data;
  final ValueChanged<Data> onPushNavigator;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<BoardReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          YorokeTitleView(
            buttonText: null,
            subTitleText: null,
            titleText: null,
          ),
          YorokeTabBarView(
            viewRatio: 360 / 690,
            length: 2,
            tabTextList: ["최신글", "인기글"],
            tabSize: 72,
            tabViewList: BoardReviewTabViewList(
              // items: ,
              widgetRatio: 360 / 65,
              listLength: 2,
              itemLength: 10,
              ratings: 4,
              onPushNavigator: widget.onPushNavigator,
              items: [], data: widget.data,
            ).getWidgetList(),
          ),
        ],
      ),
    );
  }
}
