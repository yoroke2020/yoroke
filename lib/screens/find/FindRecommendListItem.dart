import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class FindRecommendListItem extends StatelessWidget {
  FindRecommendListItem({
    required this.pageIndex,
    required this.listIndex,
    required this.onPushNavigator,
  });

  final int pageIndex;
  final int listIndex;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          onPushNavigator!(new YrkData(nextPageItem: SubPageItem.testPage)),
      child: Container(
          width: double.maxFinite,
          height: 264.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.maxFinite,
                height: 160.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("assets/icons/sample_image.png",
                        width:
                            264 / 360 * MediaQuery.of(context).size.width - 20,
                        height: 160.0,
                        fit: BoxFit.fill),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/icons/sample_image.png",
                              width:
                                  96 / 360 * MediaQuery.of(context).size.width -
                                      16,
                              height: 78.0,
                              fit: BoxFit.fill),
                          Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Image.asset("assets/icons/sample_image.png",
                                width: 96 /
                                        360 *
                                        MediaQuery.of(context).size.width -
                                    16,
                                height: 78.0,
                                fit: BoxFit.fill),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 35.0,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "조문기네 요양원",
                    style: const YrkTextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18.0),
                  )),
              Container(
                height: 24.0,
                alignment: Alignment.bottomLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "서울시 마포구",
                        style: const YrkTextStyle(
                          color: const Color(0x99000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                          width: 1,
                          height: 14,
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          decoration:
                              BoxDecoration(color: const Color(0x4d000000))),
                      Text("2km",
                          style: const YrkTextStyle(
                              color: const Color(0x4d000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                              fontSize: 16.0),
                          textAlign: TextAlign.left)
                    ]),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      YrkIconButton(
                        icon: "assets/icons/icon_review_star_on_24_px.svg",
                        width: 16.0,
                        height: 16.0,
                        padding: EdgeInsets.only(right: 2.0),
                        clickable: false,
                      ),
                      Text("4.8 (12)",
                          style: const YrkTextStyle(
                              color: const Color(0x99000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                              fontSize: 16.0)),
                      Container(
                          width: 1,
                          height: 14,
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          decoration:
                              BoxDecoration(color: const Color(0x4d000000))),
                      Text("시설등급",
                          style: const TextStyle(
                              color: const Color(0x4d000000))),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text("A",
                            style: const TextStyle(
                                color: const Color(0x4d000000),
                                fontWeight: FontWeight.w600,
                                fontFamily: "OpenSans",
                                fontSize: 16.0)),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
