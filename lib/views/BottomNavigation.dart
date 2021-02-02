import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yoroke/navigator/TabItem.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({@required this.currentTab, @required this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  Map iconMap;

  @override
  Widget build(BuildContext context) {
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
    onSelectTab(TabItem.values[index]);
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
