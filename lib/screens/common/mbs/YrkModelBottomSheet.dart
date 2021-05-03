import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../YrkIconButton.dart';
import 'YrkMbsImageList.dart';
import 'YrkMbsRadioButtonList.dart';
import 'YrkMbsTextList.dart';

enum YrkModelBottomSheetType {
  post,
  createPost,
  search,
}

class YrkModelBottomSheet extends StatelessWidget {
  const YrkModelBottomSheet(
      {required this.type,
      this.title = "Default",
      required this.labelList,
      this.imageList,
      this.listHeight = 120,
      this.onTap});

  final YrkModelBottomSheetType type;
  final String? title;
  final List<String> labelList;
  final List<String>? imageList;
  final double listHeight;
  final ValueChanged<int>? onTap;

  Widget getModalWidget(BuildContext context) {
    switch (type) {
      case YrkModelBottomSheetType.post:
        return YrkMbsImageList(
            labelList: labelList, imageList: imageList!, onTap: onTap!);
      case YrkModelBottomSheetType.createPost:
        return YrkMbsRadioButtonList(
            title: title!, labelList: labelList, onTap: onTap!);
      case YrkModelBottomSheetType.search:
        return YrkMbsTextList(labelList: labelList, onTap: onTap!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        color: const Color(0xFF737373),
        child: new Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 8.0),
            decoration: new BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 YrkIconButton(
                          onTap: () => Navigator.of(context).pop(),
                          icon: "assets/icons/icon_clear_24_px.svg",
                              width: 24.0, height: 24.0),
                Spacer(),
                getModalWidget(context)
              ],
            )));
  }
}
