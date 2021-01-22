import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YorokeCardView extends StatelessWidget {
  YorokeCardView(
      {this.viewRatio, this.cardRatio, this.cardImageList, this.cardNameList});

  final double viewRatio;
  final double cardRatio;
  final List<String> cardImageList;
  final List<String> cardNameList;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        child: new AspectRatio(
            aspectRatio: viewRatio,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              physics: new AlwaysScrollableScrollPhysics(),
              itemCount: cardImageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    margin: const EdgeInsets.only(right: 8),
                    child: new AspectRatio(
                        aspectRatio: cardRatio,
                        child: Stack(children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                image: new DecorationImage(
                                  image: new AssetImage(
                                      cardImageList.elementAt(index)),
                                  fit: BoxFit.fill,
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment(0.5, -0.0739222913980484),
                                    end: Alignment(0.5, 1),
                                    colors: [
                                      const Color(0x00ffffff),
                                      const Color(0x4d000000)
                                    ])),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 12, bottom: 8),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                cardNameList.elementAt(index),
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                              ))
                        ])));
              },
            )));
  }
}
