import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YrkTextStyle extends TextStyle {
  final Color color;
  final double height;
  final double letterSpacing;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final FontStyle fontStyle;

  const YrkTextStyle({
    this.color = const Color(0xe6000000),
    this.fontSize = 14.0,
    this.height = 1.5,
    this.letterSpacing = -0.002,
    this.fontWeight = FontWeight.w400,
    this.fontFamily = 'NotoSansCJKkr',
    this.fontStyle = FontStyle.normal,
  }) : super(
          color: color,
          height: height,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          fontStyle: FontStyle.normal,
        );
}
