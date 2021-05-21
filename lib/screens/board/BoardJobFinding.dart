import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'BoardReview.dart';

class BoardJobFinding extends StatefulWidget {
  BoardJobFinding({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardJobFindingState createState() => _BoardJobFindingState();
}

class _BoardJobFindingState extends State<BoardJobFinding> {
  final ScrollController _scrollController = ScrollController();
  final List<Tuple2<String, int>> _tabs = <Tuple2<String, int>>[
    Tuple2('구인', 0),
    Tuple2('구직', 1)
  ];

  List<int> _childCount = [10, 10];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: _tabs.length,
            child: Scaffold(
                body: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverOverlapAbsorber(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                            sliver: SliverAppBar(
                                automaticallyImplyLeading: false,
                                snap: false,
                                pinned: true,
                                floating: false,
                                centerTitle: false,
                                titleSpacing: 0.0,
                                shadowColor: const Color(0xffffffff),
                                elevation: 0.0,
                                toolbarHeight: 48.0,
                                expandedHeight: 144.0,
                                backgroundColor: const Color(0xffffffff),
                                title: Stack(children: <Widget>[
                                  YrkAppBar(
                                    type: YrkAppBarType.arrowBackAll,
                                    onPushNavigator: widget.onPushNavigator!,
                                    curPageItem: SubPageItem.boardJobFinding,
                                    isStatusBar: false,
                                  ),
                                  YrkScrollFadedWidget(
                                      scrollController: _scrollController,
                                      child: Container(
                                          height: 48.0,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(left: 48.0),
                                          child: Text("구인구직",
                                              style: const YrkTextStyle(
                                                  color:
                                                      const Color(0xe6000000),
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.left)))
                                ]),
                                flexibleSpace: FlexibleSpaceBar(
                                    background: Container(
                                        color: const Color(0xffffffff),
                                        child: Column(children: <Widget>[
                                          Container(
                                            width: double.maxFinite,
                                            height: 48.0 +
                                                MediaQuery.of(context)
                                                    .padding
                                                    .top,
                                          ),
                                          Container(
                                              width: double.maxFinite,
                                              height: 48.0,
                                              margin:
                                                  EdgeInsets.only(left: 16.0),
                                              child: Text("구인구직",
                                                  style: const YrkTextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 22.0),
                                                  textAlign: TextAlign.left)),
                                        ]))),
                                forceElevated: innerBoxIsScrolled,
                                bottom:
                                    CustomTapBar(tabs: _tabs, tabWidth: 72.0)))
                      ];
                    },
                    body: TabBarView(
                        children: _tabs.map((Tuple2 tab) {
                      return SafeArea(
                          top: false,
                          bottom: false,
                          child: Builder(builder: (BuildContext context) {
                            return NotificationListener<ScrollNotification>(
                                onNotification: (notification) =>
                                    _onScrollNotification(
                                        notification, tab.item2),
                                child: CustomScrollView(
                                    key: PageStorageKey<String>(tab.item1),
                                    slivers: <Widget>[
                                      SliverOverlapInjector(
                                        handle: NestedScrollView
                                            .sliverOverlapAbsorberHandleFor(
                                                context),
                                      ),
                                      SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                              (BuildContext context,
                                                  int index) {
                                        return YrkPageListItem(
                                          pageIndex: tab.item2,
                                          listIndex: index,
                                          pageType: SubPageItem.boardJobFinding,
                                          nextPageItem: SubPageItem.post,
                                          onPushNavigator:
                                              widget.onPushNavigator,
                                        );
                                      }, childCount: _childCount[tab.item2]))
                                    ]));
                          }));
                    }).toList())))),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
  }

  bool _onScrollNotification(ScrollNotification notification, int index) {
    if (notification is! ScrollEndNotification) return false;

    if (notification.metrics.extentBefore ==
        notification.metrics.maxScrollExtent) {
      setState(() {
        _childCount[index] += 10;
      });
    }
    return true;
  }
}
