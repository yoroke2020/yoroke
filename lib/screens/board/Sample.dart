import 'package:flutter/cupertino.dart';
import 'package:helloflutter/tools/Data.dart';

class Sample extends StatelessWidget {
  Sample(this.data);

  final Data data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(data.data);
  }
}
