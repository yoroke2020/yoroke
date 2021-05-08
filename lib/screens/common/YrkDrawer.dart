import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/mypage/BookmarkList.dart';
import 'package:yoroke/screens/mypage/EditProfile.dart';
import 'package:yoroke/screens/mypage/HistoryList.dart';
import 'package:yoroke/screens/mypage/SettingList.dart';

var tiles = [
  {"text": "프로필 편집", "icon": "assets/icons/icon_naver.png"},
  {"text": "북마크", "icon": "assets/icons/icon_kakao.png"},
  {"text": "히스토리", "icon": "assets/icons/icon_apple.png"},
  {"text": "임시보관함", "icon": "assets/icons/icon_apple.png"},
];

var textlist = [
  "프로필 편집",
  "북마크",
  "히스토리",
  "임시보관함",
];

var imagelist = [
  "assets/icons/icon_account_box_24_px.svg",
  "assets/icons/icon_save_black_24_px.svg",
  "assets/icons/icon_history_24_px.svg",
  "assets/icons/icon_inventory_2_24_px.svg",
];

class YrkDrawer extends Drawer {
  final ValueChanged<YrkData>? onPushNavigator;
  YrkDrawer({
    Key? key,
    required this.onPushNavigator,
    required BuildContext context,
  }) : super(
            key: key,
            child: Container(
              // height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      DrawerHeader(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            YrkIconButton(
                                icon:
                                    "assets/icons/account_circle_default_36_px.svg",
                                width: 44,
                                height: 44,
                                padding: EdgeInsets.all(0),
                                onTap: () {}),
                            Text("비회원",
                                style: YrkTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      Container(
                          height: 200,
                          child: ListView.separated(
                              itemCount: textlist.length,
                              separatorBuilder: (_, index) {
                                return const Divider(
                                  color: Color(0xffe5e5e5),
                                  thickness: 1,
                                  indent: 60,
                                  height: 1,
                                );
                              },
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Container(
                                      padding: EdgeInsets.zero,
                                      child: YrkIconButton(
                                        icon: imagelist[index],
                                        width: 22,
                                        height: 22,
                                        onTap: () {},
                                      )),
                                  title: Container(
                                      padding: EdgeInsets.zero,
                                      child: Text(
                                        textlist[index],
                                        style: YrkTextStyle(
                                            fontSize: 16, height: 1),
                                        textAlign: TextAlign.left,
                                      )),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      var tablist = [
                                        EditProfile(),
                                        BookmarkList(
                                            onPushNavigator: onPushNavigator),
                                        HistoryList(
                                            onPushNavigator: onPushNavigator),
                                        SettingList(
                                            onPushNavigator: onPushNavigator),
                                      ];
                                      return tablist[index];
                                    }));
                                  },
                                );
                              })),
                    ],
                  ),
                  ListTile(
                    leading: Container(
                        padding: EdgeInsets.zero,
                        child: YrkIconButton(
                          icon: "assets/icons/icon_settings_24_px.svg",
                          width: 22,
                          height: 22,
                          onTap: () {},
                        )),
                    title: Container(
                        padding: EdgeInsets.zero,
                        child: Text(
                          "설정",
                          style: YrkTextStyle(fontSize: 16, height: 1),
                          textAlign: TextAlign.left,
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingList(
                                  onPushNavigator: onPushNavigator)));
                    },
                  ),
                ],
              ),
            )
            //
            );
}
