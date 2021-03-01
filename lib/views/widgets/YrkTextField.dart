import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

class YrkTextField extends StatefulWidget {
  double width;
  double height;
  final String label;
  final bool obscureText;

  YrkTextField({
    Key key,
    @required this.label,
    this.obscureText = false,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _YrkTextFieldState createState() => _YrkTextFieldState();
}

class _YrkTextFieldState extends State<YrkTextField> {
  String validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Wrong";
    }
    return null;
  }

  InputDecoration _YrkTxtFieldInputDecoration(String label) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xfff0f0f0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color(0xe6000000),
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(36),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color(0xff4d0000),
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(36),
        ),
      ),
      labelStyle: YrkTextStyle(
          color: Color(0x4d000000),
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: -0.32 / 16),
      labelText: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: TextField(
            decoration: _YrkTxtFieldInputDecoration(widget.label),
            obscureText: widget.obscureText,
          ),
        ),
      ),
    );
  }
}
