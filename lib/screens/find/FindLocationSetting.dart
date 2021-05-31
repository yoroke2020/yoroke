import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';

import 'FindLocationData.dart';

class FindLocationSetting extends StatefulWidget {
  FindLocationSetting({required this.locSelects, required this.locCount});

  final List<List<bool>> locSelects;
  final int locCount;

  @override
  _FindLocationSettingState createState() => _FindLocationSettingState();
}

class _FindLocationSettingState extends State<FindLocationSetting>
    with TickerProviderStateMixin {
  late TabController _tabController;

  late List<Tuple2<String, int>> _tabs = <Tuple2<String, int>>[];

  List<List<bool>> _locSelects = [];
  late int _locCount = 0;

  @override
  void initState() {
    super.initState();

    //TODO: Change to JSON
    for (int i = 0; i < LocName.cities.length; i++) {
      _tabs.add(Tuple2(LocName.cities[i][0], i));
    }

    for (int i = 0; i < widget.locSelects.length; i++) {
      List<bool> list = [...widget.locSelects[i]];
      _locSelects.add(list);
    }
    _locCount = widget.locCount;

    _tabController = TabController(length: LocName.cities.length, vsync: this);
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
            preferredSize: Size.fromHeight(98.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  YrkAppBar(
                      type: YrkAppBarType.arrowBackMidTitle, label: "지역설정"),
                  CustomTapBar(
                      controller: _tabController,
                      isScrollable: true,
                      tabs: _tabs)
                ])),
        body: TabBarView(
            children: _getTabViewButtonGrids, controller: _tabController),
        bottomNavigationBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: YrkButton(
                    buttonType: ButtonType.solid,
                    label: "지역 저장",
                    textStyle: YrkTextStyle(
                      color: _locCount != 0
                          ? const Color(0xe6000000)
                          : const Color(0x4d000000),
                      fontWeight: FontWeight.w500,
                    ),
                    fillColor: _locCount != 0
                        ? const Color(0xfff5df4d)
                        : const Color(0xfff4f4f4),
                    clickable: _locCount != 0,
                    onPressed: () => _onPressedSave(context)))));
  }

  get _getTabViewButtonGrids {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < LocName.cities.length; i++) {
      list.add(GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 156.0 / 44.0,
          children: _getCityButtons(i)));
    }
    return list;
  }

  List<Widget> _getCityButtons(int index) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < _locSelects[index].length; i++) {
      list.add(YrkButton(
          width: 156.0,
          height: 44,
          buttonType: ButtonType.outline,
          borderWidth: _locSelects[index][i] ? 2.0 : 1.0,
          borderColor: _locSelects[index][i]
              ? const Color(0xfff5df4d)
              : const Color(0x4d000000),
          label: i != 0 ? LocName.cities[index][i] : "전체",
          textStyle: YrkTextStyle(
            color: _locSelects[index][i]
                ? const Color(0xe6000000)
                : const Color(0x4d000000),
            fontWeight: FontWeight.w500,
          ),
          onPressed: () => setState(() {
                _onPressedCityButton(index, i);
              })));
    }
    return list;
  }

  void _onPressedSave(BuildContext context) {
    Navigator.pop(context, _locSelects);
  }

  void _onPressedCityButton(int regionIndex, int cityIndex) {
    bool selected = !_locSelects[regionIndex][cityIndex];
    int selectedCount = 0;
    _locSelects[regionIndex][cityIndex] = selected;
    if (cityIndex == 0) {
      for (int i = 1; i < _locSelects[regionIndex].length; i++) {
        selectedCount += _locSelects[regionIndex][i] != selected ? 1 : 0;
        _locSelects[regionIndex][i] = selected;
      }
    } else {
      selectedCount += 1;
      if (_locSelects[regionIndex][cityIndex]) {
        int count = _locSelects[regionIndex]
            .where((element) => element == true)
            .toList()
            .length;
        _locSelects[regionIndex][0] =
            count == _locSelects[regionIndex].length - 1;
      } else
        _locSelects[regionIndex][0] = false;
    }
    _locCount += selected ? selectedCount : -selectedCount;
  }
}
