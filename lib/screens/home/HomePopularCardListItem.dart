import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkStarRating.dart';

class HomePopularCardListItem extends StatelessWidget {
  HomePopularCardListItem(
      {required this.width,
      required this.height,
      required this.index,
      this.onPushNavigator});

  final double width;
  final double height;
  final int index;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  Widget build(BuildContext context) {
    return Card(
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(16)),
        elevation: 0.0,
        margin: const EdgeInsets.only(right: 8),
        child: InkWell(
            onTap: () => onPushNavigator!(new YrkData(
                  nextPageItem: SubPageItem.boardReview,
                )),
            borderRadius: BorderRadius.circular(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
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
                  ])),
              Container(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Text("조문기 요양병원",
                      style: const TextStyle(
                          color: const Color(0xe6000000),
                          fontWeight: FontWeight.w700,
                          fontFamily: "NotoSansCJKKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left)),
              Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text("서울시 마포구",
                      style: const TextStyle(
                          color: const Color(0xe6000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left)),
              Container(
                  width: 144,
                  height: 30,
                  child: Row(children: <Widget>[
                    Container(
                        width: 60,
                        height: 16,
                        margin: const EdgeInsets.only(left: 4),
                        child: YrkStarRating(
                            rating: 4.8, eachWidth: 12, eachHeight: 11)),
                    Container(
                      margin: const EdgeInsets.only(left: 39),
                      width: 16,
                      height: 16,
                      child: YrkIconButton(icon: "icon_save_black.svg"),
                    ),
                    Container(
                        width: 25,
                        height: 16,
                        padding: const EdgeInsets.only(top: 1, bottom: 1),
                        child: Text("246",
                            style: const TextStyle(
                                color: const Color(0x4d000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Helvetica",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left)),
                  ])),
            ])));
  }
}
