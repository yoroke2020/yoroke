import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:helloflutter/views/components/YrkTextField.dart';
import 'package:helloflutter/views/components/YrkTextStyle.dart';
import 'package:helloflutter/views/components/YrkButton.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
                      style: YorokeTextStyle(
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
                      child: YorokeTextField(
                        label: '이메일',
                      ),
                    ),
                    SizedBox(height: 8),
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
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: new AspectRatio(
                aspectRatio: 360 / 48,
                child: Container(
                  child: YorokeBtn(
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
