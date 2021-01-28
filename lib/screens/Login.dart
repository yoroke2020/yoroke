import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  InputDecoration textFieldInputDecotation(String label) {
    return InputDecoration(
        filled: true,
        fillColor: const Color(0xfff0f0f0), // zepp diff
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(36),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(36),
          ),
        ),
        labelStyle: TextStyle(
            color: Color(0x4d000000),
            fontSize: 16,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            letterSpacing: -0.56),
        labelText: label);
  }

  TextStyle textStyleRegular() {
    return TextStyle(
        color: const Color(0x99000000),
        fontWeight: FontWeight.w400,
        fontFamily: "NotoSansCJKkr-Medium",
        fontStyle: FontStyle.normal,
        fontSize: 14.0);
  }

  TextStyle textStyleBold() {
    return TextStyle(
        color: const Color(0x99000000),
        fontWeight: FontWeight.bold,
        fontFamily: "NotoSansCJKkr-Medium",
        fontStyle: FontStyle.normal,
        fontSize: 14.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        Container(
          child: new AspectRatio(
            aspectRatio: 360 / 100,
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
            aspectRatio: 360 / 50,
            child: Text.rich(
              TextSpan(
                text: '',
                children: <TextSpan>[
                  TextSpan(
                    text: '계속하시면 요양커뮤니티앱의 ',
                    style: textStyleRegular(),
                  ),
                  TextSpan(
                    text: '사용자약관',
                    style: textStyleBold(),
                  ),
                  TextSpan(
                    text: '과\n',
                    style: textStyleRegular(),
                  ),
                  TextSpan(
                    text: '개인정보약관',
                    style: textStyleBold(),
                  ),
                  TextSpan(
                    text: '에 동의하시는걸로 간주됩니다.',
                    style: textStyleRegular(),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          child: new AspectRatio(
            aspectRatio: 360 / 130,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: textFieldInputDecotation('아이디'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    obscureText: true,
                    decoration: textFieldInputDecotation('비밀번호'),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text("회원가입",
                          style: textStyleRegular(),
                          textAlign: TextAlign.center),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("아이디 찾기",
                          style: textStyleRegular(),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text("비밀번호 찾기",
                          style: textStyleRegular(),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
