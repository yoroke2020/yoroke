import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/controllers/ProfileController.dart';
import 'package:yoroke/screens/board/Board.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/find/Find.dart';
import 'package:yoroke/screens/home/Home.dart';
import 'package:yoroke/screens/info/Info.dart';
import 'package:yoroke/screens/notice/Notice.dart';
import 'package:yoroke/screens/search/Search.dart';

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

  final List<String> navIconsOff = [
    "icon_nav_home.svg",
    "icon_nav_board.svg",
    "icon_nav_find_facility.svg",
    "icon_nav_information.svg",
  ];

  final List<String> navIconsOn = [
    "icon_nav_home_on.svg",
    "icon_nav_board_on.svg",
    "icon_nav_find_facility_on.svg",
    "icon_nav_information_on.svg",
  ];

  final List<String> navLabels = ['홈', '커뮤니티', '시설찾기', '정보공유'];

  final List<Widget> mainPages = [Home(), Board(), Find(), Info()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xffffffff),
            titleSpacing: 16.0,
            automaticallyImplyLeading: false,
            title: Text(navLabels[selectedIndex],
                  style: const YrkTextStyle(fontWeight: FontWeight.w700)),
            actions: [
              YrkIconButton(
                  icon: "icon_search.svg",
                  onTap: () =>
                      WidgetsBinding.instance!.addPostFrameCallback((_) async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(data: null)));
                      })),
              YrkIconButton(
                  icon: "icon_notifications_none.svg",
                  onTap: () =>
                      WidgetsBinding.instance!.addPostFrameCallback((_) async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notice(data: null)));
                      })),
              SizedBox(
                width: 12.0,
              )
            ]),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: _getNavIcon(0), label: navLabels[0]),
              BottomNavigationBarItem(
                  icon: _getNavIcon(1), label: navLabels[1]),
              BottomNavigationBarItem(
                  icon: _getNavIcon(2), label: navLabels[2]),
              BottomNavigationBarItem(
                  icon: _getNavIcon(3), label: navLabels[3]),
            ],
            onTap: (index) => setState(() {
                  selectedIndex = index;
                }),
            selectedItemColor: const Color(0xffe2bf00),
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0),
        body: Center(child: mainPages[selectedIndex]));
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
