import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/main.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListItem.dart';
import 'package:yoroke/screens/common/YrkPage.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'BoardCardListItem.dart';

class Board extends StatefulWidget {
  Board({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final int _boardCardListItemCount = 12;

  final PageController _qnaPageController = PageController();
  final PageController _jobFindingPageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildBoardYrkListView(subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(ListView(
          physics: NeverScrollableScrollPhysics(),
          children: _buildList(i, subPageItem)));
    }
    return list;
  }

  List<Widget> _buildList(int pageIndex, subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        pageType: subPageItem,
        nextPageItem: "post",
        // onPushNavigator: widget.onPushNavigator,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YrkAppBar(
        type: YrkAppBarType.accountCircleAll,
        curPageItem: RootPageItem.board,
      ),
      drawer: yrkDrawer,
      bottomNavigationBar: BottomBarNavigation.getInstance(RootPageItem.board),
      body: ListView(
        children: <Widget>[
          YrkTabHeaderView(
            title: "후기",
            clickable: true,
            onPushNavigator: widget.onPushNavigator,
            // nextSubPageItem: SubPageItem.boardReview,
          ),
          Container(
            height: 100.0,
            alignment: Alignment.centerLeft,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _boardCardListItemCount,
              itemBuilder: (BuildContext context, int index) {
                return BoardCardListItem(
                  index: index,
                  listLength: _boardCardListItemCount,
                  onPushNavigator: widget.onPushNavigator,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 18.0);
              },
            ),
          ),
          YrkTabHeaderView(
            title: "고민/질문",
            clickable: true,
            onPushNavigator: widget.onPushNavigator,
            // nextSubPageItem: SubPageItem.boardQna,
          ),
          YrkPage(
            page: _buildBoardYrkListView("boardQna"),
            controller: _qnaPageController,
            isIndicatorEnabled: true,
          ),
          YrkTabHeaderView(
            title: "구인구직",
            clickable: true,
            onPushNavigator: widget.onPushNavigator,
            // nextSubPageItem: SubPageItem.boardJobFinding,
          ),
          YrkPage(
              page: _buildBoardYrkListView("boardJobFinding"),
              controller: _jobFindingPageController,
              isIndicatorEnabled: true)
        ],
      ),
    );
  }
}
