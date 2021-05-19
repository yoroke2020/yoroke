import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

import '../YrkButton.dart';
import '../YrkTextField.dart';

class BottomBarComment extends StatefulWidget {
  BottomBarComment(
      {required this.focusNode,
      required this.controller,
      required this.onTapRegister});

  final FocusNode focusNode;
  final TextEditingController controller;
  final ValueChanged<String> onTapRegister;

  @override
  _BottomBarCommentState createState() => _BottomBarCommentState();
}

class _BottomBarCommentState extends State<BottomBarComment> {
  bool isPrivate = false;
  bool isClickable = false;
  late String initCommentText;

  @override
  void initState() {
    super.initState();
    initCommentText = widget.controller.text;
    widget.controller.addListener(() {
      setState(() {
        _onTextChanged();
      });
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {
      _onTextChanged();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
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
                      focusNode: widget.focusNode,
                      controller: widget.controller,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
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
                            width: 1.0,
                          )),
                      child: Center(
                        child: isPrivate
                            ? YrkIconButton(
                                icon: "assets/icons/icon_lock_24_px.svg",
                                color: const Color(0x4d000000),
                                iconSize: 20.0)
                            : YrkIconButton(
                                icon: "assets/icons/icon_lock_open_24_px.svg",
                                color: const Color(0x4d000000),
                                iconSize: 20.0),
                      ),
                    ),
                  ),
                  YrkButton(
                    buttonType: ButtonType.outlinechip,
                    label: '등록',
                    fillColor: isClickable
                        ? const Color(0xfff5df4d)
                        : const Color(0xffffffff),
                    borderColor: isClickable
                        ? const Color(0xfff5df4d)
                        : const Color(0x4d000000),
                    borderWidth: 1.0,
                    textStyle: YrkTextStyle(
                        color: isClickable
                            ? const Color(0x99000000)
                            : const Color(0x4d000000)),
                    onPressed: () => _onPressedRegisterComment(),
                    width: 64.0,
                    height: 32.0,
                    clickable: isClickable ? true : false,
                  ),
                ]),
          ),
        ));
  }

  void _onPressedRegisterComment() {
    String comment = widget.controller.text;
    print(comment);
    if (comment != "") {
      widget.onTapRegister(comment);
      widget.controller.text = "";
      isClickable = false;
      FocusScope.of(context).unfocus();
    }
  }

  void _onTextChanged() {
    isClickable =
        widget.controller.text.length > initCommentText.length ? true : false;
  }
}
