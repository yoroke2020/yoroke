import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoroke/controllers/YrkSelectFilterController.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';

import 'FindFacilityBottomBar.dart';
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

  final YrkSelectFilterController controller =
      YrkSelectFilterController(length: 3);
  String _facilityName = "조문기네 요양원";

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
                floatingActionButton: FloatingActionButton(
                    onPressed: () => widget.onPushNavigator!(
                        YrkData(nextPageItem: SubPageItem.testPage))),
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
                      FindFacilityReview(
                        onPushNavigator: widget.onPushNavigator!,
                      )
                    ])),
                bottomNavigationBar: FindFacilityBottomBar())));
  }
}
