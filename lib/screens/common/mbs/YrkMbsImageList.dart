import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../YrkButton.dart';
import '../YrkTextStyle.dart';

class YrkMbsImageList extends StatelessWidget {
  YrkMbsImageList({
    required this.labelList,
    required this.imageList,
    required this.onTap,
  });

  final List<String> labelList;
  final List<String> imageList;
  final ValueChanged<int> onTap;

  get yrkMbsImageList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < labelList.length; i++) {
      list.add(InkWell(
        onTap: () => onTap(i),
        child: _YrkMbsImageListItem(
          imageAsset: imageList[i],
          title: labelList[i],
          isBorder: i < labelList.length - 1 ? true : false,
        ),
      ));
    }
    return Wrap(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        yrkMbsImageList,
        Container(
            width: double.maxFinite,
            height: 48.0,
            child: YrkButton(
              width: 328.0,
              height: 48.0,
              buttonType: ButtonType.outline,
              outlineBackgroundColor: const Color(0xffffffff),
              btnColor: const Color(0xfff5df4d),
              label: "닫기",
              fontColor: const Color(0xe6000000),
              onPressed: () => Navigator.of(context).pop(),
            ))
      ],
    );
  }
}

class _YrkMbsImageListItem extends StatelessWidget {
  _YrkMbsImageListItem(
      {required this.imageAsset, required this.title, this.isBorder = true});

  final String imageAsset;
  final String title;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 49.0,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(imageAsset, width: 24.0, height: 24.0),
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
      ),
    );
  }
}
