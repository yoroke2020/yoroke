import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';

class Home extends StatefulWidget {
  Home({@required this.onPushNavigator});

  final ValueChanged<YrkData> onPushNavigator;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> reviewCardImageList = [
    "assets/icons/sample_image.png",
    "assets/icons/sample_image.png",
    "assets/icons/sample_image.png",
    "assets/icons/sample_image.png"
  ];
  List<String> reviewCardNameList = [
    "조문기의 요양병원",
    "조문기의 요양원",
    "조문기의 복지관",
    "조문기의 간병인"
  ];
  List<String> reviewCardDescList = [
    "지금 이용하실수 있는 혜택 3가지",
    "지금 이용하실수 있는 혜택 3가지",
    "지금 이용하실수 있는 혜택 3가지",
    "지금 이용하실수 있는 혜택 3가지"
  ];

  List<String> qnaStringExamples = [
    "요양병원질문",
    "요양원 선택 고민",
    "정홍규 인성 질문",
    "정홍규 똥오줌 고민",
    "요양병원질문",
    "요양원 선택 고민",
    "정홍규 인성 질문",
    "정홍규 똥오줌 고민",
    "요양병원질문",
    "요양원 선택 고민",
    "정홍규 인성 질문",
    "정홍규 똥오줌 고민",
    "요양병원질문",
    "요양원 선택 고민",
    "정홍규 인성 질문",
    "정홍규 똥오줌 고민",
  ];

  final int qnaListPageCount = 4;
  final int qnaListItemCount = 4;
  final double qnaPageRatio = 360 / 260;
  final qnaPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      // YrkCardView(
      //   viewHeight: 120,
      //   cardWidth: 320,
      //   cardHeight: 120,
      //   cardImageList: reviewCardImageList,
      //   cardNameList: reviewCardNameList,
      //   cardDescList: reviewCardDescList,
      //   onPushNavigator: widget.onPushNavigator,
      //   onTapPageIndex: SubItem.boardReview.index,
      //   textType: TextType.title_desc,
      // ),
      Container(
          decoration: BoxDecoration(color: const Color(0xffffffff)),
          child: new AspectRatio(
              aspectRatio: 360 / 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(flex: 16, child: Container()),
                    Expanded(
                      flex: 272,
                      child: Text("인기 게시글",
                          style: const TextStyle(
                              color: const Color(0xe6000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                    Expanded(
                      flex: 16,
                      child: Container(
                          width: 16,
                          height: 16,
                          decoration:
                              BoxDecoration(color: const Color(0x00000000)),
                          child: Container(
                            width: 10.0029296875,
                            height: 10,
                            decoration:
                                BoxDecoration(color: const Color(0x00000000)),
                            child: Image.asset(
                                "assets/icons/icon_create_24_px.png"),
                          )),
                    ),
                    Expanded(
                        flex: 40,
                        child: Text("글 작성",
                            style: const TextStyle(
                                color: const Color(0x99000000),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansCJKKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left)),
                    Expanded(flex: 16, child: Container())
                  ]))),
      // YrkPageView(
      //   page: BoardQnaList(
      //     items: qnaStringExamples,
      //     widgetRatio: qnaPageRatio * qnaListItemCount,
      //     listLength: qnaListPageCount,
      //     itemLength: qnaListItemCount,
      //     onPushNavigator: widget.onPushNavigator,
      //   ).getWidgetList(),
      //   controller: qnaPageController,
      //   viewRatio: qnaPageRatio,
      //   isIndicatorEnabled: true,
      // ),
      Container(
          decoration: BoxDecoration(color: const Color(0xffffffff)),
          child: new AspectRatio(
              aspectRatio: 360 / 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(flex: 16, child: Container()),
                    Expanded(
                      flex: 277,
                      child: Text("인기 의료시설",
                          style: const TextStyle(
                              color: const Color(0xe6000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                    Expanded(
                        flex: 51,
                        child: Text("전체보기",
                            style: const TextStyle(
                                color: const Color(0x99000000),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansCJKKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left)),
                    Expanded(flex: 16, child: Container())
                  ]))),
      Container(
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        width: double.maxFinite,
        height: 200,
        child: new AspectRatio(
          aspectRatio: 360 / 40,
          child: new Container(
              width: double.maxFinite,
              height: 106,
              child: Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    physics: new AlwaysScrollableScrollPhysics(),
                    itemCount: reviewCardImageList.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                        width: 144,
                                        height: 106,
                                        child: Stack(children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16)),
                                              image: new DecorationImage(
                                                image: new AssetImage(
                                                    reviewCardImageList
                                                        .elementAt(index)),
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
                    },
                  ))),
        ),
      )
    ]));
  }
}
