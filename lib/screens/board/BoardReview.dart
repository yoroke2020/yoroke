import 'package:flutter/material.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/board/BoardCardList.dart';
import 'package:yoroke/views/board/BoardReviewTabViewList.dart';
import 'package:yoroke/views/components/YrkCardView.dart';
import 'package:yoroke/views/components/YrkListView.dart';
import 'package:yoroke/views/components/YrkTabBarView.dart';
import 'package:yoroke/views/appbars/AppBarLargeImage.dart';

class BoardReview extends StatefulWidget {
  BoardReview({Key key, @required this.data, @required this.onPushNavigator})
      : super(key: key);

  YrkData data;
  final ValueChanged<YrkData> onPushNavigator;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<BoardReview> {
  List<String> reviewCardImageList = [
    "assets/icons/sample_image.png",
    "assets/icons/sample_image.png",
    "assets/icons/sample_image.png",
    "assets/icons/sample_image.png"
  ];
  List<String> reviewCardNameList = ["요양병원", "요양원", "복지관", "간병인"];
  List<String> titleList = [
    "요양병원 후기/리뷰",
    "요양원 후기/리뷰",
    "복지관 후기/리뷰",
    "간병인 후기/리뷰"
  ];

  List<String> subTitleList = [
    "요양병원 위주의 후기와 리뷰를 알아보세요",
    "요양원 위주의 후기와 리뷰를 알아보세요",
    "복지관 위주의 후기와 리뷰를 알아보세요",
    "간병인 위주의 후기와 리뷰를 알아보세요",
  ];

  bool widgetVisible = false;

  void _onButtonClicked() {
    setState(() {
      widgetVisible = widgetVisible ? false : true;
    });
  }

  void _onPushNavigator(YrkData data) {
    setState(() {
      widget.data.cardIndex = data.cardIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarLargeImage(
          onButtonClicked: _onButtonClicked,
          widgetVisible: widgetVisible,
          titleText: titleList[widget.data.cardIndex],
          subTitleText: subTitleList[widget.data.cardIndex],
        ),
        body: ListView(children: <Widget>[
          AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: widgetVisible ? 120.0 : 0.0,
              child: YrkCardView(
                height: 128,
                onPushNavigator: _onPushNavigator,
                onTapPageIndex: SubItem.boardReview.index,
                item: BoardCardList(112.0, 112.0),
                itemCount: 4,
              )),
          YrkTabBarView(
              viewRatio: 360 / 690,
              length: 2,
              tabTextList: ["최신글", "인기글"],
              tabSize: 72,
              tabViewList: [
                YrkListView(
                    index: 0,
                    itemCount: 8,
                    onPushNavigator: widget.onPushNavigator,
                    item: BoardReviewTabViewList(double.maxFinite, 65.0, data: widget.data)),
                YrkListView(
                    index: 1,
                    itemCount: 8,
                    onPushNavigator: widget.onPushNavigator,
                    item: BoardReviewTabViewList(double.maxFinite, 65.0, data: widget.data)),
              ]),
        ]));
  }
}
