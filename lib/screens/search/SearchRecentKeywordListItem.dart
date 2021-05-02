import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchRecentKeywordListItem extends StatelessWidget {
  SearchRecentKeywordListItem(
      {required this.width,
      required this.height,
      required this.index,
      required this.inputText});

  final double width;
  final double height;
  final int index;
  final String inputText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      width: width,
      height: height,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
              width: 24,
              height: 24,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 3, right: 3.5, top: 3, bottom: 3.5),
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/icons/search_24_px.png"),
                ),
              )),
          Container(
              margin: EdgeInsets.only(left: 8, top: 12, bottom: 12),
              height: 20,
              child: Container(
                  child: Text((inputText == '' ? "요로케" : inputText),
                      style: const TextStyle(
                          color: const Color(0xe6000000),
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansCJKKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left)))
        ],
      ),
    ));
  }
}
