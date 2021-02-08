import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yoroke/navigator/TabItem.dart';

class BottomNavigation extends StatefulWidget {
  static BottomNavigation _instance;

  BottomNavigation._internal();

  static BottomNavigation getInstance() {
    if (_instance == null)
      _instance = BottomNavigation._internal();
    return _instance;
  }

  void setCurrentTab(TabItem tabItem, bool onTap) {
    this.currentTab = tabItem;
  }

  void setSelectTab(ValueChanged<TabItem> onSelectTab) {
    this.onSelectTab = onSelectTab;
  }

  TabItem currentTab;
  ValueChanged<TabItem> onSelectTab;
  _BottomNavigationState state;

  @override
  State<StatefulWidget> createState() {
    state = _BottomNavigationState();
    return state;
  }

}

class _BottomNavigationState extends State<BottomNavigation> {
  TabItem currentTab;
  Map iconMap;

  @override
  Widget build(BuildContext context) {
    if(currentTab == null)
      currentTab = widget.currentTab;

    return FutureBuilder(
        future: loadAsset('assets/icons/icons.json'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false || snapshot.hasError) {
            return CircularProgressIndicator();
          } else {
            iconMap = json.decode(snapshot.data);
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentTab.index,
              items: [
                _buildItem(TabItem.home),
                _buildItem(TabItem.board),
                _buildItem(TabItem.find),
                _buildItem(TabItem.info),
              ],
              onTap: _onTap,
            );
          }
        });
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
        icon: _getIcon(tabItem), label: tabLabelInfo[tabItem]);
  }

  void _onTap(int index) {
    widget.onSelectTab(TabItem.values[index]);
    setState(() {
      this.currentTab = TabItem.values[index];
    });
  }

  void onValueChanged(int index) {
    _onTap(index);
  }

  Image _getIcon(TabItem tabItem) {
    return currentTab == tabItem
        ? Image.asset(iconMap[tabIconInfo[tabItem]]['selectedImage'])
        : Image.asset(iconMap[tabIconInfo[tabItem]]['image']);
  }

  // TODO _memorizer 캐시 적용
  Future<String> loadAsset(String target) async {
    return await rootBundle.loadString(target);
  }
}
