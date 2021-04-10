import 'package:flutter/cupertino.dart';
import 'package:yoroke/models/YrkData.dart';

class TestPage extends StatelessWidget {
  TestPage(this.data);

  final YrkData data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(data.str0!);
  }
}
