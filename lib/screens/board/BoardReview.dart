import 'package:flutter/material.dart';
import 'package:helloflutter/views/Board/BoardReviewTabViewList.dart';
import 'package:helloflutter/models/YrkData.dart';
import 'package:helloflutter/views/components/YrkTabBarView.dart';
import 'package:helloflutter/views/components/YrkTitleView.dart';

class BoardReview extends StatefulWidget {
  BoardReview(this.data, this.onPushNavigator);

  final YrkData data;
  final ValueChanged<YrkData> onPushNavigator;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<BoardReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          YrkTitleView(
            buttonText: null,
            subTitleText: null,
            titleText: null,
          ),
          YrkTabBarView(
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
