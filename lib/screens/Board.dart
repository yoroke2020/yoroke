import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/tools/YorokeCardView.dart';
import 'package:helloflutter/tools/YorokeTitleBar.dart';
import 'package:helloflutter/tools/YorokePageView.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<String> reviewCardImageList = [
    "assets/icons/card_sample_image.png",
    "assets/icons/card_sample_image.png",
    "assets/icons/card_sample_image.png",
    "assets/icons/card_sample_image.png"
  ];
  List<String> reviewCardNameList = ["요양병원", "요양원", "복지관", "간병인"];

  List<String> qnaStringExamples = [
    "요양병원질문",
    "요양원 선택 고민",
    "정홍규 인성 질문",
    "정홍규 똥오줌 고민"
  ];
  List<String> findJobStringExamples = [
    "정홍규를 돌봐줄 요양사",
    "조문기의 요양병원",
    "용양병원 질문",
    "요양원 선택 고민"
  ];

  final _qnaPageController = PageController();
  final _findJobPageController = PageController();

  List<Widget> buildReviewPageList(List<String> item) {
    List<Widget> pages = List<Widget>();
    for (var i = 0; i < 4; i++) {
      List<Widget> list = List<Widget>();
      for (var j = 0; j < 4; j++) {
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
                                                  color:
                                                      const Color(0xe6000000),
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
      pages.add(Wrap(children: list));
    }
    return pages;
  }

  List<Widget> buildFindJobPageList(List<String> item) {
    List<Widget> page = List<Widget>();
    for (var i = 0; i < 4; i++) {
      List<Widget> list = List<Widget>();
      for (var j = 0; j < 4; j++) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(flex: 8, child: Container()),
                                  Expanded(
                                      flex: 60,
                                      child: AspectRatio(
                                          aspectRatio: 60 / 24,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16)),
                                                  color:
                                                      const Color(0xfff5df4d)),
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
      page.add(Wrap(children: list));
    }
    return page;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> qnaPageList = buildReviewPageList(qnaStringExamples);
    List<Widget> jobFindingPageList =
        buildFindJobPageList(findJobStringExamples);

    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      children: <Widget>[
        YorokeTitleBar(titleName: "후기"),
        YorokeCardView(
            boxRatio: 360 / 120,
            cardRatio: 136 / 120,
            cardImageList: reviewCardImageList,
            cardNameList: reviewCardNameList),
        YorokeTitleBar(titleName: "고민/질문"),
        YorokePageView(page: qnaPageList, controller: _qnaPageController, isIndicatorEnabled: true),
        YorokeTitleBar(titleName: "구인구직"),
        YorokePageView(
            page: jobFindingPageList, controller: _findJobPageController, isIndicatorEnabled: true)
      ],
    ));
  }
}
