import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

var textlist = [
  "로그인 정보",
  "알림 설정",
  "이용약관",
  "개인정보처리방침",
  "버전 정보",
];

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 500,
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
                  return ListTile(
                    title: Text(textlist[index]),
                    // TODO: trailing
                    // trailing: Container(
                    //     padding: EdgeInsets.zero,
                    //     child: YrkIconButton(
                    //       icon: imagelist[index],
                    //       width: 22,
                    //       height: 22,
                    //       onTap: () {},
                    //     )),
                  );
                },
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  child: YrkButton(
                    buttonType: ButtonType.text,
                    label: "회원탈퇴",
                    onPressed: () {},
                  ),
                ),
                YrkButton(
                    buttonType: ButtonType.outline,
                    label: "로그아웃",
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
