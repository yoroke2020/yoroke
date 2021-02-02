import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:helloflutter/views/components/YrkTextField.dart';
import 'package:helloflutter/views/components/YrkTextStyle.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              child: new AspectRatio(
                aspectRatio: 360 / 48,
                child: Container(
                  child: Text("로그인",
                      style: YorokeTextStyle(
                        letterSpacing: -0.88 / 22,
                        height: 33 / 22,
                        fontWeight: FontWeight.bold, // diff
                        fontSize: 22.0,
                      ),
                      textAlign: TextAlign.left),
                ),
              ),
            ),
            Container(
              child: new AspectRatio(
                aspectRatio: 244 / 41,
                child: Text.rich(
                  TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text: '계속하시면 요양커뮤니티앱의 ',
                        style: YorokeTextStyle(),
                      ),
                      TextSpan(
                        text: '사용자약관',
                        style: YorokeTextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '과\n',
                        style: YorokeTextStyle(),
                      ),
                      TextSpan(
                        text: '개인정보약관',
                        style: YorokeTextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '에 동의하시는걸로 간주됩니다.',
                        style: YorokeTextStyle(),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              child: new AspectRatio(
                aspectRatio: 328 / 104,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: YorokeTextField(
                        label: '아이디',
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: YorokeTextField(
                        label: '비밀번호',
                        obscureText: true,
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
                              style: YorokeTextStyle(
                                color: const Color(0x99000000),
                                height: 20 / 14,
                                letterSpacing: -0.56 / 14,
                                fontWeight: FontWeight.w700, //diff
                              ),
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
                              style: YorokeTextStyle(
                                color: const Color(0x99000000),
                                height: 20 / 14,
                                letterSpacing: -0.56 / 14,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Expanded(
                          child: Text("비밀번호 찾기",
                              style: YorokeTextStyle(
                                color: const Color(0x99000000),
                                height: 20 / 14,
                                letterSpacing: -0.56 / 14,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
