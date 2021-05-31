import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

var textlist = [
  "이용약관",
  "개인정보처리방침",
];

String getContent(int type) {
  String ret = '';
  for (var i = 0; i < 1000; i++) {
    ret += textlist[type];
  }
  return ret;
}

// ignore: must_be_immutable
class Rule extends StatefulWidget {
  Rule({Key? key, required this.type}) : super(key: key);
  final int type;

  @override
  _RuleState createState() => _RuleState();
}

class _RuleState extends State<Rule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackMidTitle,
        label: textlist[widget.type],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text(getContent(widget.type)),
      ),
    );
  }
}
