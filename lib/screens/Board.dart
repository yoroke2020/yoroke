import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<String> temp0 = ["요양병원질문", "요양원 선택 고민", "정홍규 인성 질문", "정홍규 똥오줌 고민"];
  List<String> temp1 = ["요양원 선택 고민", "요양원 선택 고민", "요양원 선택 고민", "요양원 선택 고민"];
  List<String> temp2 = ["정홍규 인성 질문", "정홍규 인성 질문", "정홍규 인성 질문", "정홍규 인성 질문"];
  List<String> temp3 = ["정홍규 똥오줌 고민", "정홍규 똥오줌 고민", "정홍규 똥오줌 고민", "정홍규 똥오줌 고민"];
  List<int> reviewPageIndexColor = [
    0xfff5df4d,
    0xffffffff,
    0xffffffff,
    0xffffffff
  ];
  List<int> reviewPageIndexBoarderColor = [
    0xfff5df4d,
    0xff939597,
    0xff939597,
    0xff939597
  ];
  List<int> jobFindingPageIndexColor = [
    0xfff5df4d,
    0xffffffff,
    0xffffffff,
    0xffffffff
  ];
  List<int> jobFindingPageIndexBoarderColor = [
    0xfff5df4d,
    0xff939597,
    0xff939597,
    0xff939597
  ];

  Widget reviewList(List<String> item) {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < 4; i++) {
      list.add(AspectRatio(
          aspectRatio: 360 / 65,
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border: Border(
                      top: BorderSide(
                          width: 1, color: const Color(0x14000000)))),
              child: Row(children: <Widget>[
                Expanded(
                    flex: 295,
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 37,
                                      child: Text("질문",
                                          style: const TextStyle(
                                              color: const Color(0x99000000),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "NotoSansCJKkr",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.0),
                                          textAlign: TextAlign.left),
                                    ),
                                    Expanded(
                                        flex: 258,
                                        child: Text(item.elementAt(i),
                                            style: const TextStyle(
                                                color: const Color(0xe6000000),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "NotoSansCJKkr",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0),
                                            textAlign: TextAlign.left))
                                  ])),
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 86,
                                      child: Text("2020.10.21",
                                          style: const TextStyle(
                                              color: const Color(0x4d000000),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "NotoSansCJKkr",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.left)),
                                  Expanded(
                                      flex: 14,
                                      child: Image.asset(
                                          "assets/icons/thumb_up_16_px.png")),
                                  Expanded(flex: 5, child: Container()),
                                  Expanded(
                                      flex: 195,
                                      child: Text("15k",
                                          style: const TextStyle(
                                              color: const Color(0x4d000000),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "NotoSansCJKkr",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.left))
                                ],
                              ))
                        ]))),
                Expanded(
                    flex: 65,
                    child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                          Expanded(
                            flex: 14,
                            child: Image.asset(
                                "assets/icons/mode_comment_16_px.png"),
                          ),
                          Expanded(
                              flex: 51,
                              child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text("152",
                                      style: const TextStyle(
                                          color: const Color(0xe6000000),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                      textAlign: TextAlign.left)))
                        ])))
              ]))));
    }
    list.add(AspectRatio(
        aspectRatio: 360 / 8,
        child: Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)))));
    return Wrap(children: list);
  }

  Widget jobFindingList(List<String> item) {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < 4; i++) {
      list.add(
        AspectRatio(
            aspectRatio: 360 / 65,
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    border: Border(
                        top: BorderSide(
                            width: 1, color: const Color(0x14000000)))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(flex: 8, child: Container()),
                                Expanded(
                                    flex: 60,
                                    child: AspectRatio(
                                        aspectRatio: 60 / 24,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16)),
                                                color: const Color(0xfff5df4d)),
                                            child: Center(
                                                child: Text("구인중",
                                                    style: const TextStyle(
                                                        color: const Color(
                                                            0x99000000),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            "NotoSansCJKkr",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 12.0),
                                                    textAlign:
                                                        TextAlign.center))))),
                                Expanded(flex: 8, child: Container()),
                                Expanded(
                                    flex: 276,
                                    child: Text("정홍규를 돌봐줄 요양사",
                                        style: const TextStyle(
                                            color: const Color(0xe6000000),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NotoSansCJKkr",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        textAlign: TextAlign.left))
                              ])),
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Expanded(flex: 8, child: Container()),
                              Expanded(
                                  flex: 60,
                                  child: Text("사용자ID",
                                      style: const TextStyle(
                                          color: const Color(0x4d000000),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left)),
                              Expanded(
                                  flex: 77,
                                  child: Text("2020.10.21",
                                      style: const TextStyle(
                                          color: const Color(0x4d000000),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left)),
                              Expanded(
                                  flex: 14,
                                  child: Image.asset(
                                      "assets/icons/thumb_up_16_px.png")),
                              Expanded(flex: 5, child: Container()),
                              Expanded(
                                  flex: 36,
                                  child: Text("15k",
                                      style: const TextStyle(
                                          color: const Color(0x4d000000),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left)),
                              Expanded(
                                  flex: 12,
                                  child: Image.asset(
                                      "assets/icons/mode_comment_16_px.png")),
                              Expanded(flex: 5, child: Container()),
                              Expanded(
                                  flex: 132,
                                  child: Text("152",
                                      style: const TextStyle(
                                          color: const Color(0x4d000000),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left))
                            ],
                          ))
                    ]))),
      );
    }
    list.add(AspectRatio(
        aspectRatio: 360 / 8,
        child: Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)))));
    return Wrap(children: list);
  }

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
                child: PageView(
                  children: [
                    Column(children: <Widget>[
                      reviewList(temp0),
                    ]),
                    Column(children: <Widget>[
                      reviewList(temp1),
                    ]),
                    Column(children: <Widget>[
                      reviewList(temp2),
                    ]),
                    Column(children: <Widget>[
                      reviewList(temp3),
                    ]),
                  ],
                  onPageChanged: _onReviewPageChanged,
                ))),
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
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: Color(
                                          reviewPageIndexColor.elementAt(0)),
                                      border: Border.all(
                                          color: Color(
                                              reviewPageIndexBoarderColor
                                                  .elementAt(0)),
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
                                      color: Color(
                                          reviewPageIndexColor.elementAt(1)),
                                      border: Border.all(
                                          color: Color(
                                              reviewPageIndexBoarderColor
                                                  .elementAt(1)),
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
                                      color: Color(
                                          reviewPageIndexColor.elementAt(2)),
                                      border: Border.all(
                                          color: Color(
                                              reviewPageIndexBoarderColor
                                                  .elementAt(2)),
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
                                      color: Color(
                                          reviewPageIndexColor.elementAt(3)),
                                      border: Border.all(
                                          color: Color(
                                              reviewPageIndexBoarderColor
                                                  .elementAt(3)),
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
                child: PageView(children: [
                  Column(children: <Widget>[
                    jobFindingList(null),
                  ]),
                  Column(children: <Widget>[
                    jobFindingList(null),
                  ]),
                  Column(children: <Widget>[
                    jobFindingList(null),
                  ]),
                  Column(children: <Widget>[
                    jobFindingList(null),
                  ]),
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

  void _onReviewPageChanged(int pageNum) {
    switch (pageNum) {
      case 0:
        reviewPageIndexColor = [0xfff5df4d, 0xffffffff, 0xffffffff, 0xffffffff];
        reviewPageIndexBoarderColor = [
          0xfff5df4d,
          0xff939597,
          0xff939597,
          0xff939597
        ];
        break;
      case 1:
        reviewPageIndexColor = [0xffffffff, 0xfff5df4d, 0xffffffff, 0xffffffff];
        reviewPageIndexBoarderColor = [
          0xff939597,
          0xfff5df4d,
          0xff939597,
          0xff939597
        ];
        break;
      case 2:
        reviewPageIndexColor = [0xffffffff, 0xffffffff, 0xfff5df4d, 0xffffffff];
        reviewPageIndexBoarderColor = [
          0xff939597,
          0xff939597,
          0xfff5df4d,
          0xff939597
        ];
        break;
      case 3:
        reviewPageIndexColor = [0xffffffff, 0xffffffff, 0xffffffff, 0xfff5df4d];
        reviewPageIndexBoarderColor = [
          0xff939597,
          0xff939597,
          0xff939597,
          0xfff5df4d
        ];
        break;
      default:
        break;
    }
  }
}
