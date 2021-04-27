import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../YrkButton.dart';
import '../YrkTextField.dart';

class BottomBarComment extends StatefulWidget {
  @override
  _BottomBarCommentState createState() => _BottomBarCommentState();
}

class _BottomBarCommentState extends State<BottomBarComment> {
  bool isPrivate = false;
  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery
        .of(context)
        .size
        .height);

    return Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery
            .of(context)
            .viewInsets
            .bottom),
        child: BottomAppBar(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            width: double.maxFinite,
            height: 56.0,
            decoration: BoxDecoration(color: const Color(0xfffffffff)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Expanded(
            child: YrkTextField(
              label: "댓글을 남겨보세요",
              textFieldType: TextFieldType.comment,
            ),
          ),
          InkWell(
            onTap: () =>
                setState(() {
                  isPrivate = isPrivate ? false : true;
                }),
            child: Container(
            width: 32.0,
            height: 32.0,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.all(Radius.circular(32)),
                border: Border.all(
                  color: const Color(0x4d000000),
                  width: 1,
                )),
            child: Center(
              child: isPrivate
                  ? Image.asset("assets/icons/icon_lock_24_px.png",
                  color: const Color(0x4d000000),
                  width: 20.0,
                  height: 20.0)
                  : Image.asset("assets/icons/icon_lock_open_24_px.png",
                  color: const Color(0x4d000000),
                  width: 20.0,
                  height: 20.0),
            ),
          ),
        ),
        YrkButton(
          buttonType: ButtonType.outlinechip,
          label: '등록',
          btnColor: const Color(0x4d000000),
          fontColor: const Color(0x4d000000),
          onPressed: () => print("register button clicked"),
          width: 64,
          height: 32,
        ),
        ]),)
    ,
    )
    );
  }
}
