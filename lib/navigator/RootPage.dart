import 'package:flutter/cupertino.dart';
import 'package:helloflutter/screens/Board.dart';
import 'package:helloflutter/screens/Find.dart';
import 'package:helloflutter/screens/Home.dart';
import 'package:helloflutter/screens/Info.dart';

class RootPage extends StatelessWidget {
  RootPage({this.currentIndex, this.onPush});

  final int currentIndex;
  final ValueChanged<int> onPush;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [Home(), Board(onPush: onPush), Find(), Info()];

    return children[currentIndex];
  }

}