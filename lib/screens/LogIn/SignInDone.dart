import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/views/widgets/YrkTextStyle.dart';

class SignInDone extends StatefulWidget {
  @override
  _SignInDoneState createState() => _SignInDoneState();
}

class _SignInDoneState extends State<SignInDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xfff5df4d),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "가입 완료!",
            style: YrkTextStyle(
              color: Color(0xffffffff),
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            "OOO님,\n환영합니다!",
            style: YrkTextStyle(
                color: Color(0xffffffff),
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                height: 1.28),
          ),
        ],
      ),
    ));
  }
}
