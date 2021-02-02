import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/views/Board/BoardQnaList.dart';
import 'package:yoroke/views/Board/BoardJobFindingList.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/components/YrkCardView.dart';
import 'package:yoroke/views/components/YrkWidgetHeaderView.dart';
import 'package:yoroke/views/components/YrkPageView.dart';

class Board extends StatefulWidget {
  Board({@required this.onPushNavigator});

  final ValueChanged<YrkData> onPushNavigator;

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<String> reviewCardImageList = [
    "assets/icons/sample_image.png",
    "assets/icons/sample_image.png",
    "assets/icons/sample_image.png",
    "assets/icons/sample_image.png"
  ];
  List<String> reviewCardNameList = ["요양병원", "요양원", "복지관", "간병인"];

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
  List<String> findJobStringExamples = [
    "정홍규를 돌봐줄 요양사",
    "조문기의 요양병원",
    "용양병원 질문",
    "요양원 선택 고민",
    "정홍규를 돌봐줄 요양사",
    "조문기의 요양병원",
    "용양병원 질문",
    "요양원 선택 고민",
    "정홍규를 돌봐줄 요양사",
    "조문기의 요양병원",
    "용양병원 질문",
    "요양원 선택 고민",
    "정홍규를 돌봐줄 요양사",
    "조문기의 요양병원",
    "용양병원 질문",
    "요양원 선택 고민"
  ];

  final qnaPageController = PageController();
  final findJobPageController = PageController();

  final int qnaListPageCount = 4;
  final int findJobListPageCount = 4;
  final int qnaListItemCount = 4;
  final int findJobListItemCount = 4;
  final double qnaPageRatio = 360 / 260;
  final double findJobPageRatio = 360 / 260;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      children: <Widget>[
        YrkWidgetHeaderView(titleName: "후기"),
        YrkCardView(
          viewRatio: 360 / 120,
          cardRatio: 136 / 120,
          cardImageList: reviewCardImageList,
          cardNameList: reviewCardNameList,
          onPushNavigator: widget.onPushNavigator,
          onTapPageIndex: 1,
        ),
        YrkWidgetHeaderView(titleName: "고민/질문"),
        YrkPageView(
          page: BoardQnaList(
            items: qnaStringExamples,
            widgetRatio: qnaPageRatio * qnaListItemCount,
            listLength: qnaListPageCount,
            itemLength: qnaListItemCount,
            onPushNavigator: widget.onPushNavigator,
          ).getWidgetList(),
          controller: qnaPageController,
          viewRatio: qnaPageRatio,
          isIndicatorEnabled: true,
        ),
        YrkWidgetHeaderView(titleName: "구인구직"),
        YrkPageView(
            page: BoardJobFindingList(
              items: findJobStringExamples,
              widgetRatio: findJobPageRatio * findJobListItemCount,
              listLength: 4,
              itemLength: 4,
              onPushNavigator: widget.onPushNavigator,
            ).getWidgetList(),
            controller: findJobPageController,
            viewRatio: 360 / 260,
            isIndicatorEnabled: true)
      ],
    ));
  }
}
