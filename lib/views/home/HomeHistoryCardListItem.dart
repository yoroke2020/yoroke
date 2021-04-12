import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';

class HomeHistoryCardListItem extends StatelessWidget {
  HomeHistoryCardListItem(
      {required this.width, required this.height, required this.index});

  final double width;
  final double height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(16)),
        elevation: 0.0,
        margin: const EdgeInsets.only(top: 12, bottom: 10),
        child: InkWell(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: width,
              height: height,
              margin: const EdgeInsets.only(bottom: 2),
              child: Row(
                children: [
                  Expanded(
                      flex: 120,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: new DecorationImage(
                            image:
                                new AssetImage(testCardImage.elementAt(index)),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 224,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            flex: 27,
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              alignment: Alignment.bottomLeft,
                              child: Text("조문기네 요양원",
                                  style: const TextStyle(
                                      color: const Color(0xe6000000),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "NotoSansCJKKR",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0),
                                  textAlign: TextAlign.left),
                            )),
                        Expanded(
                          flex: 27,
                          child: Container(),
                        ),
                        Expanded(
                            flex: 20,
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              alignment: Alignment.bottomLeft,
                              child: Text("서울시 마포구",
                                  style: const TextStyle(
                                      color: const Color(0x99000000),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NotoSansCJKKR",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                            )),
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Expanded(
                            flex: 17,
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              alignment: Alignment.bottomLeft,
                              child: Text("4.8 (12)",
                                  style: const TextStyle(
                                      color: const Color(0x99000000),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "OpenSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left),
                            )),
                        Expanded(
                          flex: 4,
                          child: Container(),
                        ),
                        Expanded(
                            flex: 18,
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              alignment: Alignment.bottomLeft,
                              child: Text("시설등급",
                                  style: const TextStyle(
                                      color: const Color(0x99000000),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKKR",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left),
                            )),
                        Expanded(
                          flex: 18,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 27,
                          child: Text("722,390",
                              style: const TextStyle(
                                  color: const Color(0xe6000000),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "OpenSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0),
                              textAlign: TextAlign.left),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
