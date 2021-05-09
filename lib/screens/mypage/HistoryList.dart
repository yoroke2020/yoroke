import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

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

  List<Widget> _infoShareCardListItem(int pageIndex, SubPageItem pageType) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 8; i++) {
      list.add(new YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        pageType: pageType,
        nextPageItem: SubPageItem.post,
        onPushNavigator: widget.onPushNavigator,
      ));
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
          tabTextList: ["후기", "고민/질문", "구인구직"],
          tabViewList: [
            YrkListView(
              pageIndex: 0,
              itemCount: 8,
              scrollable: true,
              item: _infoShareCardListItem(0, SubPageItem.boardReview),
            ),
            YrkListView(
              pageIndex: 1,
              itemCount: 8,
              scrollable: true,
              item: _infoShareCardListItem(1, SubPageItem.boardQna),
            ),
            YrkListView(
              pageIndex: 2,
              itemCount: 4,
              scrollable: true,
              item: _infoShareCardListItem(2, SubPageItem.boardJobFinding),
            ),
          ],
        ),
      ),
    );
  }
}
