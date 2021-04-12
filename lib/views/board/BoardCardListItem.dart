import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/components/YrkListView.dart';
import 'package:yoroke/views/widgets/YrkTextStyle.dart';

class BoardCardListItem extends StatelessWidget {
  BoardCardListItem(
      {required this.width, required this.height, required this.index});

  final double width;
  final double height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
            width: width,
            height: height,
            child: Column(children: <Widget>[
              Container(
                width: width,
                height: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: new DecorationImage(
                    image: new AssetImage(testCardImage.elementAt(index)),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                 height: 20.0,
                margin: EdgeInsets.only(top: 8.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    testShortString.elementAt(index),
                    style: const YrkTextStyle(
                        color:  const Color(0x99000000),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0
                  )),
              )]));
  }
}
