import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

const BorderRadius borderRadius = const BorderRadius.all(Radius.circular(100));

class YrkTextFieldInputDecoration extends InputDecoration {
  // final bool? filled;
  final String? hintText;
  final String? errorText;
  //
  final int? type;

  const YrkTextFieldInputDecoration({
    this.type,
    this.hintText,
    this.errorText,
  }) : super(
          contentPadding: const EdgeInsets.only(
            left: 16,
            top: 12,
            bottom: 12,
          ),
          filled: true,
          fillColor: const Color(0xfff0f0f0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0x4d000000),
              width: 1,
            ),
            borderRadius: borderRadius,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xe6000000),
              width: 1,
            ),
            borderRadius: borderRadius,
          ),
          hintStyle: const YrkTextStyle(
            color: Color(0x4d000000),
            fontSize: 16,
          ),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          // hintText: labelText,
          // errorText: errorText,
        );
}

class YrkTextField extends TextField {
  final bool obscureText;
  final String? label;
  final String? errorText;

  final double? width;
  final double? height;

  YrkTextField({
    this.obscureText = false,
    this.label,
    this.errorText,
    this.height,
    this.width,
  }) : super(
          obscureText: obscureText,
          decoration: YrkTextFieldInputDecoration(
            hintText: label,
            errorText: errorText,
          ),
        );
}
