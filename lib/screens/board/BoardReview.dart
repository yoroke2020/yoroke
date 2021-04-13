import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/appbars/AppBarLargeImage.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'BoardCardListItem.dart';

class BoardReview extends StatefulWidget {
  BoardReview({Key? key, required this.data, required this.onPushNavigator})
      : super(key: key);

  YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<BoardReview> {
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
      widget.data!.i1 = data.i1;
    });
  }

  List<Widget> _buildReviewCardList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(BoardCardListItem(width: 112.0, height: 112.0, index: i));
    }

    return list;
  }

  List<Widget> _buildReviewTabViewListItem(int pageIndex) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 10; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        subPageItem: SubPageItem.boardReviewFeed,
        onPushNavigator: widget.onPushNavigator,
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarLargeImage(
          onButtonClicked: _onButtonClicked,
          widgetVisible: widgetVisible,
          titleText: titleList[widget.data!.i1!],
          subTitleText: subTitleList[widget.data!.i1!],
        ),
        body: ListView(children: <Widget>[
          AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: widgetVisible ? 120.0 : 0.0,
              child: YrkListView(
                height: 128.0,
                margin: EdgeInsets.only(left: 8, right: 8),
                scrollable: true,
                scrollDirection: Axis.horizontal,
                clickable: true,
                onPushNavigator: _onPushNavigator,
                nextSubPageItem: SubPageItem.boardReview,
                item: _buildReviewCardList(),
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
                    itemCount: 10,
                    clickable: true,
                    item: _buildReviewTabViewListItem(0)),
                YrkListView(
                    index: 1,
                    itemCount: 10,
                    clickable: true,
                    onPushNavigator: widget.onPushNavigator,
                    nextSubPageItem: SubPageItem.boardQna,
                    item: _buildReviewTabViewListItem(1)),
              ]),
        ]),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
  }
}
