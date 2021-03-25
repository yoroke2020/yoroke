import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LogIn/Nickname.dart';

import 'package:yoroke/views/widgets/YrkButton.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

var btns = {
  {"text": "네이버로 계속하기", "icon": "assets/icons/icon_naver.png"},
  {"text": "카카오로 계속하기", "icon": "assets/icons/icon_kakao.png"},
  {"text": "Apple로 계속하기", "icon": "assets/icons/icon_apple.png"},
};

Widget wrapElement(Widget _child) {
  return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: AspectRatio(
        aspectRatio: 360 / 48,
        child: Center(child: _child),
      ));
}

class _LogInState extends State<LogIn> {
  final loginPageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
              new IconButton(icon: new Icon(Icons.arrow_back), onPressed: null
                  // () {
                  //   // Navigator.pop(context);
                  // },
                  ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(children: <Widget>[
              Container(
                // Todo: logo
                padding: const EdgeInsets.all(80),
                child: Image.asset('assets/icons/icon_naver.png'),
              ),
              Spacer(),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: Column(children: <Widget>[
                    wrapElement(Text("로그인 및 회원가입")),
                    Column(
                        children: btns
                            .map((e) => wrapElement(YrkButton(
                                  type: ButtonType.image,
                                  label: e['text'],
                                  img: e['icon'],
                                  onPress: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Nickname()),
                                    );
                                  },
                                )))
                            .toList())
                  ]))
            ])));
  }
}
