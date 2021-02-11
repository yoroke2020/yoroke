import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yoroke/navigator/PageItem.dart';

class BottomBarNavigation extends StatefulWidget {
  RootPageItem _currentRootPageTab;
  ValueChanged<RootPageItem> _onSelectRootPageTab;

  static BottomBarNavigation _instance;

  BottomBarNavigation._internal();

  static BottomBarNavigation getInstance() {
    if (_instance == null) _instance = BottomBarNavigation._internal();
    return _instance;
  }

  void setCurrentRootPageTab(RootPageItem rootPageItem) {
    this._currentRootPageTab = rootPageItem;
  }

  void setOnSelectRootPageTab(ValueChanged<RootPageItem> onSelectPageTab) {
    this._onSelectRootPageTab = onSelectPageTab;
  }

  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  RootPageItem _currentRootPageTab;
  Map _iconMap;

  BottomNavigationBarItem _buildItem(RootPageItem rootPageItem) {
    return BottomNavigationBarItem(
        icon: _getIcon(rootPageItem), label: rootPageTabLabelInfo[rootPageItem]);
  }

  void _onTap(int index) {
    widget._onSelectRootPageTab(RootPageItem.values[index]);
  }

  Image _getIcon(RootPageItem rootPageItem) {
    return _currentRootPageTab == rootPageItem
        ? Image.asset(_iconMap[rootPageTabIconInfo[rootPageItem]]['selectedImage'])
        : Image.asset(_iconMap[rootPageTabIconInfo[rootPageItem]]['image']);
  }

  // TODO _memorizer 캐시 적용
  Future<String> _loadAsset(String target) async {
    return await rootBundle.loadString(target);
  }

  @override
  Widget build(BuildContext context) {
    if (_currentRootPageTab == null) _currentRootPageTab = widget._currentRootPageTab;

    return FutureBuilder(
        future: _loadAsset('assets/icons/icons.json'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false || snapshot.hasError) {
            return CircularProgressIndicator();
          } else {
            _iconMap = json.decode(snapshot.data);
            return BottomNavigationBar(
            backgroundColor: const Color(0xffffffff),
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentRootPageTab.index,
              items: [
                _buildItem(RootPageItem.home),
                _buildItem(RootPageItem.board),
                _buildItem(RootPageItem.find),
                _buildItem(RootPageItem.info),
              ],
              onTap: _onTap,
              selectedItemColor: const Color(0xffe2bf00),
              selectedFontSize: 12.0,
              unselectedFontSize: 12.0,
            );
          }
        });
  }
}
