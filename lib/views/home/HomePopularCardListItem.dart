import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/components/YrkListView.dart';

class HomePopularCardListItem extends StatelessWidget {
  HomePopularCardListItem(
      {@required this.width, @required this.height, @required this.index});

  final double width;
  final double height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(16)),
        elevation: 0.0,
        margin: const EdgeInsets.only(right: 8),
        child: InkWell(
            borderRadius: BorderRadius.circular(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Container(
                      width: width,
                      height: height,
                      child: Stack(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(16)),
                            image: new DecorationImage(
                              image: new AssetImage(
                                  testCardImage.elementAt(index)),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(
                                    Radius.circular(16)),
                                gradient: LinearGradient(
                                    begin: Alignment(0.5,
                                        -0.0739222913980484),
                                    end: Alignment(0.5, 1),
                                    colors: [
                                      const Color(0x00ffffff),
                                      const Color(0x4d000000)
                                    ]))),
                      ])),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 8, top: 8),
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
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                                flex: 4, child: Container()),
                            Expanded(
                                flex: 95,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0x00000000)),
                                        child: Image.asset(
                                            "assets/icons/icon_grade_fill_24_px.png"),
                                      ),
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0x00000000)),
                                        child: Image.asset(
                                            "assets/icons/icon_grade_fill_24_px.png"),
                                      ),
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0x00000000)),
                                        child: Image.asset(
                                            "assets/icons/icon_grade_fill_24_px.png"),
                                      ),
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0x00000000)),
                                        child: Image.asset(
                                            "assets/icons/icon_grade_fill_24_px.png"),
                                      ),
                                      Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                              color: const Color(
                                                  0x00000000)),
                                          child: Image.asset(
                                              "assets/icons/icon_grade_24_px.png"))
                                    ])),
                            Expanded(
                                flex: 16,
                                child: Image.asset(
                                    "assets/icons/icon_save_black_24_px.png")),
                            Expanded(
                                flex: 23,
                                child: Text("246",
                                    style: const TextStyle(
                                        color: const Color(
                                            0x4d000000),
                                        fontWeight:
                                        FontWeight.w400,
                                        fontFamily:
                                        "Helvetica",
                                        fontStyle:
                                        FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign:
                                    TextAlign.left)),
                          ])),
                ])));
  }
}
