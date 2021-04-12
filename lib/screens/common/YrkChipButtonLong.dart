import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum YrkChipButtonLongStyle { outline, solid }

class YrkChipButtonLong extends StatelessWidget {
  const YrkChipButtonLong(
      {Key? key, this.buttonStyle = YrkChipButtonLongStyle.outline})
      : super(key: key);
  final YrkChipButtonLongStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color buttonBorderColor;
    Color buttonTextColor;

    if (buttonStyle == YrkChipButtonLongStyle.outline) {
      buttonColor = Colors.transparent;
      buttonBorderColor = const Color(0xfff5df4d);
      buttonTextColor = const Color(0xfff5df4d);
    } else {
      buttonColor = const Color(0xfff5df4d);
      buttonBorderColor = const Color(0xfff5df4d);
      buttonTextColor = const Color(0xe6000000);
    }

    return Container(
        width: 98,
        height: 24,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: buttonBorderColor, width: 1)),
        child: Center(
            child: Text("다른 후기 보기",
                style: TextStyle(
                    color: buttonTextColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 13.0),
                textAlign: TextAlign.center)));
  }
}
