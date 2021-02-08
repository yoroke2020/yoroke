import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

class YrkButtonOutline extends StatelessWidget {
  final String label;

  YrkButtonOutline({Key key, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 10, //버튼의 최소 가로 길이
      height: 10, //버튼의 세로 길이
      // shape:
      child: OutlineButton(
        //ButtonTheme의 child로 버튼 위젯 삽입
        onPressed: () {},
        child: Text(
          this.label,
          style: YrkTextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          //버튼을 둥글게 처리
          borderRadius: BorderRadius.circular(32),
        ),
        borderSide: BorderSide(
          width: 2.0,
          color: const Color(0xfff5df4d),
        ),
      ),
    );
  }
}
