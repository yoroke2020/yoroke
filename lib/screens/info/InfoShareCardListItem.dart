import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';

class InfoShareCardListItem extends StatelessWidget {
  InfoShareCardListItem(
      {required this.width, required this.height, required this.index});

  final double width;
  final double height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: new Container(
            width: width,
            height: height,
            child: Stack(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: new DecorationImage(
                    image: new AssetImage(testCardImage.elementAt(index)),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                          begin: Alignment(0.5, -0.0739222913980484),
                          end: Alignment(0.5, 1),
                          colors: [
                            const Color(0x00ffffff),
                            const Color(0x4d000000)
                          ]))),
              Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // padding: EdgeInsets.only(left: 16, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                    "assets/icons/icon_bookmark_24_px.png",
                                    width: 33,
                                    height: 33),
                              ]),
                        ),
                        Text(infoShareHospitalTitle.elementAt(index),
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                                fontFamily: "NotoSansCJKKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 22.0),
                            textAlign: TextAlign.left),
                      ])),
            ])));
  }
}
