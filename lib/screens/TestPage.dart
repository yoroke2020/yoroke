import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';

import 'common/YrkButton.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

var btns = {
  {"text": "image", "icon": "assets/icons/icon_naver_logo.svg"},
};

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
            YrkTextField(
              label: 'Solid, default',
            ),
            SizedBox(height: 8),
            YrkTextField(
              label: 'Search',
              textFieldType: TextFieldType.search,
            ),
            SizedBox(height: 8),
            YrkTextField(
              label: 'Rect',
              textFieldType: TextFieldType.rect,
            ),
            SizedBox(height: 8),
            YrkTextField(
              label: 'comment',
              textFieldType: TextFieldType.comment,
            ),
            SizedBox(height: 8),
            YrkTextField(
              label: 'board(writing)',
              textFieldType: TextFieldType.board,
            ),
            YrkButton(
              buttonType: ButtonType.solid,
              label: 'solid',
              onPressed: () {},
            ),
            YrkButton(
              buttonType: ButtonType.rect,
              label: 'rect',
              onPressed: () {},
            ),
            YrkButton(
              buttonType: ButtonType.outline,
              label: 'outline',
              onPressed: () {},
            ),
            YrkButton(
              buttonType: ButtonType.chip,
              label: 'chip',
              onPressed: () {},
            ),
            YrkButton(
              buttonType: ButtonType.outlinechip,
              label: 'outlinechip',
              onPressed: () {},
            ),
            YrkButton(
              buttonType: ButtonType.text,
              label: 'text',
              onPressed: () {},
            ),
            Column(
                children: btns.map((e) {
              return Container(
                child: YrkButton(
                  buttonType: ButtonType.image,
                  width: 328,
                  height: 48,
                  label: e['text'],
                  image: e['icon'],
                  onPressed: () {},
                ),
              );
            }).toList())
          ],
        ),
      ),
    );
  }
}
