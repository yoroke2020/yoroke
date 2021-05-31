import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListItem.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';

class HistoryList extends StatefulWidget {
  HistoryList({Key? key, required this.onPushNavigator}) : super(key: key);

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList>
    with TickerProviderStateMixin {
  static final int tabLength = 3;

  late final TabController _tabController;

  late List<Tuple2<String, int>> _tabs = [
    Tuple2("후기", 0),
    Tuple2("고민/질문", 1),
    Tuple2("구인구직", 2)
  ];

  late List<String> _tabItemTypes = [
    "boardReview",
    "boardQna",
    "boardJobFinding"
  ];

  late List<Widget> _historyLists;
  get _getHistoryLists {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < tabLength; i++) {
      list.add(ListView.builder(
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return YrkPageListItem(
              pageIndex: i,
              listIndex: index,
              pageType: _tabItemTypes[i],
              //TODO: Make History at SubPageItem
              nextPageItem: "post",
            );
          }));
    }

    return list;
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabLength);
    _historyLists = _getHistoryLists;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(96.0),
            child: Column(children: [
              YrkAppBar(
                type: YrkAppBarType.arrowBackMidTitle,
                label: "히스토리",
              ),
              CustomTapBar(
                  tabs: _tabs, height: 48.0, controller: _tabController)
            ])),
        body: TabBarView(
          controller: _tabController,
          children: _historyLists,
        ));
  }
}
