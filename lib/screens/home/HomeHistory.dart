import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';

class HomeHistory extends StatefulWidget {
  HomeHistory({Key? key, required this.data}) : super(key: key);

  YrkData? data;
  @override
  _HomeHistoryState createState() => _HomeHistoryState();
}

class _HomeHistoryState extends State<HomeHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: (ListView(children: <Widget>[])));
  }
}
