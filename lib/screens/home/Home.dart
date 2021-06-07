import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
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
import 'package:yoroke/screens/home/model/HomeApiResponse.dart';
import 'package:yoroke/screens/home/model/HomeBlock.dart';
import 'package:yoroke/screens/home/model/PopularFacilityBlock.dart';
import 'package:yoroke/screens/home/model/PopularPostBlock.dart';

import '../../main.dart';
import 'HomeCardListItem.dart';
import 'HomePopularCardListItem.dart';

class Home extends StatefulWidget {
  Home();

  // FIXME get reqCtx from previous screen
  final YrkRequestContext reqCtx = YrkRequestContext();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late YrkRequestContext reqCtx;
  late YrkBlock block;

  @override
  initState() {
    reqCtx = widget.reqCtx;
    initBlock();
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
    return YrkPageListItemV2(model: item);
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
    PopularPostBlock popularPostBlock =
        block.findFirstBlockWhere("PopularPostBlock") as PopularPostBlock;
    PopularFacilityBlock popularFacilityBlock = block
        .findFirstBlockWhere("PopularFacilityBlock") as PopularFacilityBlock;
    return RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
            () {
              setState(() {
                updateBlockOn("pullToRefresh");
              });
            },
          );
        },
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage()))),
            appBar: YrkAppBar(
              type: YrkAppBarType.accountCircleAll,
              curPageItem: RootPageItem.home,
            ),
            drawer: yrkDrawer,
            bottomNavigationBar:
                BottomBarNavigation.getInstance(RootPageItem.home),
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
                  title: popularPostBlock.title,
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
                page: _buildPopularPost("post", popularPostBlock),
                controller: popularPageController,
                isIndicatorEnabled: true,
              ),
              YrkTabHeaderView(
                  title: popularFacilityBlock.title,
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
                          model: popularFacilityBlock.items!.elementAt(index)
                              as HomePopularCardListItemModel,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 8.0);
                      },
                      itemCount: popularFacilityBlock.items!.length)),
            ])));
  }

  void _onHomeHistoryClicked(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeHistory(data: new YrkData())));
    });
  }

  @override
  void initBlock() {
    // TODO: use request context to make a block..
    // reqCtx.userCtx.name...

    // (example) data from API
    Map<String, dynamic> jsonResponse = TestHomeData().jsonResponse;
    // deserialize api response: from json to class
    HomeApiResponse apiResponse = HomeApiResponse.fromJson(jsonResponse);
    // make a model list
    List<YrkListItemV2Model> items = apiResponse.popularPost;
    List<HomePopularCardListItemModel> popularFacilities =
        apiResponse.popularFacility;

    HomeBlock homeBlock = HomeBlock()
      ..type = "HomeBlock"
      ..blocks = (<YrkBlock>[
        PopularPostBlock()
          ..type = "PopularPostBlock"
          ..items = items
          ..title = "인기 게시글",
        PopularFacilityBlock()
          ..type = "PopularFacilityBlock"
          ..items = popularFacilities
          ..title = "인기 의료시설",
      ]);

    this.block = homeBlock;
  }

  @override
  void updateBlockOn(String action) {
    switch (action) {
      case "pullToRefresh":
        PopularPostBlock postBlock =
            block.findFirstBlockWhere("PopularPostBlock") as PopularPostBlock;
        block.blocks!.remove(postBlock);
        postBlock
          ..title =
              "인기 게시글 " + DateTime.now().millisecondsSinceEpoch.toString();
        block.blocks!.add(postBlock);
        break;
      case "tabSwiped":
        //...
        break;
      default:
        break;
    }
  }
}
