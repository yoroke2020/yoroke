import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/controllers/YrkSelectFilterController.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';

import 'FindFacilityHome.dart';
import 'FindFacilityImageListView.dart';
import 'FindFacilityInfo.dart';
import 'FindFacilityReview.dart';

class FindFacility extends StatefulWidget {
  FindFacility({required this.data, required this.onPushNavigator});

  final YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<FindFacility> {
  final ScrollController _scrollController = ScrollController();
  final List<Tuple2<String, int>> _tabs = <Tuple2<String, int>>[
    Tuple2('홈', 0),
    Tuple2('정보', 1),
    Tuple2('후기', 2)
  ];

  static final List<String> _bottomButtonTextList = ["북마크", "위치", "전화", "공유"];
  static final List<String> _bottomButtonImageList = [
    "assets/icons/icon_bookmark_on.svg",
    "assets/icons/icon_location.svg",
    "assets/icons/icon_phone.svg",
    "assets/icons/icon_share_color.svg"
  ];

  final YrkSelectFilterController controller =
      YrkSelectFilterController(length: 3);
  String _facilityName = "조문기네 요양원";
  bool _isBookmarked = false;

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
                                expandedHeight: 236.0,
                                backgroundColor: const Color(0xffffffff),
                                title: Stack(children: <Widget>[
                                  YrkAppBar(
                                    type: YrkAppBarType.arrowBackOnly,
                                    isStatusBar: false,
                                  ),
                                ]),
                                flexibleSpace: YrkScrollOpacity(
                                  scrollController: _scrollController,
                                  child: FindFacilityImageListView(),
                                  reversed: true,
                                ),
                                forceElevated: innerBoxIsScrolled,
                                bottom: PreferredSize(
                                    preferredSize: Size.fromHeight(48.0),
                                    child: Container(
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                topRight:
                                                    Radius.circular(16.0)),
                                            color: const Color(0xffffffff)),
                                        alignment: Alignment.bottomLeft,
                                        child: CustomTapBar(
                                            tabs: _tabs, tabWidth: 48.0)))))
                      ];
                    },
                    body: TabBarView(children: [
                      FindFacilityHome(
                          name: _facilityName,
                          location: "서울시 서초구 양재대로 39",
                          rating: "4.8 (12)",
                          distance: 2,
                          hours: "08:00 ~ 22:00",
                          introduction: "시설소개 시설소개 시설소개 시설소개" +
                              "시설소개 시설소개 시설소개 시설소개" +
                              "시설소개 시설소개 시설소개 시설소개" +
                              "시설소개 시설소개 시설소개 시설소개" +
                              "시설소개 시설소개 시설소개 시설소개" +
                              "시설소개 시설소개 시설소개 시설소개"),
                      FindFacilityInfo(
                        grade: "A",
                        medicalStaffNum: 42,
                        nursingStaffNum: 135,
                        cookNum: 35,
                        userNum: 1322,
                        minMonthlyCost: 100,
                        maxMonthlyCost: 200,
                      ),
                      FindFacilityReview()
                    ])),
                bottomNavigationBar: PreferredSize(
                    preferredSize: Size.fromHeight(72),
                    child: Container(
                        height: 72.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: getBottomBarButtonList,
                        ))))));
  }

  void _onTapBottomBarButton(int index) {
    switch (index) {
      case 0:
        setState(() {
          _isBookmarked = !_isBookmarked;
        });
        break;
      default:
        return;
    }
  }

  get getBottomBarButtonList {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(Expanded(
        child: InkWell(
          onTap: () => _onTapBottomBarButton(i),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              YrkIconButton(
                icon: _isBookmarked
                    ? _bottomButtonImageList[i]
                    : i == 0
                        ? "assets/icons/icon_bookmark_off.svg"
                        : _bottomButtonImageList[i],
                width: 24.0,
                height: 24.0,
                padding: EdgeInsets.all(2.0),
                clickable: false,
              ),
              Text(
                _bottomButtonTextList[i],
                style: const YrkTextStyle(),
              )
            ],
          ),
        ),
      ));
      if (i < 3) {
        list.add(Container(
            width: 1,
            height: 24,
            decoration: BoxDecoration(color: const Color(0xffe5e5e5))));
      }
    }
    return list;
  }
}
