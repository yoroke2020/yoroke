import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkCustomScrollView.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

import 'FindFacilityImageListView.dart';
import 'FindFacilityHome.dart';
import 'FindFacilityInfo.dart';

class FindFacility extends StatefulWidget {
  FindFacility({required this.data, required this.onPushNavigator});

  final YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _FindFacilityState createState() => _FindFacilityState();
}

class _FindFacilityState extends State<FindFacility>
    with TickerProviderStateMixin {
  static final int tabLength = 3;
  static final List<String> _bottomButtonTextList = ["북마크", "위치", "전화", "공유"];
  static final List<String> _bottomButtonImageList = [
    "assets/icons/icon_bookmark_color_on_24_px.svg",
    "assets/icons/icon_location_24_px.svg",
    "assets/icons/icon_phone_24_px.svg",
    "assets/icons/icon_share_color_24_px.svg"
  ];

  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  String _facilityName = "조문기네 요양원";
  bool _isScrollable = false;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabLength, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _isScrollable = _tabController.index == 2;
      });
      print(_isScrollable);
    });
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
                        ? "assets/icons/icon_bookmark_color_off_24_px.svg"
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

  @override
  Widget build(BuildContext context) {
    return YrkCustomScrollView(
      controller: _scrollController,
      appBarHeight: 48.0,
      expandedHeight: 236.0,
      flexibleSpaceHeight: 236.0,
      bottomHeight: 48.0,
      bottomNavigationHeight: 72.0,
      isScrollable: _isScrollable,
      isFadedTitle: true,
      fadedTitle: _facilityName,
      isCenteredFadedTitle: true,
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackOnly,
        isStatusBar: false,
      ),
      flexibleSpace: FindFacilityImageListView(),
      bottom: Container(
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
            color: const Color(0xffffffff)),
        alignment: Alignment.bottomLeft,
        child: YrkTabBar(
          textList: ["홈", "정보", "후기"],
          controller: _tabController,
          tabWidth: 48.0,
        ),
      ),
      body: YrkTabView(
        controller: _tabController,
        swipeable: true,
        viewList: [
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
          Container(height: 408, color: Colors.red),
        ],
      ),
      bottomNavigatorBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: Container(
              height: 72.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: getBottomBarButtonList,
              ))),
    );
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
}
