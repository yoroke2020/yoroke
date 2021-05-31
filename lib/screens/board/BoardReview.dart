import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListItem.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';

import 'BoardCardListItem.dart';

class BoardReview extends StatefulWidget {
  BoardReview({required this.data});

  final YrkData? data;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<BoardReview> {
  static final int boardCardListItemCount = 12;

  late int _curCardIndex;
  final ScrollController _scrollController = ScrollController();
  final List<Tuple2<String, int>> _tabs = <Tuple2<String, int>>[
    Tuple2('최신글', 0),
    Tuple2('인기글', 1)
  ];

  List<int> _childCount = [10, 10];

  @override
  void initState() {
    _curCardIndex = widget.data!.i1!;
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
                                expandedHeight: 236.0,
                                backgroundColor: const Color(0xffffffff),
                                title: Stack(children: <Widget>[
                                  YrkAppBar(
                                    type: YrkAppBarType.arrowBackAll,
                                    curPageItem: "boardReview",
                                    isStatusBar: false,
                                  ),
                                  YrkScrollOpacity(
                                      scrollController: _scrollController,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(left: 48.0),
                                          height: 48.0,
                                          child: Text("요양병원 후기",
                                              style: const YrkTextStyle(
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.left)))
                                ]),
                                flexibleSpace: YrkScrollOpacity(
                                  scrollController: _scrollController,
                                  reversed: true,
                                  child: FlexibleSpaceBar(
                                      background: Container(
                                          color: const Color(0xffffffff),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 48.0 +
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .top,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 16.0,
                                                      top: 8.0,
                                                      bottom: 8.0),
                                                  child: Text("후기",
                                                      style: const YrkTextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 22.0),
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                                Container(
                                                    height: 100.0,
                                                    child: ListView.separated(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            boardCardListItemCount,
                                                        separatorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return SizedBox(
                                                              width: 16.0);
                                                        },
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return BoardCardListItem(
                                                            index: index,
                                                            listLength:
                                                                boardCardListItemCount,
                                                            isBorder: index ==
                                                                    _curCardIndex
                                                                ? true
                                                                : false,
                                                            onPushNavigator:
                                                                (data) =>
                                                                    _onPushChangeReviewCard(
                                                                        context,
                                                                        data),
                                                          );
                                                        }))
                                              ]))),
                                ),
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
                                        (BuildContext context, int index) {
                                          return YrkPageListItem(
                                            pageIndex: tab.item2,
                                            listIndex: index,
                                            pageType: "boardReview",
                                            nextPageItem: "post",
                                          );
                                        },
                                        childCount: _childCount[tab.item2],
                                      ))
                                    ]));
                          }));
                    }).toList())))),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
  }

  void _onPushChangeReviewCard(BuildContext context, YrkData data) {
    setState(() {
      _curCardIndex = data.i1!;
      _childCount.fillRange(0, _childCount.length - 1, 10);
      DefaultTabController.of(context)!.animateTo(0);
    });
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
