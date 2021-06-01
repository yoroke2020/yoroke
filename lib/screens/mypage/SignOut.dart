import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

var radiolist = [
  "필요한 정보가 없어요.",
  "서비스 운영이 마음에 들지 않아요.",
  "사용법이 어려워요.",
  "자주 쓰지 않아요.",
  "기타",
];

const double _radioSize = 38;

Container _textWrapper(Text text) {
  return Container(padding: EdgeInsets.symmetric(vertical: 8), child: text);
}

// ignore: must_be_immutable
class SignOut extends StatefulWidget {
  SignOut({Key? key}) : super(key: key);

  bool? mailNoti = false;
  bool? normalNoti = false;
  bool? marketingNoti = false;

  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  int groupValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackMidTitle,
        label: "회원탈퇴",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textWrapper(Text(
                  "탈퇴 이유를 알려주세요!",
                  style:
                      YrkTextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )),
                _textWrapper(Text(
                  "서비스가 개선될 수 있도록 소중한 의견 부탁드립니다.",
                  style: YrkTextStyle(fontWeight: FontWeight.w600),
                )),
                _textWrapper(Text(
                  "* 복수 선택 가능",
                  style: YrkTextStyle(color: Color(0x99000000), fontSize: 12),
                )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(
                    height: 1,
                    color: Color(0x1a000000),
                  ),
                ),
              ],
            ),
            Container(
              height: _radioSize * radiolist.length,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _YrkRadioButton(
                        title: radiolist[index],
                        index: index,
                        groupValue: groupValue,
                        onSelected: (index) => setState(() {
                              groupValue = index;
                            }));
                  }),
            ),
            Container(
              height: 32 * 6,
              padding: EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff939597), width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff939597), width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  hintText: "기타 이유를 입력해주세요. (선택사항)",
                ),
              ),
            ),
            YrkButton(
              buttonType: ButtonType.solid,
              label: "다음",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignOutNext();
                }));
              },
              clickable: false,
            ),
          ],
        ),
      ),
    );
  }
}

class SignOutNext extends StatefulWidget {
  SignOutNext({Key? key}) : super(key: key);

  @override
  _SignOutNextState createState() => _SignOutNextState();
}

class _SignOutNextState extends State<SignOutNext> {
  int check = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackMidTitle,
        label: "회원탈퇴",
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textWrapper(Text(
                  "주의사항 ",
                  style:
                      YrkTextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )),
                _textWrapper(Text(
                  "회원탈퇴 전 반드시 확인해주세요.",
                  style: YrkTextStyle(
                      fontWeight: FontWeight.w600, color: Color(0xffea0606)),
                )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(
                    height: 1,
                    color: Color(0x1a000000),
                  ),
                ),
                _textWrapper(Text(
                  "회원탈퇴 시 계정 정보는 복구가 불가하며 1일 이후 재가입 가능합니다.",
                )),
                _textWrapper(Text(
                  "등록된 후기나 게시물은 자동으로 삭제되지 않습니다. 탈퇴 전 개별적으로 삭제하시기 바랍니다.",
                )),
              ],
            ),
            Spacer(),
            _YrkRadioButton(
                align: MainAxisAlignment.center,
                title: "주의사항에 모두 동의합니다.",
                index: 1,
                groupValue: check,
                onSelected: (input) {
                  setState(() {
                    check = input;
                  });
                }),
            YrkButton(
              buttonType: ButtonType.solid,
              label: "다음",
              onPressed: () {},
              clickable: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _YrkRadioButton extends StatelessWidget {
  _YrkRadioButton({
    required this.title,
    required this.index,
    required this.groupValue,
    required this.onSelected,
    this.align = MainAxisAlignment.start,
  });

  final String title;
  final int index;
  final int groupValue;
  final ValueChanged<int> onSelected;
  final MainAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: _radioSize,
      child: Row(
        mainAxisAlignment: align,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Radio(
              value: index,
              groupValue: groupValue,
              activeColor: const Color(0xfff5df4d),
              onChanged: (int? value) => onSelected(index)),
          Text(
            title,
            textAlign: TextAlign.left,
            style: YrkTextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
