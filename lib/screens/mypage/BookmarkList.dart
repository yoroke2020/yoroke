import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListItem.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/home/HomeHistoryCardListItem.dart';
import 'package:yoroke/screens/info/InfoShareCardListItem.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';

class BookmarkList extends StatefulWidget {
  BookmarkList({Key? key, required this.onPushNavigator}) : super(key: key);

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BookmarkListState createState() => _BookmarkListState();
}

class _BookmarkListState extends State<BookmarkList>
    with TickerProviderStateMixin {
  static final int tabLength = 3;

  late final TabController _tabController;

  late List<Tuple2<String, int>> _tabs = [
    Tuple2("게시물", 0),
    Tuple2("시설", 1),
    Tuple2("정보", 2)
  ];

  late List<Widget> _bookmarkLists;

  get _getBookmarkLists {
    List<Widget> list = <Widget>[];
    list.add(ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return YrkPageListItem(
              pageIndex: 0,
              listIndex: index,
              pageType: SubPageItem.boardReview,
              // TODO: 아이템별로  페이지 타입 정의

              nextPageItem: SubPageItem.post,
              onPushNavigator: widget.onPushNavigator);
        }));
    list.add(ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return HomeHistoryCardListItem(
              index: index, width: double.maxFinite, height: 161.0);
        }));
    list.add(GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        childAspectRatio: 158.0 / 172.0,
        children: _infoShareCards));
    return list;
  }

  get _infoShareCards {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 8; i++) {
      list.add(AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: InfoShareCardListItem(
            width: 158.0,
            height: 172.0,
            index: i,
            onPushNavigator: widget.onPushNavigator,
          )));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabLength);
    _bookmarkLists = _getBookmarkLists;
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
          children: _bookmarkLists,
        ));
  }
}
