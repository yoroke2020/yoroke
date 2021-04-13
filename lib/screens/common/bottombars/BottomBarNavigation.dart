import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yoroke/navigator/PageItem.dart';

class BottomBarNavigation extends StatefulWidget {
  RootPageItem? _curRootPageItem;
  late ValueChanged<RootPageItem> _onSelectRootPageItem;

  static BottomBarNavigation? _instance;

  BottomBarNavigation._internal();

  static BottomBarNavigation? getInstance(RootPageItem currentRootPageItem) {
    if (_instance == null) _instance = BottomBarNavigation._internal();
    _instance!._curRootPageItem = currentRootPageItem;
    return _instance;
  }

  void setOnSelectRootPageItem(ValueChanged<RootPageItem> onSelectPageTab) {
    this._onSelectRootPageItem = onSelectPageTab;
  }

  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  RootPageItem? _curRootPageItem;
  Map? _iconMap;

  BottomNavigationBarItem _buildItem(RootPageItem rootPageItem) {
    return BottomNavigationBarItem(
        icon: _getIcon(rootPageItem), label: rootPageTabLabelInfo[rootPageItem]);
  }

  void _onTap(int index) {
    widget._onSelectRootPageItem(RootPageItem.values[index]);
  }

  Image _getIcon(RootPageItem rootPageItem) {
    return _curRootPageItem == rootPageItem
        ? Image.asset(_iconMap![rootPageTabIconInfo[rootPageItem]]['selectedImage'])
        : Image.asset(_iconMap![rootPageTabIconInfo[rootPageItem]]['image']);
  }

  // TODO _memorizer 캐시 적용
  Future<String> _loadAsset(String target) async {
    return await rootBundle.loadString(target);
  }

  @override
  Widget build(BuildContext context) {
    if (_curRootPageItem == null) _curRootPageItem = widget._curRootPageItem;

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
              currentIndex: _curRootPageItem!.index,
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
