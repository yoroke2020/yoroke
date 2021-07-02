import 'package:flutter/material.dart';
import 'package:yoroke/controllers/ProfileController.dart';
import 'package:yoroke/screens/board/Board.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/find/Find.dart';
import 'package:yoroke/screens/home/Home.dart';
import 'package:yoroke/screens/info/Info.dart';

void main() {
  runApp(MyApp());
}

final ProfileController profileController = ProfileController();
final YrkDrawer yrkDrawer = YrkDrawer();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Yoroke 2020',
        theme: ThemeData(
            primarySwatch: MaterialColor(0xfff5df4d, const <int, Color>{
              50: const Color(0xfff5df4d),
              100: const Color(0xfff5df4d),
              200: const Color(0xfff5df4d),
              300: const Color(0xfff5df4d),
              400: const Color(0xfff5df4d),
              500: const Color(0xfff5df4d),
              600: const Color(0xfff5df4d),
              700: const Color(0xfff5df4d),
              800: const Color(0xfff5df4d),
              900: const Color(0xfff5df4d),
            }),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: const Color(0xffffffff),
            textSelectionTheme:
                TextSelectionThemeData(cursorColor: const Color(0xfff5df4d))),
        home: MyMain());
  }
}

class MyMain extends StatefulWidget {
  MyMain({Key? key}) : super(key: key);

  @override
  _MyMainState createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int selectedIndex = 0;
  List pageItems = [Home(), Board(), Find(), Info()];

  List navIconsOff = [
    "icon_nav_home.svg",
    "icon_nav_board.svg",
    "icon_nav_find_facility.svg",
    "icon_nav_information.svg",
  ];

  List navIconsOn = [
    "icon_nav_home_on.svg",
    "icon_nav_board_on.svg",
    "icon_nav_find_facility_on.svg",
    "icon_nav_information_on.svg",
  ];

  List navLabel = ['홈', '커뮤니티', '시설찾기', '정보공유'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            items: [_buildItem(0), _buildItem(1), _buildItem(2), _buildItem(3)],
            onTap: (index) => setState(() {
                  selectedIndex = index;
                }),
            selectedItemColor: const Color(0xffe2bf00),
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0),
        body: Center(child: pageItems[selectedIndex]));
  }

  BottomNavigationBarItem _buildItem(int index) {
    return BottomNavigationBarItem(
        icon: _getNavIcon(index), label: navLabel[index]);
  }

  YrkIconButton _getNavIcon(int index) {
    return index == selectedIndex
        ? YrkIconButton(
            icon: navIconsOn[index],
            width: 24.0,
            height: 24.0,
            color: Color(0xffe2bf00),
          )
        : YrkIconButton(icon: navIconsOff[index], width: 24.0, height: 24.0);
  }
}
