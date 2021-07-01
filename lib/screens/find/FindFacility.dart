import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/controllers/YrkSelectFilterController.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/FacilityModel.dart';
import 'package:yoroke/screens/common/YrkScrollOpacity.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';
import 'package:yoroke/temp/YrkTestModelData.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';

import 'FindFacilityBottomBar.dart';
import 'FindFacilityHome.dart';
import 'FindFacilityImageListView.dart';
import 'FindFacilityInfo.dart';
import 'FindFacilityReview.dart';

class FindFacility extends StatefulWidget {
  FindFacility({
    required this.data,
  });

  final FacilityModel data;

  @override
  _BoardReviewState createState() => _BoardReviewState();
}

class _BoardReviewState extends State<FindFacility> with ScreenState<YrkBlock2> {
  final ScrollController _scrollController = ScrollController();
  List<Tuple2<String, int>> tabs = [];

  final YrkSelectFilterController controller =
      YrkSelectFilterController(length: 3);

  @override
  void initBlock() {
    Map<String, dynamic> jsonResponse = TestFindFacilityData().jsonResponse;
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    List<YrkBlock2> blocks = apiResponse.body!;
    this.block = YrkBlock2()..blocks = blocks;
  }

  @override
  void updateBlockOn(String action) {
  }

  @override
  void initState() {
    super.initState();
    initBlock();

    YrkBlock2 tabBlock = this.block.blocks![0] as YrkBlock2;
    for (int i = 0; i < tabBlock.blocks!.length; i++)
      tabs.add(Tuple2(tabBlock.blocks![i].title, i));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: tabs.length,
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
                                            tabs: tabs, tabWidth: 48.0)))))
                      ];
                    },
                    body: TabBarView(children: [
                      FindFacilityHome(
                          model: widget.data),
                      FindFacilityInfo(
                          model: widget.data),
                      FindFacilityReview()
                    ])),
                bottomNavigationBar: FindFacilityBottomBar())));
  }
}
