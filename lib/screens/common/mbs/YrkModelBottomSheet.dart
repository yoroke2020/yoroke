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

Future<T?> showYrkModalBottomSheet<T>({
  required BuildContext context,
  required YrkModelBottomSheetType type,
  String? title,
  required List<String> labelList,
  List<String>? imageList,
  double? listHeight,
  ValueChanged<int>? onTap,
  int? defaultRadioGroupIndex,
}) async {
  FocusScope.of(context).unfocus();
  showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _YrkModelBottomSheet(
          type: type,
          title: title,
          labelList: labelList,
          imageList: imageList,
          listHeight: listHeight,
          onTap: onTap,
          defaultRadioGroupIndex: defaultRadioGroupIndex,
        );
      });
}

class _YrkModelBottomSheet extends StatelessWidget {
  const _YrkModelBottomSheet(
      {required this.type,
      this.title = "Default",
      required this.labelList,
      this.imageList,
      this.listHeight,
      this.onTap,
      this.defaultRadioGroupIndex = -1});

  final YrkModelBottomSheetType type;
  final String? title;
  final List<String> labelList;
  final List<String>? imageList;
  final double? listHeight;
  final ValueChanged<int>? onTap;

  final int? defaultRadioGroupIndex;

  get _getModalWidget {
    switch (type) {
      case YrkModelBottomSheetType.post:
        return YrkMbsImageList(
            labelList: labelList, imageList: imageList!, onTap: onTap!);
      case YrkModelBottomSheetType.createPost:
        return YrkMbsRadioButtonList(
            title: title!,
            labelList: labelList,
            onTap: onTap!,
            defaultRadioGroupIndex: defaultRadioGroupIndex!);
      case YrkModelBottomSheetType.search:
        return YrkMbsTextList(labelList: labelList, onTap: onTap!);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(listHeight);
    double heightFactor = listHeight != null
        ? listHeight! / MediaQuery.of(context).size.height
        : 1;

    print("heightFactor = " + heightFactor.toString());

    return FractionallySizedBox(
      heightFactor: heightFactor,
      child: Container(
          width: double.maxFinite,
          color: const Color(0xFF737373),
          child: Container(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 12.0, bottom: 8.0),
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
                      width: 24.0,
                      height: 24.0),
                  Spacer(),
                  _getModalWidget
                ],
              ))),
    );
  }
}
