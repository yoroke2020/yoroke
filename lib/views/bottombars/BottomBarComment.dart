import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/views/widgets/YrkTextField.dart';

class BottomBarComment extends StatefulWidget {
  @override
  _BottomBarCommentState createState() => _BottomBarCommentState();
}

class _BottomBarCommentState extends State<BottomBarComment> {
  bool isPrivate = false;
  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);

    return Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: BottomAppBar(
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
                              child: YrkTextField(
                            label: "댓글을 남겨보세요",
                          )),
                        ),
                        Container(width: 8.0),
                        InkWell(
                            onTap: _onTapPrivate,
                            child: Container(
                                width: 48,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)),
                                    border: Border.all(
                                        color: const Color(0x4d000000),
                                        width: 1)),
                                child: Center(
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        child: isPrivate
                                            ? Image.asset(
                                                "assets/icons/icon_lock_24_px.png")
                                            : Image.asset(
                                                "assets/icons/icon_lock_open_24_px.png"))))),
                        Container(width: 8.0),
                        Container(
                            width: 72,
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                                border:
                                    Border.all(color: const Color(0x4d000000))),
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
                    )))));
  }

  void _onTapPrivate() {
    print("BottomComment - Private button clicked");
    setState(() {
      isPrivate = isPrivate ? false : true;
    });
  }
}
