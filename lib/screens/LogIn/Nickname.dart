import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/views/widgets/YrkTextField.dart';
import 'package:yoroke/views/widgets/YrkTextStyle.dart';
import 'package:yoroke/views/widgets/YrkButton.dart';

class Nickname extends StatefulWidget {
  @override
  _NicknameState createState() => _NicknameState();
}

class _NicknameState extends State<Nickname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: null,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Container(
              child: new AspectRatio(
                aspectRatio: 360 / 48,
                child: Container(
                  child: Text("커뮤니티에서 사용할 닉네임을 지어주세요",
                      style: YrkTextStyle(
                        color: Color(0xe6000000),
                        fontSize: 22.0,
                      ),
                      textAlign: TextAlign.left),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 360 / 120,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: YrkTextField(label: '닉네임입력'),
                  ),
                  Spacer(),
                  Expanded(
                    child: YrkButton(
                      type: ButtonType.solid,
                      label: "다음",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
