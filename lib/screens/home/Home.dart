import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkListItem.dart';
import 'package:yoroke/screens/common/YrkPage.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/home/HomeHistory.dart';

import 'HomeCardListItem.dart';
import 'HomePopularCardListItem.dart';

class Home extends StatefulWidget {
  Home({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ValueChanged<YrkData>? onPushNavigator;

  @override
  initState() {
    onPushNavigator = widget.onPushNavigator;
    super.initState();
  }

  List<Widget> _yrkListView(SubPageItem subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(ListView(
          children: _homePopularList(i, subPageItem, onPushNavigator!)));
    }
    return list;
  }

  List<Widget> _homePopularList(int pageIndex, SubPageItem subPageItem,
      ValueChanged<YrkData> onPushNavigator) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        onPushNavigator: onPushNavigator,
        pageType: subPageItem,
        nextPageItem: SubPageItem.post,
      ));
    }
    return list;
  }

  List<String> reviewCardImageList = [
    "assets/images/sample_image.png",
    "assets/images/sample_image.png",
    "assets/images/sample_image.png",
    "assets/images/sample_image.png"
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
  final popularPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YrkAppBar(
          type: YrkAppBarType.accountCircleAll,
          onPushNavigator: widget.onPushNavigator,
          curPageItem: RootPageItem.home,
        ),
        drawer: YrkDrawer(
          onPushNavigator: widget.onPushNavigator,
          context: context,
        ),
        body: ListView(children: <Widget>[
          Container(
              height: 120.0,
              alignment: Alignment.centerLeft,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return HomeCardListItem(
                        width: 320.0,
                        height: 120.0,
                        index: index,
                        onPushNavigator: onPushNavigator);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 8.0);
                  },
                  itemCount: 4)),
          YrkTabHeaderView(
              title: "인기 게시글",
              titleStyle: YrkTextStyle(
                  color: const Color(0xe6000000),
                  fontWeight: FontWeight.w700,
                  fontFamily: "NotoSansCJKKR",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              clickable: true,
              onPushNavigator: onPushNavigator,
              nextSubPageItem: SubPageItem.boardQna,
              customIcon: Row(
                children: [
                  YrkIconButton(
                    icon: "assets/icons/icon_create.svg",
                    onTap: () => onPushNavigator!(new YrkData(
                        nextPageItem: SubPageItem.postCreate,
                        prevPageItem: RootPageItem.home)),
                  ),
                  TextButton(
                      child: Text("글 작성",
                          style: const TextStyle(
                              color: const Color(0x99000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansCJKKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                      onPressed: () => onPushNavigator!(new YrkData(
                          nextPageItem: SubPageItem.postCreate,
                          prevPageItem: RootPageItem.home)))
                ],
              )),
          YrkPage(
            page: _yrkListView(SubPageItem.post),
            controller: popularPageController,
            isIndicatorEnabled: true,
          ),
          YrkTabHeaderView(
              title: "인기 의료시설",
              titleStyle: YrkTextStyle(
                  color: const Color(0xe6000000),
                  fontWeight: FontWeight.w700,
                  fontFamily: "NotoSansCJKKR",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              clickable: true,
              onPushNavigator: onPushNavigator,
              nextSubPageItem: SubPageItem.boardQna,
              customIcon: TextButton(
                  child: Text("전체보기",
                      style: const TextStyle(
                          color: const Color(0x99000000),
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansCJKKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left),
                  onPressed: () => _onHomeHistoryClicked(context))),
          Container(
              height: 200.0,
              alignment: Alignment.centerLeft,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return HomePopularCardListItem(
                        width: 144.0,
                        height: 106.0,
                        index: index,
                        onPushNavigator: onPushNavigator);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 8.0);
                  },
                  itemCount: 4)),
        ]));
  }

  void _onHomeHistoryClicked(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeHistory(data: new YrkData())));
    });
  }
}
