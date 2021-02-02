import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/views/widgets/YrkTextField.dart';
import 'package:yoroke/views/widgets/YrkTextStyle.dart';
import 'package:yoroke/views/widgets/YrkButton.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  child: Text("회원가입",
                      style: YrkTextStyle(
                        color: Color(0xe6000000),
                        fontSize: 22.0,
                      ),
                      textAlign: TextAlign.left),
                ),
              ),
            ),
            Container(
              child: new AspectRatio(
                aspectRatio: 328 / 160,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: YrkTextField(
                        label: '이메일',
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: YrkTextField(
                        label: '아이디',
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: YrkTextField(
                        label: '비밀번호',
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: new AspectRatio(
                aspectRatio: 360 / 48,
                child: Container(
                  child: YrkButton(
                    label: "네이버",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
