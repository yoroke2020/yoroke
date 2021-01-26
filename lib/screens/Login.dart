import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      // padding: const EdgeInset.only(top: 8, bottom 8),
      children: <Widget>[
        Container(
          child: new AspectRatio(
            aspectRatio: 360 / 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(flex: 16, child: Container()),
                Expanded(
                  flex: 304,
                  child: Text("로그인",
                      style: const TextStyle(
                          color: const Color(0xe6000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 22.0),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: new AspectRatio(
            aspectRatio: 360 / 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(flex: 16, child: Container()),
                Expanded(
                  flex: 304,
                  child: Text("계속하시면 요양커뮤니티앱의 사용자약관과\n개인정보약관에 동의하시는 걸로 간주됩니다.",
                      style: const TextStyle(
                          color: const Color(0xe6000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
