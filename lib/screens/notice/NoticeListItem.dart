import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';

class NoticeListItem extends StatelessWidget {
  NoticeListItem(
      {required this.width, required this.height, required this.index});

  final double width;
  final double height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      width: width,
      height: height,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 18, top: 16, bottom: 16),
              width: 32,
              height: 32,
              child: Center(
                child: YrkIconButton(
                    icon: "assets/icons/account_circle_default.svg"),
              )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 20.0,
                  margin: EdgeInsets.only(top: 12, left: 10, bottom: 4),
                  child: Center(
                    child: Text("정홍규님이 회원님의 게시물에 댓글을 남겼습니다.",
                        style: const TextStyle(
                            color: const Color(0x4d000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  )),
              Container(
                  height: 17.0,
                  margin: EdgeInsets.only(left: 10, bottom: 11),
                  child: Center(
                    child: Text("2020.12.05",
                        style: const TextStyle(
                            color: const Color(0x4d000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "OpenSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.left),
                  )),
            ],
          ))
        ],
      ),
    ));
  }
}
