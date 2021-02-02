import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/Cho/Documents/GitHub/yoroke2020/yoroke/lib/models/YrkData.dart';

class Sample extends StatelessWidget {
  Sample(this.data);

  final YrkData data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(data.data);
  }
}
