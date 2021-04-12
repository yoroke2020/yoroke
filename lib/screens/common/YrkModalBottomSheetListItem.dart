import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

class YrkModalBottomSheetListItem extends StatelessWidget {
  YrkModalBottomSheetListItem(
      {required this.imageAsset, required this.title, this.isBorder = true});

  final String imageAsset;
  final String title;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      height: 49.0,
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 24.0,
            height: 24.0,
            child: Image.asset(imageAsset),
          ),
          Expanded(
              child: Container(
                  height: 49.0,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1.0,
                              color: isBorder
                                  ? const Color(0xffeaeaea)
                                  : const Color(0xffffffff)))),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(title,
                          style: const YrkTextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left))))
        ],
      ),
    );
  }
}
