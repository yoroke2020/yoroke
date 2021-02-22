import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';

class Post extends StatefulWidget {
  Post({Key key, @required this.data}) : super(key: key);

  final YrkData data;

  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            width: double.maxFinite,
            height: 32.0,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("요양병원 후기",
                    style: const TextStyle(
                        color: const Color(0x99000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left))),
        Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            width: double.maxFinite,
            height: 32.0,
            child: Row(
              children: [
                Visibility(
                    visible: true,
                    child: Container(
                        margin: EdgeInsets.only(right: 5.0),
                        width: 27.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            border: Border.all(
                                color: const Color(0xfff5df4d), width: 1),
                            color: const Color(0xfff5df4d)),
                        child: Center(
                            child: Text("BEST",
                                style: const TextStyle(
                                    color: const Color(0xe6000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 8.0),
                                textAlign: TextAlign.left)))),
                Text("조문기의 요양병원",
                    style: const TextStyle(
                        color: const Color(0xe6000000),
                        fontWeight: FontWeight.w700,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left)
              ],
            )),
        Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            width: double.maxFinite,
            height: 65.0,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: const Color(0x14000000))),
            ),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 5.0, top: 16, bottom: 16),
                    width: 32,
                    height: 32,
                    child: Center(
                      child: Image.asset(
                          "assets/icons/account_circle_default_24_px.png"),
                    )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 12.0),
                        height: 20.0,
                        child: Center(
                          child: Text("유저에용",
                              style: const TextStyle(
                                  color: const Color(0x4d000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left),
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 12),
                        height: 20.0,
                        child: Center(
                          child: Text("20.10.22",
                              style: const TextStyle(
                                  color: const Color(0x4d000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left),
                        )),
                  ],
                ))
              ],
            )),
        Container(
            margin: EdgeInsets.all(16),
            width: double.maxFinite,
            child: Text(_sampleText("요양병원 후기 "),
                style: const TextStyle(
                    color: const Color(0xe6000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    height: 1.5,
                    fontSize: 16.0),
                textAlign: TextAlign.left))
      ],
    );
  }

  String _sampleText(String s) {
    String str = widget.data.str0 + "\n";
    for (int i = 0; i < 1000; i++) {
      str += s;
    }
    return str;
  }
}
