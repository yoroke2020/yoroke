import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';

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
          ],
        ),
      ),
    );
  }
}
