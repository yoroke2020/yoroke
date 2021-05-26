import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/mypage/BookmarkList.dart';
import 'package:yoroke/screens/mypage/EditProfile.dart';
import 'package:yoroke/screens/mypage/HistoryList.dart';
import 'package:yoroke/screens/mypage/SettingList.dart';

var textlist = [
  "프로필 편집",
  "북마크",
  "히스토리",
  "임시보관함",
];

var imagelist = [
  "icon_account_box.svg",
  "icon_save_black.svg",
  "icon_history.svg",
  "icon_inventory_2.svg",
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
                              icon: "account_circle_default.svg",
                              iconSize: 44,
                              padding: EdgeInsets.all(0),
                            ),
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
                                        iconSize: 22,
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
                          icon: "icon_settings.svg",
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
