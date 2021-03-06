import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

enum TextFieldType { solid, search, comment, rect, board }

class YrkTextField extends StatelessWidget {
  final TextFieldType textFieldType;

  final double? width;
  final double? height;

  final TextStyle? style;
  final TextAlign textAlign;

  final String? label;
  final String? errorText;
  final bool? obscureText;

  final Color? fillColor;
  final Color? borderColor;

  final bool? isPrivate;
  final bool isMultiline;

  final TextInputAction? textInputAction;
  final void Function(String)? handleSubmission;
  final void Function(String)? handleChange;
  final TextEditingController? controller;
  final FocusNode? focusNode;

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
    this.textInputAction,
    this.handleSubmission,
    this.handleChange,
    this.controller,
    this.focusNode,
    // Comment
    this.isPrivate = false,
    this.isMultiline = false,
    //
    this.textAlign = TextAlign.start,
    this.style,

  }) : super(key: key);

  get getInputDecoration {
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

    switch (textFieldType) {
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
        _fillColor = fillColor ?? Color(0xfff0f0f0);
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

        _fillColor = fillColor ?? Color(0xfff0f0f0);
        _suffixIcon = _suffixIconClear;

        break;

      case TextFieldType.search:
        _fillColor = fillColor ?? Color(0xfff0f0f0);
        _border = _noBorder;
        _focusedBorder = _noBorder;
        _enabledBorder = _noBorder;
        _prefixIcon = Icon(Icons.search, color: Colors.black);
        _suffixIcon = _suffixIconClear;
        break;

      case TextFieldType.comment:
        _fillColor = fillColor ?? Color(0x000000);
        _border = _noBorder;
        _focusedBorder = _noBorder;
        _enabledBorder = _noBorder;
        break;

      case TextFieldType.board:
        _fillColor = fillColor ?? Color(0x000000);
        _border = _noBorder;
        _focusedBorder = _noBorder;
        _enabledBorder = _noBorder;
        break;

      default:
        return InputDecoration(
          hintText: label,
          errorText: errorText,
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
      hintText: label,
      errorText: errorText,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectionTheme = TextSelectionTheme.of(context);

    return Container(
      width: width,
      height: height,
      child: TextField(
        textAlign: textAlign,
        focusNode: focusNode,
        key: key,
        obscureText: obscureText ?? false,
        cursorColor: selectionTheme.cursorColor,
        cursorRadius: const Radius.circular(2),
        decoration: getInputDecoration,
        textInputAction: textInputAction,
        onSubmitted: handleSubmission,
        onChanged: handleChange,
        controller: controller,
        keyboardType:
            isMultiline ? TextInputType.multiline : TextInputType.text,
        minLines: 1,
        maxLines: isMultiline ? null : 1,
        style: style,
      ),
    );
  }
}
