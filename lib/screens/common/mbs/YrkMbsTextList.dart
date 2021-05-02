import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../YrkTextStyle.dart';

class YrkMbsTextList extends StatelessWidget {
  YrkMbsTextList({
    required this.labelList,
    required this.onTap,
  });

  final List<String> labelList;
  final ValueChanged<int> onTap;

  get yrkMbsTextList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < labelList.length; i++) {
      list.add(InkWell(
        onTap: () => onTap(i),
        child: _YrkMbsTextListItem(
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
      children: <Widget>[yrkMbsTextList],
    );
  }
}

class _YrkMbsTextListItem extends StatelessWidget {
  _YrkMbsTextListItem({required this.title, this.isBorder = true});

  final String title;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0),
        height: 49.0,
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
