import 'package:flutter/cupertino.dart';
import 'package:helloflutter/models/YrkData.dart';

class TestPage extends StatelessWidget {
  TestPage(this.data);

  final YrkData data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(data.data);
  }
}
