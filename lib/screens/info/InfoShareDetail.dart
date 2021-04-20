import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/board/BoardCardListItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/appbars/AppBarLargeImage.dart';
import 'package:yoroke/screens/common/appbars/AppBarXLargeImage.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

class InfoShareDetail extends StatefulWidget {
  InfoShareDetail({Key? key, required this.data, required this.onPushNavigator})
      : super(key: key);

  YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _InfoShareDetailState createState() => _InfoShareDetailState();
}

class _InfoShareDetailState extends State<InfoShareDetail> {
  List<String> titleList = [
    "요양병원 후기/리뷰",
    "요양원 후기/리뷰",
    "복지관 후기/리뷰",
    "간병인 후기/리뷰"
  ];

  List<String> date = [
    "2020.04.21",
  ];

  bool widgetVisible = false;

  void _onButtonClicked() {
    setState(() {
      widgetVisible = widgetVisible ? false : true;
    });
  }

  void _onPushNavigator(YrkData data) {
    setState(() {
      widget.data!.i0 = data.i0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarXLargeImage(
        onButtonClicked: _onButtonClicked,
        widgetVisible: widgetVisible,
        titleText: widget.data!.str0!,
        subTitleText: date[widget.data!.i0!],
      ),
      body: Container(),
      // ListView(children: <Widget>[
      //   AnimatedContainer(
      //       duration: Duration(milliseconds: 300),
      //       height: widgetVisible ? 120.0 : 0.0,
      //       child: YrkListView(
      //         height: 128.0,
      //         margin: EdgeInsets.only(left: 8, right: 8),
      //         scrollable: true,
      //         scrollDirection: Axis.horizontal,
      //         // item: _buildReviewCardList(),
      //         itemCount: 4,
      //       )),
      // ]),
      // bottomNavigationBar:
      //     BottomBarNavigation.getInstance(RootPageItem.board));
    );
  }
}
