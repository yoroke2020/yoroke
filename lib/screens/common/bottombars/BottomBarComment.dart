import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    print(MediaQuery.of(context).size.height);

    return Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: BottomAppBar(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                width: double.maxFinite,
                height: 56.0,
                decoration: BoxDecoration(color: const Color(0xfffffffff)),
                child: Align(
                    alignment: Alignment.center,
                    child: YrkTextField(
                                label: "댓글을 남겨보세요",
                                textFieldType: TextFieldType.comment,
                              )),
                        ),));
  }

  void _onTapPrivate() {
    print("BottomComment - Private button clicked");
    setState(() {
      isPrivate = isPrivate ? false : true;
    });
  }
}
