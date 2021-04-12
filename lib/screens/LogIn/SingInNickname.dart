import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/LogIn/SignInDone.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class SignInNickname extends StatefulWidget {
  @override
  _SignInNicknameState createState() => _SignInNicknameState();
}

class _SignInNicknameState extends State<SignInNickname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Container(
                width: 360,
                height: 96,
                margin: EdgeInsets.only(bottom: 24),
                child: Text(
                  "커뮤니티에서 사용하실\n닉네임을 설정해 주세요.",
                  style: YrkTextStyle(
                    color: Color(0xe6000000),
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              child: YrkTextField(
                label: '닉네임입력',
                width: 328,
                height: 48,
              ),
              margin: EdgeInsets.only(bottom: 24),
            ),
            Container(
              width: 328,
              height: 48,
              child: YrkButton(
                buttonType: ButtonType.solid,
                label: "다음",
                clickable: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInDone()),
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
