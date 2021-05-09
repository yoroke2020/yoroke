import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../YrkTextStyle.dart';

class YrkMbsRadioButtonList extends StatefulWidget {
  YrkMbsRadioButtonList(
      {required this.titleList,
      required this.labelList,
      required this.labelCountPerTitleList,
      required this.onTap,
      this.defaultRadioGroupIndex = -1,
      this.isAll = false});

  final List<String> titleList;
  final List<String> labelList;
  final List<int> labelCountPerTitleList;
  final ValueChanged<int> onTap;
  final int defaultRadioGroupIndex;
  final bool isAll;

  @override
  _YrkMbsRadioButtonListState createState() => _YrkMbsRadioButtonListState();
}

class _YrkMbsRadioButtonListState extends State<YrkMbsRadioButtonList> {
  late int groupValue = widget.defaultRadioGroupIndex;

  get yrkMbsRadioButtonList {
    List<Widget> list = <Widget>[];
    int startIndex = 0;
    int endIndex = 0;
    print("count = " + widget.labelCountPerTitleList.toString());
    print("length = " + widget.labelList.length.toString());
    for (int i = 0; i < widget.titleList.length; i++) {
      endIndex += widget.labelCountPerTitleList[i];
      print("startIndex = " +
          startIndex.toString() +
          " endIndex = " +
          endIndex.toString());
      list.add(
        Container(
            padding: EdgeInsets.only(left: 8.0, bottom: 11.0),
            width: double.maxFinite,
            height: 48.0,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.titleList[i],
                    style: const YrkTextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18.0)))),
      );
      for (int j = startIndex; j < endIndex; j++) {
        list.add(_YrkMbsRadioButtonListItem(
            title: widget.labelList[j],
            index: j,
            groupValue: groupValue,
            onSelected: (index) => setState(() {
                  print("index = " + index.toString());
                  groupValue = index;
                  widget.onTap(groupValue);
                })));
      }
      startIndex += widget.labelCountPerTitleList[i];
    }
    return Wrap(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 8.0, bottom: 4.0),
            width: double.maxFinite,
            height: 40,
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text("게시글 카테고리 선택",
                    style: const YrkTextStyle(
                      color: const Color(0x99000000),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left))),
        yrkMbsRadioButtonList,
      ],
    );
  }
}

class _YrkMbsRadioButtonListItem extends StatelessWidget {
  _YrkMbsRadioButtonListItem(
      {required this.title,
      required this.index,
      required this.groupValue,
      required this.onSelected});

  final String title;
  final int index;
  final int groupValue;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(index),
      child: Container(
        width: double.maxFinite,
        height: 49.0,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: const Color(0x1a000000), width: 1.0))),
        child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(title,
                    style: const YrkTextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left),
                Spacer(),
                Radio(
                    value: index,
                    groupValue: groupValue,
                    activeColor: const Color(0xfff5df4d),
                    onChanged: (int? value) => onSelected(index))
              ],
            )),
      ),
    );
  }
}
