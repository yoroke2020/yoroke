import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

class Find extends StatefulWidget {
  Find({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('find page'),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              widget.onPushNavigator!(new YrkData(nextPageItem: SubPageItem.testPage)),
        ),
        appBar: YrkAppBar(
            // onPushNavigator: widget.onPushNavigator,
            ),
        drawer: YrkDrawer(
          onPushNavigator: widget.onPushNavigator,
          context: context,
        ));
  }
}
