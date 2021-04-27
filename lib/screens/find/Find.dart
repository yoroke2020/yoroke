import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/appbars/AppBarNormal.dart';

class Find extends StatefulWidget {
  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarNormal(
            // onPushNavigator: widget.onPushNavigator,
            ),
        drawer: YrkDrawer());
  }
}
