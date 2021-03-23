import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/views/widgets/YrkButton.dart';
import 'package:yoroke/views/widgets/YrkTextField.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

Widget wrapElement(Widget child) {
  return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: AspectRatio(
          aspectRatio: 360 / 48,
          child: Center(
            child: child,
          )));
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: null,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              // Todo: logo
              padding: const EdgeInsets.all(80),
              child: Image.asset('assets/icons/icon_naver.png'),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  wrapElement(Text("로그인 및 회원가입")),
                  wrapElement(YrkButton(
                    type: ButtonType.image,
                    label: "네이버로 계속하기",
                    img: "assets/icons/icon_naver.png",
                    onPress: () {},
                  )),
                  wrapElement(YrkButton(
                    type: ButtonType.image,
                    label: "카카오톡으로 계속하기",
                    img: "assets/icons/icon_kakao.png",
                    onPress: () {},
                  )),
                  wrapElement(YrkButton(
                    type: ButtonType.image,
                    label: "Apple로 계속하기",
                    img: "assets/icons/icon_apple.png",
                    onPress: () {},
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
