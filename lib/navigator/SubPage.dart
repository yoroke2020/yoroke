import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';

import 'PageItem.dart';

class SubPage extends StatelessWidget {
  SubPage({this.rootIndex, this.data, this.onPushNavigator});

  final int? rootIndex;
  final YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  Widget build(BuildContext context) {
    return Container();
    // return data!.nextPageItem!.widget(data, onPushNavigator);
  }
}
