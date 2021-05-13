import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkPageView.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

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

  List<Widget> _noticeCardList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(HomeCardListItem(
          width: 320.0,
          height: 120.0,
          index: i,
          onPushNavigator: onPushNavigator));
    }

    return list;
  }

  List<Widget> _popularCardList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(HomePopularCardListItem(
          width: 144.0,
          height: 106.0,
          index: i,
          onPushNavigator: onPushNavigator));
    }

    return list;
  }

  List<Widget> _yrkListView(SubPageItem subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkListView(
          itemCount: 4,
          item: _homePopularList(i, subPageItem, onPushNavigator!)));
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
          YrkListView(
            height: 120.0,
            margin: EdgeInsets.only(top: 8.0, right: 8.0),
            scrollable: true,
            scrollDirection: Axis.horizontal,
            item: _noticeCardList(),
            itemCount: 4,
          ),
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
                                  decoration: BoxDecoration(
                                      color: const Color(0x00000000)),
                                  child: YrkIconButton(
                                    icon: "assets/icons/icon_create_24_px.svg",
                                    onTap: () => onPushNavigator!(new YrkData(
                                        nextPageItem: SubPageItem.postCreate,
                                        prevPageItem: RootPageItem.home)),
                                  )),
                            )),
                        Expanded(
                            flex: 40,
                            child: TextButton(
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
                                    prevPageItem: RootPageItem.home)))),
                        Expanded(flex: 16, child: Container())
                      ]))),
          YrkPageView(
            page: _yrkListView(SubPageItem.post),
            controller: popularPageController,
            isIndicatorEnabled: true,
          ),
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
                          child: TextButton(
                              child: Text("전체보기",
                                  style: const TextStyle(
                                      color: const Color(0x99000000),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NotoSansCJKKR",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                              onPressed: () {
                                widget.onPushNavigator!(new YrkData(
                                    nextPageItem: SubPageItem.homeHistory));
                              }),
                        ),
                        Expanded(flex: 16, child: Container())
                      ]))),
          YrkListView(
            height: 200.0,
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            scrollable: true,
            scrollDirection: Axis.horizontal,
            item: _popularCardList(),
            itemCount: 4,
          ),
        ]));
  }
}
