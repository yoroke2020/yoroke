import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

import 'YrkMbsImageList.dart';
import 'YrkMbsRadioButtonList.dart';
import 'YrkMbsTextList.dart';

enum YrkMbsType {
  text,
  image,
  radioButton,
}

Future<T?> showYrkModalBottomSheet<T>({
  required BuildContext context,
  required YrkMbsType type,
  ValueChanged<int>? onTap,
  List<String>? titleList,
  required List<String> labelList,
  List<String>? imageList,
  List<int>? labelCountPerTitleList,
  int? defaultRadioGroupIndex,
}) async {
  FocusScope.of(context).unfocus();
  showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _YrkModelBottomSheet(
          mbsType: type,
          onTap: onTap,
          titleList: titleList,
          labelList: labelList,
          imageList: imageList,
          labelCountPerTitleList: labelCountPerTitleList,
          defaultRadioGroupIndex: defaultRadioGroupIndex,
        );
      });
}

class _YrkModelBottomSheet extends StatelessWidget {
  _YrkModelBottomSheet(
      {required this.mbsType,
      this.onTap,
      this.titleList,
      required this.labelList,
      this.imageList,
      this.labelCountPerTitleList,
      this.defaultRadioGroupIndex = -1});

  final YrkMbsType mbsType;
  final ValueChanged<int>? onTap;

  final List<String>? titleList;
  final List<String> labelList;
  final List<String>? imageList;

  final List<int>? labelCountPerTitleList;

  final int? defaultRadioGroupIndex;

  @override
  Widget build(BuildContext context) {
    Widget modalWidget;
    double modalHeight;

    switch (mbsType) {
      case YrkMbsType.text:
        modalWidget = YrkMbsTextList(labelList: labelList, onTap: onTap!);
        modalHeight = 49.0 * labelList.length + 79.0;
        break;
      case YrkMbsType.image:
        modalWidget = YrkMbsImageList(
            labelList: labelList, imageList: imageList!, onTap: onTap!);
        modalHeight = 49.0 * labelList.length + 120.0;
        break;
      case YrkMbsType.radioButton:
        modalWidget = YrkMbsRadioButtonList(
            titleList: titleList!,
            labelList: labelList,
            labelCountPerTitleList: labelCountPerTitleList!,
            onTap: onTap!,
            defaultRadioGroupIndex: defaultRadioGroupIndex!);
        modalHeight = 49.0 * labelList.length + 158.0;
        break;
    }

    return FractionallySizedBox(
        heightFactor: modalHeight / MediaQuery.of(context).size.height,
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
              child: Scaffold(
                  appBar: PreferredSize(
                      preferredSize: Size.fromHeight(44.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 16.0),
                        alignment: Alignment.centerLeft,
                        child: YrkIconButton(
                            onTap: () => Navigator.of(context).pop(),
                            icon: "icon_clear.svg",
                            padding: EdgeInsets.zero,
                            iconSize: 24.0),
                      )),
                  body: SingleChildScrollView(child: modalWidget)),
            )));
  }
}
