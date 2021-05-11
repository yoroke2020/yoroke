import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

import 'FindRecommendListItem.dart';

class Find extends StatefulWidget {
  Find({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> with TickerProviderStateMixin {
  static final int tabLength = 5;
  static final List<String> tabViewOptionList = [
    "별점 높은 순",
    "시설 등급 순",
    "가까운 순",
    "후기 많은 순"
  ];

  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabLength, vsync: this);
  }

  get _getTabViewOptionList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(
        Padding(
          padding: EdgeInsets.only(right: 7.0),
          child: YrkButton(
            width: i != 2 ? 80.0 : 66.0,
            height: 32.0,
            buttonType: ButtonType.outline,
            borderWidth: 1,
            borderColor: const Color(0x4d000000),
            label: tabViewOptionList[i],
            textStyle: const YrkTextStyle(
                color: const Color(0x99000000), fontSize: 13.0),
            onPressed: () {},
          ),
        ),
      );
    }
    return list;
  }

  get _getTabViewList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < tabLength; i++) {
      list.add(Column(
        children: [
          YrkListView(
            height: 264.0 * 20,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              pageIndex: i,
              itemCount: 20,
              item: _buildTabViewListItem(i, 0, 20))
        ],
      ));
    }

    return list;
  }

  List<Widget> _buildTabViewListItem(int pageIndex, int start, int end) {
    List<Widget> list = <Widget>[];
    for (int i = start; i < end; i++) {
      list.add(FindRecommendListItem(
        pageIndex: pageIndex,
        listIndex: i,
        onPushNavigator: widget.onPushNavigator,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(192.0),
          child: Column(children: [
            //  [1] - AppBar
            YrkAppBar(
              onPushNavigator: widget.onPushNavigator,
              type: YrkAppBarType.TextSearch,
              label: "시설찾기",
            ),
            // [2] - Select Location
            InkWell(
              child: Container(
                  width: double.maxFinite,
                  height: 48.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      YrkIconButton(
                        icon: "assets/icons/icon_find_facility_24_px.svg",
                        width: 24.0,
                        height: 24.0,
                        padding: EdgeInsets.only(right: 8.0),
                        color: const Color(0xfff5df4d),
                        clickable: false,
                      ),
                      Text(
                        "지역 선택",
                        style: const YrkTextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.0),
                      ),
                      YrkIconButton(
                        icon: "assets/icons/icon_navigate_next_24_px.svg",
                        width: 24.0,
                        height: 24.0,
                        padding: EdgeInsets.only(left: 6.0),
                        clickable: false,
                      ),
                    ],
                  )),
            ),
            // [3] - TabBar
            YrkTabBar(
              textList: ["요양원", "요양병원", "복지관", "경로당", "노인교실"],
              controller: _tabController,
              height: 40.0,
              tabWidth: 72.0,
              tabScrollable: true,
            ),
            // [4] - Options for TabView
            Container(
                width: double.maxFinite,
                height: 56.0,
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: _getTabViewOptionList,
                )),
          ]),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: double.maxFinite,
                height: 48.0,
                padding: EdgeInsets.only(left: 16.0, bottom: 16.0, top: 8.0),
                child: Text("추천 시설",
                    style: const YrkTextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16.0),
                    textAlign: TextAlign.left)),
            // [5] - TabView
            YrkTabView(
                height: 264.0 * 20,
                viewList: _getTabViewList,
                controller: _tabController)
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => widget.onPushNavigator!(
              new YrkData(nextPageItem: SubPageItem.testPage)),
        ),
        drawer: YrkDrawer(
          onPushNavigator: widget.onPushNavigator,
          context: context,
        ));
  }
}
