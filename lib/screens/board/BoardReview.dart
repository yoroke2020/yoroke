import 'package:flutter/material.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/views/Board/BoardReviewTabViewList.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/components/YrkCardView.dart';
import 'package:yoroke/views/components/YrkTabBarView.dart';
import 'package:yoroke/views/appbars/AppBarLargeTheme.dart';

class BoardReview extends StatefulWidget {
  BoardReview(this.data, this.onPushNavigator);

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
      appBar: AppBarLargeTheme(
        onButtonClicked: _onButtonClicked,
        widgetVisible: widgetVisible,
        titleText: titleList[widget.data.cardIndex],
        subTitleText: subTitleList[widget.data.cardIndex],
      ),
      body: ListView(
        children: <Widget>[
          AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: widgetVisible ? 120.0 : 0.0,
              child: YrkCardView(
                viewHeight: 128,
                cardHeight: 112,
                cardWidth: 112,
                cardNameList: reviewCardNameList,
                cardImageList: reviewCardImageList,
                onPushNavigator: _onPushNavigator,
                onTapPageIndex: SubItem.boardReview.index,
              )),
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
              items: [],
              data: widget.data,
            ).getWidgetList(),
          ),
        ],
      ),
    );
  }
}
