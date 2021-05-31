import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/mypage/BookmarkList.dart';
import 'package:yoroke/screens/mypage/EditProfile.dart';
import 'package:yoroke/screens/mypage/HistoryList.dart';
import 'package:yoroke/screens/mypage/SettingList.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/screens/mypage/TempPostList.dart';

import '../../main.dart';

class YrkDrawer extends StatefulWidget {
  YrkDrawer({
    Key? key,
    this.onPushNavigator,
  });

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _YrkDrawerState createState() => _YrkDrawerState();
}

class _YrkDrawerState extends State<YrkDrawer> {
  late List<Tuple3<String, String, Widget>> _myPageOptions;
  late Tuple3<String, String, Widget> _myPageSettings;

  @override
  void initState() {
    super.initState();

    _myPageOptions = [
      Tuple3("프로필 편집", "icon_account_box.svg", EditProfile()),
      Tuple3("북마크", "icon_save_black.svg",
          BookmarkList(onPushNavigator: widget.onPushNavigator)),
      Tuple3("히스토리", "icon_history.svg",
          HistoryList(onPushNavigator: widget.onPushNavigator)),
      Tuple3("임시보관함", "icon_inventory_2.svg",
          TempPostList()),
    ];
    _myPageSettings = Tuple3("설정", "icon_settings.svg",
        SettingList(onPushNavigator: widget.onPushNavigator));
    profileController.addListener(() {
      if (profileController.isChanging) setState(() {});
    });
  }

  @override
  void dispose() {
    profileController.removeListener(() {
      if (profileController.isChanging) setState(() {});
    });
    super.dispose();
  }

  get myProfile {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }

  Widget get myPageOptions {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < _myPageOptions.length; i++) {
      list.add(myPageOption(_myPageOptions[i], i != _myPageOptions.length - 1));
    }
    return Wrap(children: list);
  }

  Widget myPageOption(Tuple3 option, bool isBorder) {
    return GestureDetector(
        child: Container(
            height: 49.0,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1,
                        color: isBorder
                            ? const Color(0xffe5e5e5)
                            : const Color(0xffffffff)))),
            child: Row(children: [
              YrkIconButton(
                icon: option.item2,
                iconSize: 24.0,
              ),
              Container(
                  height: 49.0,
                  padding: EdgeInsets.only(left: 8.0),
                  alignment: Alignment.centerLeft,
                  child: Text(option.item1,
                      style: YrkTextStyle(fontSize: 16, height: 1)))
            ])),
        onTap: () => _onTapMyPageListItem(context, option.item3));
  }

  void _onTapMyPageListItem(BuildContext context, Widget page) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));

    if (result != null) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("build completed");
    return Drawer(
        child: Column(children: [
      Container(height: MediaQuery.of(context).padding.top),
      GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              height: 48.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset("assets/icons/icon_clear.svg",
                  width: 24.0, height: 24.0))),
      CircleAvatar(
        radius: 22.0,
        backgroundImage: profileController.accountImage,
        backgroundColor: const Color(0xffffffff),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 24.0),
        child: Text(profileController.accountNickname,
            style: YrkTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
      myPageOptions,
      Spacer(),
      Padding(
          padding: EdgeInsets.only(bottom: 11.0),
          child: myPageOption(_myPageSettings, false))
    ]));
  }
}
