import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkMbsListData.dart';
import 'package:yoroke/navigator/PageItem.dart';

import '../YrkIconButton.dart';
import 'YrkMbsImageList.dart';
import 'YrkMbsRadioButtonList.dart';
import 'YrkMbsTextList.dart';

Future<T?> showYrkModalBottomSheet<T>({
  required BuildContext context,
  required pageType,
  String? title,
  List<String>? labelList,
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
          pageType: pageType,
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
  _YrkModelBottomSheet(
      {required this.pageType,
      this.title = "Default",
      this.labelList,
      this.imageList,
      this.listHeight,
      this.onTap,
      this.defaultRadioGroupIndex = -1});

  final pageType;
  final String? title;
  final List<String>? labelList;
  final List<String>? imageList;
  final double? listHeight;
  final ValueChanged<int>? onTap;

  final int? defaultRadioGroupIndex;

  final double _yrkMbsImageListOffset = 104.0;
  final double _yrkMbsRadioButtonListOffset = 158.0;

  get _getModalWidget {
    switch (pageType) {
      // case SubPageItem.post:
      //   return YrkMbsImageList(
      //           labelList: YrkPostMbsListData.myPostLabelList,
      //           imageList: YrkPostMbsListData.myPostImageList,
      //           onTap: onTap!);
      case SubPageItem.post:
        return YrkMbsImageList(
            labelList: YrkPostMbsListData.otherPostLabelList,
            imageList: YrkPostMbsListData.otherPostImageList,
            onTap: onTap!);
      case SubPageItem.boardReview:
        return YrkMbsRadioButtonList(
            title: title!,
            labelList: YrkPostCreateMbsListData.boardReviewLabelList,
            onTap: onTap!,
            defaultRadioGroupIndex: defaultRadioGroupIndex!);
      case SubPageItem.boardQna:
        return YrkMbsRadioButtonList(
            title: title!,
            labelList: YrkPostCreateMbsListData.boardQnaLabelList,
            onTap: onTap!,
            defaultRadioGroupIndex: defaultRadioGroupIndex!);
      case SubPageItem.boardJobFinding:
        return YrkMbsRadioButtonList(
            title: title!,
            labelList: YrkPostCreateMbsListData.boardJobFindingLabelList,
            onTap: onTap!,
            defaultRadioGroupIndex: defaultRadioGroupIndex!);
      case SubPageItem.search:
        return YrkMbsTextList(labelList: labelList!, onTap: onTap!);
      default:
        return null;
    }
  }

  get _getListHeight {
    switch (pageType) {
      // case SubPageItem.post:
      //   return 49.0 * YrkPostMbsListData.myPostLabelList.length + 65.0;
      case SubPageItem.post:
        return 49.0 * YrkPostMbsListData.otherPostLabelList.length +
            _yrkMbsImageListOffset;
      case SubPageItem.boardReview:
        return 49.0 * YrkPostCreateMbsListData.boardReviewLabelList.length +
            _yrkMbsRadioButtonListOffset;
      case SubPageItem.boardQna:
        return 49.0 * YrkPostCreateMbsListData.boardQnaLabelList.length +
            _yrkMbsRadioButtonListOffset;
      case SubPageItem.boardJobFinding:
        return 49.0 * YrkPostCreateMbsListData.boardJobFindingLabelList.length +
            _yrkMbsRadioButtonListOffset;
      case SubPageItem.search:
        // TODO: Handle this case.
        break;
    }

    return listHeight;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: _getListHeight / MediaQuery.of(context).size.height,
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
