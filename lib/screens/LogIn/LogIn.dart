import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/LogIn/SiginInDialog.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

var btns = {
  {"text": "네이버로 계속하기", "icon": "assets/icons/icon_naver_logo.svg"},
  {"text": "카카오로 계속하기", "icon": "assets/icons/icon_kakao_logo.svg"},
  {"text": "Apple로 계속하기", "icon": "assets/icons/icon_apple_logo.svg"},
};

class _LogInState extends State<LogIn> {
  final loginPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YrkAppBar(
          type: YrkAppBarType.arrowBackOnly,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // Todo: logo
                    // padding: const EdgeInsets.all(80),
                    child:
                        YrkIconButton(icon: 'assets/icons/icon_naver_logo.svg'),
                  ),
                  Spacer(),
                  Container(
                      //width: double.infinity,
                      // padding: const EdgeInsets.all(8),
                      child: Column(children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child: Text("로그인 및 회원가입")),
                    Column(
                        children: btns.map((e) {
                      return Container(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: YrkButton(
                              buttonType: ButtonType.image,
                              width: 328,
                              height: 48,
                              label: e['text'],
                              image: e['icon'],
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInDialog()),
                                );
                              }));
                    }).toList())
                  ]))
                ])));
  }
}
