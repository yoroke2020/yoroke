import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkPageView.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

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

  late List<Widget> _reviewCardList;

  @override
  void initState() {
    super.initState();
    _reviewCardList = _getReviewCardList;
  }

  get _getReviewCardList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < _boardCardListItemCount; i++) {
      list.add(BoardCardListItem(
        index: i,
        listLength: _boardCardListItemCount,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
    return list;
  }

  List<Widget> _buildBoardYrkListView(SubPageItem subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(ListView(
          physics: NeverScrollableScrollPhysics(),
          children: _buildList(i, subPageItem)));
    }
    return list;
  }

  List<Widget> _buildList(int pageIndex, SubPageItem subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        pageType: subPageItem,
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
        type: YrkAppBarType.accountCircleAll,
        onPushNavigator: widget.onPushNavigator,
        curPageItem: RootPageItem.board,
      ),
      drawer: YrkDrawer(
        onPushNavigator: widget.onPushNavigator,
        context: context,
      ),
      body: ListView(
        children: <Widget>[
          YrkTabHeaderView(
            title: "후기",
            clickable: true,
            onPushNavigator: widget.onPushNavigator,
            nextSubPageItem: SubPageItem.boardReview,
          ),
          Container(
            height: 100.0,
            alignment: Alignment.centerLeft,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _reviewCardList.length,
              itemBuilder: (BuildContext context, int index) {
                return _reviewCardList[index];
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
            nextSubPageItem: SubPageItem.boardQna,
          ),
          YrkPageView(
            page: _buildBoardYrkListView(SubPageItem.boardQna),
            controller: _qnaPageController,
            isIndicatorEnabled: true,
          ),
          YrkTabHeaderView(
            title: "구인구직",
            clickable: true,
            onPushNavigator: widget.onPushNavigator,
            nextSubPageItem: SubPageItem.boardJobFinding,
          ),
          YrkPageView(
              page: _buildBoardYrkListView(SubPageItem.boardJobFinding),
              controller: _jobFindingPageController,
              isIndicatorEnabled: true)
        ],
      ),
    );
  }
}
