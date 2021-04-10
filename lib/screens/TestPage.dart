import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoroke/views/widgets/YrkTextField.dart';
import 'package:yoroke/views/widgets/YrkTextStyle.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String data = "";

  final _emailController = TextEditingController();

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
          children: [
            YrkTextField(
              // width: 300,
              // height: 200,
              // o
              label: '이메일',
              errorText: '이미 사용중인 메일입니다.',
              // data: data,
            ),
            Text(data),
          ],
        ),
      ),
    );
  }
}
