import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

import 'HomeHistoryCardListItem.dart';

class HomeHistory extends StatefulWidget {
  HomeHistory({Key? key, required this.data, required this.onPushNavigator})
      : super(key: key);

  final YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _HomeHistoryState createState() => _HomeHistoryState();
}

class _HomeHistoryState extends State<HomeHistory> {
  YrkData? data;
  bool widgetVisible = false;
  String titleText = "타이틀";
  String subTitleText = "서브 타이틀";

  @override
  initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YrkAppBar(
          type: YrkAppBarType.arrowBackOnly,
        ),
        body: ListView.builder(
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return HomeHistoryCardListItem(
                  width: 344, height: 136, index: index);
            }));
  }
}
