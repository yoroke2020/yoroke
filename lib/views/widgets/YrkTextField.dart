import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

class YrkTextField extends StatefulWidget {
  final double width;
  final double height;
  final String label;
  final bool obscureText;

  final double fontSize;

  final TextEditingController txtController = TextEditingController();

  YrkTextField({
    Key key,
    @required this.label,
    this.obscureText = false,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  _YrkTextFieldState createState() => _YrkTextFieldState();
}

class _YrkTextFieldState extends State<YrkTextField> {
  InputDecoration YrkTxtFieldInputDecoration(String label) {
    return InputDecoration(
      contentPadding: EdgeInsets.all((widget.height - widget.fontSize) * 0.5),
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
      hintStyle: YrkTextStyle(
        color: Color(0x4d000000),
        fontSize: 16,
      ),
      hintText: label,
    );
  }

  void _handleSubmitted(String text) {
    widget.txtController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(0),
      alignment: AlignmentDirectional.center,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: TextField(
          // controller: widget.txtController,
          // onSubmitted: _handleSubmitted,
          decoration: YrkTxtFieldInputDecoration(widget.label),
          obscureText: widget.obscureText,
          // scrollPadding: EdgeInsets.only(bottom:bottomInsets + 40.0),
        ),
      ),
    );
  }
}
