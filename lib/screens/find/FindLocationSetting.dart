import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

import 'FindLocationData.dart';

Future<T?> showFindLocationSetting<T>({
  required BuildContext context,
  required double statusBarHeight,
  required FindLocationData locationData,
  required ValueChanged<FindLocationData> onPressedSaveButton,
}) async {
  FocusScope.of(context).unfocus();
  showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FindLocationSetting(
          statusBarHeight: statusBarHeight,
          locationData: locationData,
          onPressedSaveButton: onPressedSaveButton,
        );
      });
}

class FindLocationSetting extends StatefulWidget {
  FindLocationSetting(
      {required this.statusBarHeight,
      required this.locationData,
      required this.onPressedSaveButton});

  final double statusBarHeight;
  final FindLocationData locationData;
  final ValueChanged<FindLocationData> onPressedSaveButton;

  @override
  _FindLocationSettingState createState() => _FindLocationSettingState();
}

class _FindLocationSettingState extends State<FindLocationSetting>
    with TickerProviderStateMixin {
  late TabController _tabController;

  late FindLocationData locationData;

  @override
  void initState() {
    super.initState();

    //TODO: Change to JSON
    locationData = widget.locationData;

    _tabController =
        TabController(length: locationData.regionListLength, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(98.0 + widget.statusBarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: widget.statusBarHeight,
            ),
            YrkAppBar(
              type: YrkAppBarType.arrowBackMidTitle,
              label: "지역설정",
              isStatusBar: false,
            ),
            YrkTabBar(
              textList: LocationName.regionNameList,
              controller: _tabController,
              height: 40.0,
              tabScrollable: true,
            )
          ],
        ),
      ),
      body: YrkTabView(
        viewList: _getTabViewButtonGrids,
        controller: _tabController,
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: YrkButton(
              buttonType: ButtonType.solid,
              label: "지역 저장",
              textStyle: YrkTextStyle(
                color: locationData.isNotEmpty()
                    ? const Color(0xe6000000)
                    : const Color(0x4d000000),
                fontWeight: FontWeight.w500,
              ),
              fillColor: locationData.isNotEmpty()
                  ? const Color(0xfff5df4d)
                  : const Color(0xfff4f4f4),
              clickable: locationData.isNotEmpty(),
              onPressed: () {
                widget.onPressedSaveButton(locationData);
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }

  get _getTabViewButtonGrids {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < locationData.regionListLength; i++) {
      list.add(GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 156 / 44,
          children: _getCityButtons(i)));
    }
    return list;
  }

  List<Widget> _getCityButtons(int index) {
    List<Widget> list = <Widget>[];
    list.add(YrkButton(
        width: 156.0,
        height: 44,
        buttonType: ButtonType.outline,
        borderWidth: locationData.isRegionSelected(index) ? 2.0 : 1.0,
        borderColor: locationData.isRegionSelected(index)
            ? const Color(0xfff5df4d)
            : const Color(0x4d000000),
        label: "전체",
        textStyle: YrkTextStyle(
          color: locationData.isRegionSelected(index)
              ? const Color(0xe6000000)
              : const Color(0x4d000000),
          fontWeight: FontWeight.w500,
        ),
        onPressed: () => setState(() {
              locationData.onPressedAllButton(index);
            })));
    for (int i = 0; i < locationData.regionList[index].cityListLength; i++) {
      list.add(YrkButton(
          width: 156.0,
          height: 44,
          buttonType: ButtonType.outline,
          borderWidth: locationData.isCitySelected(index, i) ? 2.0 : 1.0,
          borderColor: locationData.isCitySelected(index, i)
              ? const Color(0xfff5df4d)
              : const Color(0x4d000000),
          label: LocationName.cityNameList[index][i],
          textStyle: YrkTextStyle(
            color: locationData.isCitySelected(index, i)
                ? const Color(0xe6000000)
                : const Color(0x4d000000),
            fontWeight: FontWeight.w500,
          ),
          onPressed: () => setState(() {
                locationData.onPressedCityButton(index, i);
              })));
    }
    return list;
  }
}
