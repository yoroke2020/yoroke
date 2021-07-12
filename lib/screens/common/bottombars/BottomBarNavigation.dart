import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

var navIconsOff = [
  "icon_nav_home.svg",
  "icon_nav_board.svg",
  "icon_nav_find_facility.svg",
  "icon_nav_information.svg",
];

var navIconsOn = [
  "icon_nav_home_on.svg",
  "icon_nav_board_on.svg",
  "icon_nav_find_facility_on.svg",
  "icon_nav_information_on.svg",
];

// ignore: must_be_immutable
class BottomBarNavigation extends StatefulWidget {
  BottomBarNavigation({required this.onTap});
  final ValueChanged<int> onTap;
  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  RootPageItem? _curRootPageItem;

  BottomNavigationBarItem _buildItem(RootPageItem rootPageItem) {
    return BottomNavigationBarItem(
        icon: _getIcon(rootPageItem),
        label: rootPageTabLabelInfo[rootPageItem]);
  }

  YrkIconButton _getIcon(RootPageItem rootPageItem) {
    return _curRootPageItem == rootPageItem
        ? YrkIconButton(
            icon: navIconsOn[rootPageItem.index],
            width: 24.0,
            height: 24.0,
            color: Color(0xffe2bf00),
          )
        : YrkIconButton(
            icon: navIconsOff[rootPageItem.index],
            width: 24.0,
            height: 24.0,
          );
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      items: [
        _buildItem(RootPageItem.home),
        _buildItem(RootPageItem.board),
        _buildItem(RootPageItem.find),
        _buildItem(RootPageItem.info),
      ],
      onTap: (index) => onTapItems(index),
      selectedItemColor: const Color(0xffe2bf00),
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
    );
  }

  void onTapItems(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onTap(index);
    });
  }
}
