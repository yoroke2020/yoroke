import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

enum TextFieldType { solid, search, comment, rect, board }

const BorderRadius borderRound = const BorderRadius.all(Radius.circular(100));
const BorderRadius borderRect = const BorderRadius.all(Radius.circular(8));

class YrkTextField extends StatefulWidget {
  final TextFieldType textFieldType;

  final double? width;
  final double? height;

  final String? label;
  final String? errorText;
  final bool? obscureText;

  final Color? fillColor;
  final Color? borderColor;

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
  }) : super(key: key);

  @override
  _YrkTextFieldState createState() => _YrkTextFieldState();
}

class _YrkTextFieldState extends State<YrkTextField> {
  Widget getChild() {
    return TextField(
      key: widget.key,
      obscureText: widget.obscureText ?? false,
      decoration: getDeco(),
    );
  }

  InputDecoration getDeco() {
    Icon _suffixIconClear = Icon(Icons.cancel, color: Colors.grey);
    switch (widget.textFieldType) {
      case TextFieldType.solid:
        return InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          // fillColor: fillColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x4d000000), width: 1),
            borderRadius: borderRound,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xe6000000), width: 1),
            borderRadius: borderRound,
          ),
          hintStyle: const YrkTextStyle(
            color: Color(0x4d000000),
            fontSize: 16,
          ),
          hintText: widget.label,
          errorText: widget.errorText,
          fillColor: const Color(0xfff0f0f0),

          suffixIcon: _suffixIconClear,
        );

      case TextFieldType.rect:
        return InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          // fillColor: fillColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x4d000000), width: 1),
            borderRadius: borderRect,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xe6000000), width: 1),
            borderRadius: borderRect,
          ),
          hintStyle: const YrkTextStyle(
            color: Color(0x4d000000),
            fontSize: 16,
          ),
          hintText: widget.label,
          errorText: widget.errorText,
          fillColor: const Color(0xfff0f0f0),
          suffixIcon: _suffixIconClear,
        );
      case TextFieldType.search:
        return InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          fillColor: widget.fillColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000), width: 0),
            borderRadius: borderRound,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000), width: 0),
            borderRadius: borderRound,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000), width: 0),
            borderRadius: borderRound,
          ),
          hintStyle: const YrkTextStyle(
            color: Color(0x4d000000),
            fontSize: 16,
          ),
          hintText: widget.label,
          prefixIcon: Icon(Icons.search, color: Colors.black),
          suffixIcon: _suffixIconClear,
        );
      default:
        return InputDecoration(
          filled: true,
          // fillColor: fillColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x4d000000), width: 1),
            borderRadius: borderRound,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xe6000000), width: 1),
            borderRadius: borderRound,
          ),
          hintStyle: const YrkTextStyle(
            color: Color(0x4d000000),
            fontSize: 16,
          ),
          hintText: widget.label,
          errorText: widget.errorText,
          fillColor: const Color(0xfff0f0f0),
          suffixIcon: Icon(Icons.cancel, color: Colors.black),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: getChild());
  }
}
