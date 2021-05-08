import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../YrkTextStyle.dart';

class YrkMbsRadioButtonList extends StatefulWidget {
  YrkMbsRadioButtonList(
      {required this.title,
      required this.labelList,
      required this.onTap,
      this.defaultRadioGroupIndex = -1});

  final String title;
  final List<String> labelList;
  final ValueChanged<int> onTap;
  final int defaultRadioGroupIndex;

  @override
  _YrkMbsRadioButtonListState createState() => _YrkMbsRadioButtonListState();
}

class _YrkMbsRadioButtonListState extends State<YrkMbsRadioButtonList> {
  late int groupValue = widget.defaultRadioGroupIndex;

  get yrkMbsRadioButtonList {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < widget.labelList.length; i++) {
      list.add(_YrkMbsRadioButtonListItem(
          title: widget.labelList[i],
          index: i,
          groupValue: groupValue,
          onSelected: (index) => setState(() {
                groupValue = index;
                widget.onTap(groupValue);
              })));
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
            margin: EdgeInsets.only(left: 8.0, bottom: 4.0),
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
        Container(
            margin: EdgeInsets.only(left: 8.0, bottom: 11.0),
            width: double.maxFinite,
            height: 48.0,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.title,
                    style: const YrkTextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18.0)))),
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
    return Container(
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
    );
  }
}
