import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/appbars/AppBarNormal.dart';

import 'HomeHistoryCardListItem.dart';

class HomeHistory extends StatefulWidget {
  HomeHistory({Key? key, required this.data}) : super(key: key);

  final YrkData? data;

  @override
  _HomeHistoryState createState() => _HomeHistoryState();
}

class _HomeHistoryState extends State<HomeHistory> {
  YrkData? data;
  bool widgetVisible = false;
  String titleText = "타이틀";
  String subTitleText = "서브 타이틀";

  void _onButtonClicked() {
    setState(() {
      widgetVisible = widgetVisible ? false : true;
    });
  }

  @override
  initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YrkAppBar(
          appBarType: AppBarType.back,
          context: context,
        ),
        body: (ListView(children: <Widget>[
          YrkListView(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(left: 16),
            scrollable: true,
            scrollDirection: Axis.vertical,
            clickable: true,
            onPushNavigator: null,
            nextSubPageItem: SubPageItem.boardReview,
            item: _popularCardList(),
            itemCount: 12,
          ),
        ])));
  }

  List<Widget> _popularCardList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 12; i++) {
      list.add(HomeHistoryCardListItem(width: 344, height: 136, index: i));
    }
    return list;
  }
}
