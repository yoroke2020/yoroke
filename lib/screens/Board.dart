import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      children: <Widget>[
        Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: new AspectRatio(
                aspectRatio: 360 / 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(flex: 16, child: Container()),
                      Expanded(
                        flex: 304,
                        child: Text("후기",
                            style: const TextStyle(
                                color: const Color(0xe6000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                      ),
                      Expanded(
                        flex: 24,
                        child:
                            Image.asset("assets/icons/navigate_next_24_px.png"),
                      ),
                      Expanded(flex: 16, child: Container())
                    ]))),
        Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: new AspectRatio(
                aspectRatio: 360 / 120,
                child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: new AspectRatio(
                              aspectRatio: 136 / 120,
                              child: Opacity(
                                  opacity: 0.15000000596046448,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          color: const Color(0xe6000000)),
                                      child: Image.asset(
                                          "assets/icons/navigate_next_24_px.png"))))),
                      Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: new AspectRatio(
                              aspectRatio: 136 / 120,
                              child: Opacity(
                                  opacity: 0.15000000596046448,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          color: const Color(0xe6000000)),
                                      child: Image.asset(
                                          "assets/icons/navigate_next_24_px.png"))))),
                      Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: new AspectRatio(
                              aspectRatio: 136 / 120,
                              child: Opacity(
                                  opacity: 0.15000000596046448,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          color: const Color(0xe6000000)),
                                      child: Image.asset(
                                          "assets/icons/navigate_next_24_px.png"))))),
                      Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: new AspectRatio(
                              aspectRatio: 136 / 120,
                              child: Opacity(
                                  opacity: 0.15000000596046448,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          color: const Color(0xe6000000)),
                                      child: Image.asset(
                                          "assets/icons/navigate_next_24_px.png"))))),
                    ]))),
        Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: new AspectRatio(
                aspectRatio: 360 / 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(flex: 16, child: Container()),
                      Expanded(
                        flex: 304,
                        child: Text("고민/질문",
                            style: const TextStyle(
                                color: const Color(0xe6000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                      ),
                      Expanded(
                        flex: 24,
                        child:
                            Image.asset("assets/icons/navigate_next_24_px.png"),
                      ),
                      Expanded(flex: 16, child: Container())
                    ]))),
        Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
            child: new AspectRatio(
                aspectRatio: 360 / 268,
                child: PageView(children: [
                  Column(children: <Widget>[
                    AspectRatio(
                        aspectRatio: 360 / 65,
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                border: Border(
                                    top: BorderSide(
                                        width: 1,
                                        color: const Color(0x14000000)))),
                            child: Row(children: <Widget>[
                              Expanded(
                                  flex: 295,
                                  child: Container(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 37,
                                                    child: Text("질문",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x99000000),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 16.0),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                  Expanded(
                                                      flex: 258,
                                                      child: Text("요양병원 질문",
                                                          style: const TextStyle(
                                                              color: const Color(
                                                                  0xe6000000),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "NotoSansCJKkr",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 16.0),
                                                          textAlign:
                                                              TextAlign.left))
                                                ])),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 86,
                                                    child: Text("2020.10.21",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x4d000000),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.0),
                                                        textAlign:
                                                            TextAlign.left)),
                                                Expanded(
                                                    flex: 14,
                                                    child: Image.asset(
                                                        "assets/icons/thumb_up_16_px.png")),
                                                Expanded(
                                                  flex: 5,
                                                  child: Container()
                                                ),
                                                Expanded(
                                                    flex: 195,
                                                    child: Text("15k",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x4d000000),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.0),
                                                        textAlign:
                                                            TextAlign.left))
                                              ],
                                            ))
                                      ]))),
                              Expanded(
                                  flex: 65,
                                  child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                        Expanded(
                                          flex: 14,
                                          child: Image.asset(
                                              "assets/icons/mode_comment_16_px.png"),
                                        ),
                                        Expanded(
                                            flex: 51,
                                            child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                                child: Text("152",
                                                    style: const TextStyle(
                                                        color: const Color(
                                                            0xe6000000),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            "NotoSansCJKkr",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.0),
                                                    textAlign: TextAlign.left)))
                                      ])))
                            ]))),
                    AspectRatio(
                        aspectRatio: 360 / 65,
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                border: Border(
                                    top: BorderSide(
                                        width: 1,
                                        color: const Color(0x14000000)))),
                            child: Row(children: <Widget>[
                              Expanded(
                                  flex: 295,
                                  child: Container(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 37,
                                                    child: Text("질문",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x99000000),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 16.0),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                  Expanded(
                                                      flex: 258,
                                                      child: Text("요양병원 질문",
                                                          style: const TextStyle(
                                                              color: const Color(
                                                                  0xe6000000),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "NotoSansCJKkr",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 16.0),
                                                          textAlign:
                                                              TextAlign.left))
                                                ])),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 86,
                                                    child: Text("2020.10.21",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x4d000000),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.0),
                                                        textAlign:
                                                            TextAlign.left)),
                                                Expanded(
                                                    flex: 14,
                                                    child: Image.asset(
                                                        "assets/icons/thumb_up_16_px.png")),
                                                Expanded(
                                                    flex: 5,
                                                    child: Container()
                                                ),Expanded(
                                                    flex: 195,
                                                    child: Text("15k",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x4d000000),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.0),
                                                        textAlign:
                                                            TextAlign.left))
                                              ],
                                            ))
                                      ]))),
                              Expanded(
                                  flex: 65,
                                  child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                        Expanded(
                                          flex: 14,
                                          child: Image.asset(
                                              "assets/icons/mode_comment_16_px.png"),
                                        ),
                                        Expanded(
                                            flex: 51,
                                            child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                                child: Text("152",
                                                    style: const TextStyle(
                                                        color: const Color(
                                                            0xe6000000),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            "NotoSansCJKkr",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.0),
                                                    textAlign: TextAlign.left)))
                                      ])))
                            ]))),
                    AspectRatio(
                        aspectRatio: 360 / 65,
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                border: Border(
                                    top: BorderSide(
                                        width: 1,
                                        color: const Color(0x14000000)))),
                            child: Row(children: <Widget>[
                              Expanded(
                                  flex: 295,
                                  child: Container(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 37,
                                                    child: Text("질문",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x99000000),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 16.0),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                  Expanded(
                                                      flex: 258,
                                                      child: Text("요양병원 질문",
                                                          style: const TextStyle(
                                                              color: const Color(
                                                                  0xe6000000),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "NotoSansCJKkr",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 16.0),
                                                          textAlign:
                                                              TextAlign.left))
                                                ])),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 86,
                                                    child: Text("2020.10.21",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x4d000000),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.0),
                                                        textAlign:
                                                            TextAlign.left)),
                                                Expanded(
                                                    flex: 14,
                                                    child: Image.asset(
                                                        "assets/icons/thumb_up_16_px.png")),
                                                Expanded(
                                                    flex: 5,
                                                    child: Container()
                                                ),Expanded(
                                                    flex: 195,
                                                    child: Text("15k",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x4d000000),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.0),
                                                        textAlign:
                                                            TextAlign.left))
                                              ],
                                            ))
                                      ]))),
                              Expanded(
                                  flex: 65,
                                  child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                        Expanded(
                                          flex: 14,
                                          child: Image.asset(
                                              "assets/icons/mode_comment_16_px.png"),
                                        ),
                                        Expanded(
                                            flex: 51,
                                            child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                                child: Text("152",
                                                    style: const TextStyle(
                                                        color: const Color(
                                                            0xe6000000),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            "NotoSansCJKkr",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.0),
                                                    textAlign: TextAlign.left)))
                                      ])))
                            ]))),
                    AspectRatio(
                        aspectRatio: 360 / 65,
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                border: Border(
                                    top: BorderSide(
                                        width: 1,
                                        color: const Color(0x14000000)))),
                            child: Row(children: <Widget>[
                              Expanded(
                                  flex: 295,
                                  child: Container(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 37,
                                                    child: Text("질문",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x99000000),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 16.0),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                  Expanded(
                                                      flex: 258,
                                                      child: Text("요양병원 질문",
                                                          style: const TextStyle(
                                                              color: const Color(
                                                                  0xe6000000),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "NotoSansCJKkr",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 16.0),
                                                          textAlign:
                                                              TextAlign.left))
                                                ])),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 86,
                                                    child: Text("2020.10.21",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x4d000000),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.0),
                                                        textAlign:
                                                            TextAlign.left)),
                                                Expanded(
                                                    flex: 14,
                                                    child: Image.asset(
                                                        "assets/icons/thumb_up_16_px.png")),
                                                Expanded(
                                                    flex: 5,
                                                    child: Container()
                                                ),Expanded(
                                                    flex: 195,
                                                    child: Text("15k",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x4d000000),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                "NotoSansCJKkr",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.0),
                                                        textAlign:
                                                            TextAlign.left))
                                              ],
                                            ))
                                      ]))),
                              Expanded(
                                  flex: 65,
                                  child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                        Expanded(
                                          flex: 14,
                                          child: Image.asset(
                                              "assets/icons/mode_comment_16_px.png"),
                                        ),
                                        Expanded(
                                            flex: 51,
                                            child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                                child: Text("152",
                                                    style: const TextStyle(
                                                        color: const Color(
                                                            0xe6000000),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            "NotoSansCJKkr",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.0),
                                                    textAlign: TextAlign.left)))
                                      ])))
                            ]))),
                    AspectRatio(
                        aspectRatio: 360 / 8,
                        child: Container(
                            decoration:
                                BoxDecoration(color: const Color(0xffffffff)))),
                  ]),
                  Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text("Page 2")),
                  Container(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text("Page 3")),
                  Container(
                      decoration: BoxDecoration(color: Colors.yellow),
                      child: Text("Page 4")),
                ]))),
        Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
            child: AspectRatio(
                aspectRatio: 360 / 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(flex: 152, child: Container()),
                      Expanded(
                          flex: 8,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xfff5df4d))))),
                      Expanded(flex: 8, child: Container()),
                      Expanded(
                          flex: 8,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff939597),
                                          width: 1))))),
                      Expanded(flex: 8, child: Container()),
                      Expanded(
                          flex: 8,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff939597),
                                          width: 1))))),
                      Expanded(flex: 8, child: Container()),
                      Expanded(
                          flex: 8,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff939597),
                                          width: 1))))),
                      Expanded(flex: 8, child: Container()),
                      Expanded(flex: 152, child: Container()),
                    ]))),
        Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: new AspectRatio(
                aspectRatio: 360 / 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(flex: 16, child: Container()),
                      Expanded(
                        flex: 304,
                        child: Text("구인구직",
                            style: const TextStyle(
                                color: const Color(0xe6000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                      ),
                      Expanded(
                        flex: 24,
                        child:
                            Image.asset("assets/icons/navigate_next_24_px.png"),
                      ),
                      Expanded(flex: 16, child: Container())
                    ]))),
        Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
            child: new AspectRatio(
                aspectRatio: 360 / 268,
                child: PageView(
                    children: [
                      Column(children: <Widget>[
                        AspectRatio(
                            aspectRatio: 360 / 65,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color: const Color(0x14000000)))),
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: <Widget>[
                                                          Expanded(
                                                              flex: 8,
                                                              child: Container()
                                                          ),
                                                          Expanded(
                                                            flex: 60,
                                                            child: AspectRatio(
                                                              aspectRatio: 60/24,
                                                                child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(16)
                                                                    ),
                                                                    color: const Color(0xfff5df4d)
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                "구인중",
                                                                    style: const TextStyle(
                                                                    color:  const Color(0x99000000),
                                                                    fontWeight: FontWeight.w400,
                                                                    fontFamily: "NotoSansCJKkr",
                                                                    fontStyle:  FontStyle.normal,
                                                                    fontSize: 12.0
                                                                ),
                                                                  textAlign: TextAlign.center
                                                                )))
                                                            )
                                                          ),
                                                          Expanded(
                                                            flex: 8,
                                                            child: Container()
                                                          ),
                                                          Expanded(
                                                              flex: 276,
                                                            child: Text(
                                                                "정홍규를 돌봐줄 요양사",
                                                                style: const TextStyle(
                                                                    color:  const Color(0xe6000000),
                                                                    fontWeight: FontWeight.w400,
                                                                    fontFamily: "NotoSansCJKkr",
                                                                    fontStyle:  FontStyle.normal,
                                                                    fontSize: 16.0
                                                                ),
                                                                textAlign: TextAlign.left
                                                            )
)
                                                        ])),
                                                Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                            flex: 8,
                                                            child: Container()
                                                        ),
                                                        Expanded(
                                                          flex: 60,
                                                          child: Text(
                                                              "사용자ID",
                                                              style: const TextStyle(
                                                                  color:  const Color(0x4d000000),
                                                                  fontWeight: FontWeight.w400,
                                                                  fontFamily: "NotoSansCJKkr",
                                                                  fontStyle:  FontStyle.normal,
                                                                  fontSize: 12.0
                                                              ),
                                                              textAlign: TextAlign.left
                                                          )
                                                        ),
                                                        Expanded(
                                                            flex: 77,
                                                            child: Text(
                                                                "2020.10.21",
                                                                style: const TextStyle(
                                                                    color:  const Color(0x4d000000),
                                                                    fontWeight: FontWeight.w400,
                                                                    fontFamily: "NotoSansCJKkr",
                                                                    fontStyle:  FontStyle.normal,
                                                                    fontSize: 12.0
                                                                ),
                                                                textAlign: TextAlign.left
                                                            )),
                                                        Expanded(
                                                            flex: 14,
                                                            child: Image.asset(
                                                                "assets/icons/thumb_up_16_px.png")),
                                                        Expanded(
                                                            flex: 5,
                                                            child: Container()
                                                        ),
                                                        Expanded(
                                                            flex: 36,
                                                            child: Text(
                                                                "15k",
                                                                style: const TextStyle(
                                                                    color:  const Color(0x4d000000),
                                                                    fontWeight: FontWeight.w400,
                                                                    fontFamily: "NotoSansCJKkr",
                                                                    fontStyle:  FontStyle.normal,
                                                                    fontSize: 12.0
                                                                ),
                                                                textAlign: TextAlign.left
                                                            )),
                                                        Expanded(
                                                            flex: 12,
                                                            child: Image.asset(
                                                                "assets/icons/mode_comment_16_px.png")),
                                                        Expanded(
                                                            flex: 5,
                                                            child: Container()
                                                        ),
                                                        Expanded(flex: 132,
                                                        child: Text(
                                                            "152",
                                                            style: const TextStyle(
                                                                color:  const Color(0x4d000000),
                                                                fontWeight: FontWeight.w400,
                                                                fontFamily: "NotoSansCJKkr",
                                                                fontStyle:  FontStyle.normal,
                                                                fontSize: 12.0
                                                            ),
                                                            textAlign: TextAlign.left
                                                        ))
                                                      ],
                                                    ))
                                              ])
                                )),
                        AspectRatio(
                            aspectRatio: 360 / 65,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color: const Color(0x14000000)))),
                                child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 8,
                                                    child: Container()
                                                ),
                                                Expanded(
                                                    flex: 60,
                                                    child: AspectRatio(
                                                        aspectRatio: 60/24,
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(
                                                                    Radius.circular(16)
                                                                ),
                                                                color: const Color(0xfff5df4d)
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                    "구인중",
                                                                    style: const TextStyle(
                                                                        color:  const Color(0x99000000),
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: "NotoSansCJKkr",
                                                                        fontStyle:  FontStyle.normal,
                                                                        fontSize: 12.0
                                                                    ),
                                                                    textAlign: TextAlign.center
                                                                )))
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 8,
                                                    child: Container()
                                                ),
                                                Expanded(
                                                    flex: 276,
                                                    child: Text(
                                                        "정홍규를 돌봐줄 요양사",
                                                        style: const TextStyle(
                                                            color:  const Color(0xe6000000),
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: "NotoSansCJKkr",
                                                            fontStyle:  FontStyle.normal,
                                                            fontSize: 16.0
                                                        ),
                                                        textAlign: TextAlign.left
                                                    )
                                                )
                                              ])),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 8,
                                                  child: Container()
                                              ),
                                              Expanded(
                                                  flex: 60,
                                                  child: Text(
                                                      "사용자ID",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 77,
                                                  child: Text(
                                                      "2020.10.21",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  )),
                                              Expanded(
                                                  flex: 14,
                                                  child: Image.asset(
                                                      "assets/icons/thumb_up_16_px.png")),
                                              Expanded(
                                                  flex: 5,
                                                  child: Container()
                                              ),
                                              Expanded(
                                                  flex: 36,
                                                  child: Text(
                                                      "15k",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  )),
                                              Expanded(
                                                  flex: 12,
                                                  child: Image.asset(
                                                      "assets/icons/mode_comment_16_px.png")),
                                              Expanded(
                                                  flex: 5,
                                                  child: Container()
                                              ),
                                              Expanded(flex: 132,
                                                  child: Text(
                                                      "152",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  ))
                                            ],
                                          ))
                                    ])
                            )),
                        AspectRatio(
                            aspectRatio: 360 / 65,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color: const Color(0x14000000)))),
                                child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 8,
                                                    child: Container()
                                                ),
                                                Expanded(
                                                    flex: 60,
                                                    child: AspectRatio(
                                                        aspectRatio: 60/24,
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(
                                                                    Radius.circular(16)
                                                                ),
                                                                color: const Color(0xfff5df4d)
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                    "구인중",
                                                                    style: const TextStyle(
                                                                        color:  const Color(0x99000000),
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: "NotoSansCJKkr",
                                                                        fontStyle:  FontStyle.normal,
                                                                        fontSize: 12.0
                                                                    ),
                                                                    textAlign: TextAlign.center
                                                                )))
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 8,
                                                    child: Container()
                                                ),
                                                Expanded(
                                                    flex: 276,
                                                    child: Text(
                                                        "정홍규를 돌봐줄 요양사",
                                                        style: const TextStyle(
                                                            color:  const Color(0xe6000000),
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: "NotoSansCJKkr",
                                                            fontStyle:  FontStyle.normal,
                                                            fontSize: 16.0
                                                        ),
                                                        textAlign: TextAlign.left
                                                    )
                                                )
                                              ])),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 8,
                                                  child: Container()
                                              ),
                                              Expanded(
                                                  flex: 60,
                                                  child: Text(
                                                      "사용자ID",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 77,
                                                  child: Text(
                                                      "2020.10.21",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  )),
                                              Expanded(
                                                  flex: 14,
                                                  child: Image.asset(
                                                      "assets/icons/thumb_up_16_px.png")),
                                              Expanded(
                                                  flex: 5,
                                                  child: Container()
                                              ),
                                              Expanded(
                                                  flex: 36,
                                                  child: Text(
                                                      "15k",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  )),
                                              Expanded(
                                                  flex: 12,
                                                  child: Image.asset(
                                                      "assets/icons/mode_comment_16_px.png")),
                                              Expanded(
                                                  flex: 5,
                                                  child: Container()
                                              ),
                                              Expanded(flex: 132,
                                                  child: Text(
                                                      "152",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  ))
                                            ],
                                          ))
                                    ])
                            )),
                        AspectRatio(
                            aspectRatio: 360 / 65,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color: const Color(0x14000000)))),
                                child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 8,
                                                    child: Container()
                                                ),
                                                Expanded(
                                                    flex: 60,
                                                    child: AspectRatio(
                                                        aspectRatio: 60/24,
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(
                                                                    Radius.circular(16)
                                                                ),
                                                                color: const Color(0xfff5df4d)
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                    "구인중",
                                                                    style: const TextStyle(
                                                                        color:  const Color(0x99000000),
                                                                        fontWeight: FontWeight.w400,
                                                                        fontFamily: "NotoSansCJKkr",
                                                                        fontStyle:  FontStyle.normal,
                                                                        fontSize: 12.0
                                                                    ),
                                                                    textAlign: TextAlign.center
                                                                )))
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 8,
                                                    child: Container()
                                                ),
                                                Expanded(
                                                    flex: 276,
                                                    child: Text(
                                                        "정홍규를 돌봐줄 요양사",
                                                        style: const TextStyle(
                                                            color:  const Color(0xe6000000),
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: "NotoSansCJKkr",
                                                            fontStyle:  FontStyle.normal,
                                                            fontSize: 16.0
                                                        ),
                                                        textAlign: TextAlign.left
                                                    )
                                                )
                                              ])),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 8,
                                                  child: Container()
                                              ),
                                              Expanded(
                                                  flex: 60,
                                                  child: Text(
                                                      "사용자ID",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 77,
                                                  child: Text(
                                                      "2020.10.21",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  )),
                                              Expanded(
                                                  flex: 14,
                                                  child: Image.asset(
                                                      "assets/icons/thumb_up_16_px.png")),
                                              Expanded(
                                                  flex: 5,
                                                  child: Container()
                                              ),
                                              Expanded(
                                                  flex: 36,
                                                  child: Text(
                                                      "15k",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  )),
                                              Expanded(
                                                  flex: 12,
                                                  child: Image.asset(
                                                      "assets/icons/mode_comment_16_px.png")),
                                              Expanded(
                                                  flex: 5,
                                                  child: Container()
                                              ),
                                              Expanded(flex: 132,
                                                  child: Text(
                                                      "152",
                                                      style: const TextStyle(
                                                          color:  const Color(0x4d000000),
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "NotoSansCJKkr",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.0
                                                      ),
                                                      textAlign: TextAlign.left
                                                  ))
                                            ],
                                          ))
                                    ])
                            )),
                        AspectRatio(
                            aspectRatio: 360 / 8,
                            child: Container(
                                decoration:
                                BoxDecoration(color: const Color(0xffffffff)))),
                      ]),
                      Container(
                          decoration: BoxDecoration(color: Colors.red),
                          child: Text("Page 2")),
                      Container(
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Text("Page 3")),
                      Container(
                          decoration: BoxDecoration(color: Colors.yellow),
                          child: Text("Page 4")),
                    ]))),
        Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
            child: AspectRatio(
                aspectRatio: 360 / 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(flex: 152, child: Container()),
                      Expanded(
                          flex: 8,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xfff5df4d))))),
                      Expanded(flex: 8, child: Container()),
                      Expanded(
                          flex: 8,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff939597),
                                          width: 1))))),
                      Expanded(flex: 8, child: Container()),
                      Expanded(
                          flex: 8,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff939597),
                                          width: 1))))),
                      Expanded(flex: 8, child: Container()),
                      Expanded(
                          flex: 8,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff939597),
                                          width: 1))))),
                      Expanded(flex: 8, child: Container()),
                      Expanded(flex: 152, child: Container()),
                    ]))),

      ],
    ));
  }
}
