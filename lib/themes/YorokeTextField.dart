import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:helloflutter/themes/YorokeTextStyle.dart';
import 'package:helloflutter/views/components/YrkTextStyle.dart';

InputDecoration textFieldInputDecotation(String label) {
  return InputDecoration(
      filled: true,
      fillColor: const Color(0xfff0f0f0), // diff
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
      labelText: label);
}

class YorokeTextField extends StatefulWidget {
  final String label;
  final bool obscureText;

  YorokeTextField({Key key, @required this.label, this.obscureText = false})
      : super(key: key);

  @override
  _YorokeTextFieldState createState() => _YorokeTextFieldState();
}

class _YorokeTextFieldState extends State<YorokeTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: textFieldInputDecotation(widget.label),
      obscureText: widget.obscureText,
    );
  }
}
