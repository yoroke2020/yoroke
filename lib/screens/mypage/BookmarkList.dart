import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/info/InfoShareCardListItem.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabLength);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> _postListItem(int pageIndex) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 8; i++) {
      list.add(new YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        // TODO: 아이템별로  페이지 타입 정의
        pageType: SubPageItem.boardReview,
        nextPageItem: SubPageItem.post,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
    return list;
  }

  List<Widget> _findCardListItem(int pageIndex) {
    double _expandWidth = MediaQuery.of(context).size.width - 32 - 16;

    List<Widget> list = <Widget>[];
    for (int i = 0; i < 8; i++) {
      list.add(new InfoShareCardListItem(
        width: _expandWidth,
        height: 104,
        index: i,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
    return list;
  }

  List<Widget> _infoShareCardListItem(int pageIndex) {
    double _expandWidth = MediaQuery.of(context).size.width - 32 - 16;

    List<Widget> list = <Widget>[];
    for (int i = 0; i < 8; i++) {
      list.add(Container(
          width: _expandWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InfoShareCardListItem(
                width: (_expandWidth - 24) / 2,
                height: (_expandWidth - 24) / 2,
                index: i,
                onPushNavigator: widget.onPushNavigator,
              ),
              InfoShareCardListItem(
                width: (_expandWidth - 24) / 2,
                height: (_expandWidth - 24) / 2,
                index: i + 1,
                onPushNavigator: widget.onPushNavigator,
              ),
            ],
          )));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackMidTitle,
        label: "북마크",
      ),
      body: SingleChildScrollView(
        child: YrkTabBarView(
          controller: _tabController,
          tabWidth: 99,
          tabViewHeight:
              MediaQuery.of(context).size.height - kToolbarHeight - 40.0 - 48.0,
          tabTextList: ["게시물", "시설", "정보"],
          tabViewList: [
            YrkListView(
              pageIndex: 0,
              itemCount: 8,
              scrollable: true,
              item: _postListItem(0),
            ),
            YrkListView(
              pageIndex: 1,
              itemCount: 8,
              scrollable: true,
              item: _findCardListItem(1),
            ),
            YrkListView(
              pageIndex: 2,
              itemCount: 4,
              scrollable: true,
              item: _infoShareCardListItem(2),
            ),
          ],
        ),
      ),
    );
  }
}
