import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YrkTextStyle extends TextStyle {
  const YrkTextStyle({
    Color? color = const Color(0xe6000000),
    Color? backgroundColor,
    String? fontFamily = 'NotoSansCJKkr',
    double? fontSize = 14.0,
    FontWeight? fontWeight = FontWeight.w400,
    FontStyle? fontStyle = FontStyle.normal,
    double? letterSpacing = 0,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height = 1,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) : super(
          color: color,
          backgroundColor: backgroundColor,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
        );
}
