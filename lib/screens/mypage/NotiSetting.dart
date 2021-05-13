import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

var textlist = [
  "기기 알림",
  "메일 수신동의",
  "일반 알림",
  "마케팅 알림",
];

var subtextlist = [
  "요로케에서 보내는 알림을 받을 수 있어요. 변경은 ‘설정 앱 > 알림 > 요로케’에서 변경할 수 있어요.",
  "새로운 시설 정보와 국가 정책등 다양한 정보를 받아볼 수 있어요.",
  "공지사항, 소셜 관련 알림을 받아볼 수 있어요.",
  "시설 할인 혜택, 이벤트 등의 정보를 받을 수 있어요."
];

// ignore: must_be_immutable
class NotiSetting extends StatefulWidget {
  NotiSetting({Key? key, required this.onPushNavigator}) : super(key: key);

  final ValueChanged<YrkData>? onPushNavigator;

  bool? mailNoti = false;
  bool? normalNoti = false;
  bool? marketingNoti = false;

  @override
  _NotiSettingState createState() => _NotiSettingState();
}

class _NotiSettingState extends State<NotiSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackMidTitle,
        label: "알림설정",
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: textlist.length,
                itemBuilder: (context, index) {
                  var traillist = [
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.mailNoti! |
                                    widget.normalNoti! |
                                    widget.marketingNoti!
                                ? 'ON'
                                : 'OFF',
                            style: YrkTextStyle(fontFamily: 'OpenSans'),
                          ),
                          YrkIconButton(
                            icon: 'assets/icons/icon_arrow_back_24_px.svg',
                          ),
                        ],
                      ),
                    ),
                    Switch(
                        value: widget.mailNoti!,
                        onChanged: (_noti) {
                          setState(() {
                            widget.mailNoti = _noti;
                          });
                        }),
                    Switch(
                        value: widget.normalNoti!,
                        onChanged: (_noti) {
                          setState(() {
                            widget.normalNoti = _noti;
                          });
                        }),
                    Switch(
                        value: widget.marketingNoti!,
                        onChanged: (_noti) {
                          setState(() {
                            widget.marketingNoti = _noti;
                          });
                        }),
                  ];

                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(textlist[index]),
                        Container(
                            padding: EdgeInsets.zero, child: traillist[index]),
                      ],
                    ),
                    subtitle: Container(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Text(subtextlist[index])),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
