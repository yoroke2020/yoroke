import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkMbsImageList.dart';
import 'YrkMbsRadioButtonList.dart';

enum YrkModelBottomSheetType {
  post,
  createPost,
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
        return YrkMbsImageList(labelList: labelList, imageList: imageList!, onTap: onTap!);
      case YrkModelBottomSheetType.createPost:
        return YrkMbsRadioButtonList(title: title!, labelList: labelList, onTap: onTap!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: listHeight + 44.0,
        width: double.maxFinite,
        color: const Color(0xFF737373),
        child: new Container(
            decoration: new BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 44.0,
                    width: double.maxFinite,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Image.asset("assets/icons/icon_clear_24_px.png",
                              width: 14.0, height: 14.0),
                        ))),
                getModalWidget(context)
              ],
            )));
  }
}
