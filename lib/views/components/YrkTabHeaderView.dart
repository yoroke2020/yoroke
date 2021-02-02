import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YrkTabHeaderView extends StatelessWidget {
  YrkTabHeaderView({this.titleName = ""});

  final String titleName;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        child: new AspectRatio(
            aspectRatio: 360 / 40,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(flex: 16, child: Container()),
                  Expanded(
                    flex: 304,
                    child: Text(titleName,
                        style: const TextStyle(
                            color: const Color(0xe6000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                  Expanded(
                    flex: 24,
                    child: Image.asset("assets/icons/navigate_next_24_px.png"),
                  ),
                  Expanded(flex: 16, child: Container())
                ])));
  }
}
