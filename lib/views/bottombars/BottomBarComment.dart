import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/views/widgets/YrkTextField.dart';

class BottomBarComment extends StatefulWidget {
  static BottomBarComment _instance;

  BottomBarComment._internal();

  static BottomBarComment getInstance() {
    if (_instance == null) _instance = BottomBarComment._internal();
    return _instance;
  }

  @override
  _BottomBarCommentState createState() => _BottomBarCommentState();
}

class _BottomBarCommentState extends State<BottomBarComment> {
  bool isLocked = false;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);

    return BottomAppBar(
        child: Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            width: double.maxFinite,
            height: 56.0,
            decoration: BoxDecoration(color: const Color(0xfffffffff)),
            child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                              border: Border.all(
                                  color: const Color(0xff939597), width: 1),
                              color: const Color(0xffffffff)),
                          child: Center(
                              child: YrkTextField(
                            label: "댓글을 남겨보세요",
                          ))),
                    ),
                    Container(width: 8.0),
                    GestureDetector(
                        onTap: _onTap,
                        child: Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                                border: Border.all(
                                    color: const Color(0xfff5df4d), width: 1)),
                            child: Center(
                                child: Container(
                                    width: 24,
                                    height: 24,
                                    child: isLocked
                                        ? Image.asset(
                                            "assets/icons/icon_lock_24_px.png")
                                        : Image.asset(
                                            "assets/icons/icon_lock_open_24_px.png"))))),
                    Container(width: 8.0),
                    Container(
                        width: 72,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            color: const Color(0xfff5df4d)),
                        child: Center(
                            child: Text("등록",
                                style: const TextStyle(
                                    color: const Color(0xe6000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.center)))
                  ],
                ))));
  }

  void _onTap() {
    print("BottomComment - Lock Button Clicked");
    setState(() {
      isLocked = isLocked ? false : true;
    });
  }
}
