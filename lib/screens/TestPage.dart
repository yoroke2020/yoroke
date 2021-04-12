import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/views/widgets/YrkTextField.dart';
import 'package:yoroke/views/widgets/YrkTextStyle.dart';
import 'package:yoroke/views/widgets/YrkButton.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        label: 'Solid, default',
                        // errorText: 'h',
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: YrkTextField(
                        label: 'Search',
                        textFieldType: TextFieldType.search,
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: YrkTextField(
                        label: 'Rect',
                        obscureText: true,
                        textFieldType: TextFieldType.rect,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
