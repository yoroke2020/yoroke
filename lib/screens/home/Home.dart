import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/TestPage.dart';
import 'package:yoroke/screens/common/YrkListItem.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/YrkPage.dart';
import 'package:yoroke/screens/common/YrkTabHeaderView.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/home/HomeHistory.dart';
import 'package:yoroke/screens/home/model/HomeBlock.dart';
import 'package:yoroke/screens/home/model/PopularPostApiResponse.dart';
import 'package:yoroke/screens/home/model/PopularPostBlock.dart';

import '../../main.dart';
import 'HomeCardListItem.dart';
import 'HomePopularCardListItem.dart';

class Home extends StatefulWidget implements Screen<HomeBlock> {
  Home();

  // FIXME get reqCtx from previous screen
  final YrkRequestContext reqCtx = YrkRequestContext();

  @override
  _HomeState createState() => _HomeState();

  @override
  HomeBlock makeBlock(reqCtx) {
    // TODO use request context to make block..
    // reqCtx.userCtx.name...

    HomeBlock homeBlock = HomeBlock();
    homeBlock.blocks = <YrkBlock>[];
    PopularPostBlock popularPostBlock = PopularPostBlock();

    // (example) data from API
    Map<String, dynamic> jsonResponse = TestPopularPostData().jsonResponse;
    // deserialize api response: from json to class
    PopularPostApiResponse apiResponse =
        PopularPostApiResponse.fromJson(jsonResponse);
    // make a model list
    List<YrkListItemV2Model> items = apiResponse.popularPost;
    // make a widget block
    popularPostBlock.items = items;
    popularPostBlock.title = "인기 게시글";
    // make a top block
    homeBlock.blocks!.add(popularPostBlock);

    return homeBlock;
  }

  @override
  HomeBlock get block => this.block;
}

class _HomeState extends State<Home> {
  HomeBlock? homeBlock;

  @override
  initState() {
    homeBlock = widget.makeBlock(widget.reqCtx);
    super.initState();
  }

  List<Widget> _yrkListView(subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(ListView(children: _homePopularList(i, subPageItem)));
    }
    return list;
  }

  List<Widget> _buildPopularPost(subPageItem, PopularPostBlock block) {
    final int pageItemLimit = 4;

    List<YrkModel> items = block.items!;
    List<Widget> pageListItems = items
        .cast<YrkListItemV2Model>()
        .map((e) => _buildPageListItem(subPageItem, e))
        .toList();

    return partition(pageListItems, pageItemLimit)
        .map((list) => ListView(children: [...list]))
        .toList();
  }

  Widget _buildPageListItem(subPageItem, YrkListItemV2Model item) {
    return YrkPageListItemV2(
      pageType: subPageItem,
      nextPageItem: "post",
      model: item,
    );
  }

  List<Widget> _homePopularList(int pageIndex, subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        pageType: subPageItem,
        nextPageItem: "post",
      ));
    }
    return list;
  }

  List<Widget> _homePopularListV2(int pageIndex, subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        pageType: subPageItem,
        nextPageItem: "post",
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
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => TestPage()))),
        appBar: YrkAppBar(
          type: YrkAppBarType.accountCircleAll,
          curPageItem: RootPageItem.home,
        ),
        drawer: yrkDrawer,
        bottomNavigationBar: BottomBarNavigation.getInstance(RootPageItem.home),
        body: ListView(children: <Widget>[
          Container(
              height: 120.0,
              alignment: Alignment.centerLeft,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return HomeCardListItem(
                        width: 320.0, height: 120.0, index: index);
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
              nextSubPageItem: "boardQna",
              customIcon: Row(
                children: [
                  YrkIconButton(
                    icon: "icon_create.svg",
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
                    onPressed: null,
                  )
                ],
              )),
          // YrkPage(
          //   page: _yrkListView(SubPageItem.post),
          //   controller: popularPageController,
          //   isIndicatorEnabled: true,
          // ),
          YrkPage(
            page: _buildPopularPost(
                "post",
                homeBlock!.findFirstBlockWhere('PopularPostBlock')
                    as PopularPostBlock),
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
              nextSubPageItem: "boardQna",
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
                    );
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
