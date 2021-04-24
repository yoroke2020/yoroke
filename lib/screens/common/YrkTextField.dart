import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkButton.dart';

import 'YrkTextStyle.dart';

enum TextFieldType { solid, search, comment, rect, board }

// ignore: must_be_immutable
class YrkTextField extends StatefulWidget {
  final TextFieldType textFieldType;

  final double? width;
  final double? height;

  final String? label;
  final String? errorText;
  final bool? obscureText;

  final Color? fillColor;
  final Color? borderColor;

  bool? isPrivate;

  YrkTextField({
    Key? key,
    this.textFieldType = TextFieldType.solid,
    this.width,
    this.height,
    this.label,
    this.errorText,
    this.obscureText,
    this.fillColor,
    this.borderColor,

    // Comment
    this.isPrivate = false,
  }) : super(key: key);

  @override
  _YrkTextFieldState createState() => _YrkTextFieldState();
}

class _YrkTextFieldState extends State<YrkTextField> {
  Widget getChild() {
    return TextField(
      key: widget.key,
      obscureText: widget.obscureText ?? false,
      cursorColor: Color(0xfff5df4d),
      cursorWidth: 2,
      decoration: getDeco(),
    );
  }

  InputDecoration getDeco() {
    Icon _suffixIconClear = Icon(Icons.cancel, color: Colors.grey);
    BorderRadius _borderRound = const BorderRadius.all(Radius.circular(100));
    BorderRadius _borderRect = const BorderRadius.all(Radius.circular(8));

    EdgeInsets _contentPadding =
        EdgeInsets.symmetric(vertical: 12, horizontal: 16);

    TextStyle _hintStyle = YrkTextStyle(color: Color(0x4d000000), fontSize: 16);
    // Borders
    OutlineInputBorder _noBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x0000000), width: 0),
        borderRadius: _borderRound);

    OutlineInputBorder? _border;
    OutlineInputBorder? _focusedBorder;
    OutlineInputBorder? _enabledBorder;
    Widget? _prefixIcon;
    Widget? _suffixIcon;
    Color? _fillColor;

    switch (widget.textFieldType) {
      case TextFieldType.solid:
        _border = OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x4d000000), width: 1),
          borderRadius: _borderRound,
        );
        _focusedBorder = OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xe6000000), width: 1),
          borderRadius: _borderRound,
        );
        _suffixIcon = _suffixIconClear;
        _fillColor = widget.fillColor ?? Color(0xfff0f0f0);
        break;

      case TextFieldType.rect:
        _border = OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x4d000000), width: 1),
          borderRadius: _borderRect,
        );
        _focusedBorder = OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xe6000000), width: 1),
          borderRadius: _borderRect,
        );

        _fillColor = widget.fillColor ?? Color(0xfff0f0f0);
        _suffixIcon = _suffixIconClear;

        break;

      case TextFieldType.search:
        _fillColor = widget.fillColor ?? Color(0xfff0f0f0);
        _border = _noBorder;
        _focusedBorder = _noBorder;
        _enabledBorder = _noBorder;
        _prefixIcon = Icon(Icons.search, color: Colors.black);
        _suffixIcon = _suffixIconClear;
        break;

      case TextFieldType.comment:
        _fillColor = widget.fillColor ?? Color(0x000000);
        _border = _noBorder;
        _focusedBorder = _noBorder;
        _enabledBorder = _noBorder;
        _suffixIcon = Container(
            width: 104,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  // padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      border: Border.all(
                        color: widget.isPrivate!
                            ? Color(0x4d000000)
                            : Color(0xfff5df4d),
                        width: 1,
                      )),
                  child: IconButton(
                      padding: EdgeInsets.all(6),
                      splashColor: Colors.transparent,
                      icon: widget.isPrivate!
                          ? Image.asset(
                              "assets/icons/icon_lock_24_px.png",
                              color: Color(0x4d000000),
                            )
                          : Image.asset("assets/icons/icon_lock_open_24_px.png",
                              color: Color(0xfff5df4d)),
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          widget.isPrivate = !widget.isPrivate!;
                        });
                      }),
                ),
                SizedBox(width: 6),
                YrkButton(
                  buttonType: ButtonType.solid,
                  label: '등록',
                  onPressed: () {},
                  width: 64,
                  height: 32,
                ),
              ],
            ));
        break;

      case TextFieldType.board:
        _fillColor = widget.fillColor ?? Color(0x000000);
        _border = _noBorder;
        _focusedBorder = _noBorder;
        _enabledBorder = _noBorder;
        break;

      default:
        return InputDecoration(
          hintText: widget.label,
          errorText: widget.errorText,
          suffixIcon: Icon(Icons.cancel, color: Colors.black),
        );
    }
    return InputDecoration(
      contentPadding: _contentPadding,
      filled: true,
      border: _border,
      focusedBorder: _focusedBorder,
      enabledBorder: _enabledBorder,
      prefixIcon: _prefixIcon,
      suffixIcon: _suffixIcon,
      fillColor: _fillColor,
      hintStyle: _hintStyle,
      hintText: widget.label,
      errorText: widget.errorText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: getChild(),
    );
  }
}