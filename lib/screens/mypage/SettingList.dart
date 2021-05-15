import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/mypage/NotiSetting.dart';
import 'package:yoroke/screens/mypage/Rule.dart';
import 'package:yoroke/screens/mypage/SignOut.dart';

class SettingList extends StatefulWidget {
  SettingList({Key? key, required this.onPushNavigator}) : super(key: key);

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _SettingListState createState() => _SettingListState();
}

class _SettingListState extends State<SettingList>
    with TickerProviderStateMixin {
  static final int tabLength = 3;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabLength);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackMidTitle,
        label: "설정",
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 400,
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (_, index) {
                  return const Divider(
                    color: Color(0xffe5e5e5),
                    thickness: 1,
                    height: 1,
                  );
                },
                itemBuilder: (context, index) {
                  var textlist = [
                    "로그인 정보",
                    "알림 설정",
                    "이용약관",
                    "개인정보처리방침",
                    "버전 정보",
                  ];

                  var traillist = [
                    YrkIconButton(
                      icon: 'assets/icons/icon_naver_logo.svg',
                    ),
                    YrkIconButton(
                      icon: 'assets/icons/icon_arrow_back_24_px.svg',
                    ),
                    YrkIconButton(
                      icon: 'assets/icons/icon_arrow_back_24_px.svg',
                    ),
                    YrkIconButton(
                      icon: 'assets/icons/icon_arrow_back_24_px.svg',
                    ),
                    Text("v.0.0.0")
                  ];

                  return ListTile(
                    title: Text(textlist[index]),
                    trailing: Container(
                        padding: EdgeInsets.zero, child: traillist[index]),
                    onTap: () {
                      if (index == 0 || index == 4)
                        return null;
                      else
                        index -= 1;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        var tablist = [
                          NotiSetting(onPushNavigator: widget.onPushNavigator),
                          Rule(type: 0),
                          Rule(type: 1),
                        ];
                        return tablist[index];
                      }));
                    },
                  );
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: YrkButton(
                    buttonType: ButtonType.text,
                    label: "회원탈퇴",
                    textStyle: YrkTextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0x4d000000)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignOut(onPushNavigator: widget.onPushNavigator);
                      }));
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: YrkButton(
                      buttonType: ButtonType.outline,
                      label: "로그아웃",
                      textStyle: YrkTextStyle(fontWeight: FontWeight.bold),
                      onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
