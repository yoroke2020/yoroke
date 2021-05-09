import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkPageListItem.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/mbs/YrkModelBottomSheet.dart';
import 'package:yoroke/screens/info/InfoShareCardListItem.dart';

import 'SearchRecentKeywordListItem.dart';

class Search extends StatefulWidget {
  Search({Key? key, required this.data, this.onPushNavigator})
      : super(key: key);

  final YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  YrkData? data;
  ValueChanged<YrkData>? onPushNavigator;
  late TextEditingController searchTextController;
  String? searchKeyword;
  final List<String> labelList = ["요양병원", "요양원", "복지관", "경로당", "노인교실", "보호센터"];
  final List<String> categoryList = [
    "전체 게시판",
    "고민/질문 게시판",
    "구인구직 게시판",
    "시설찾기",
    "정보공유"
  ];
  int selectedCategoryIndex = 0;
  final List<String> filterList = ["제목+내용", "제목", "작성자"];
  int selectedFilterIndex = 0;
  final List<String> sortList = ["정확도순", "최신순"];
  int selectedSortIndex = 0;

  void _setState(String selectedKeyword) {
    setState(() {
      this.searchKeyword = selectedKeyword;
      this.searchTextController = TextEditingController(text: selectedKeyword);
    });
  }

  @override
  initState() {
    data = widget.data;
    onPushNavigator = widget.onPushNavigator;
    searchTextController = TextEditingController();
    super.initState();
  }

  List<Widget> _recentSearchItem(String inputText) {
    List<Widget> list = <Widget>[];
    List<String> testNames = <String>["조문기", "최진호", "최승규", "최민기", "정홍규", "최병옥"];
    List<String> tempText = ["", " 요양원", " 요양시설", " 복지사"];
    if (!testNames.contains(inputText)) {
      inputText = '';
    }
    for (int i = 0; i < 4; i++) {
      list.add(SearchRecentKeywordListItem(
          width: MediaQuery.of(context).size.width,
          height: 44,
          index: i,
          inputText: inputText == '' ? '' : inputText + tempText[i],
          callback: _setState));
    }
    return list;
  }

  void _handleSubmission(String? value) {
    this.searchKeyword = searchTextController.text;
    setState(() {});
  }

  void _handleChange(String? value) {
    this.searchKeyword = null;
    setState(() {});
  }

  List<Widget> _buildSearchBody() {
    List<Widget> widgetList = <Widget>[];
    if (this.searchKeyword?.isEmpty ?? true) {
      // searching...
      if (searchTextController.text == '') {
        widgetList.add(new Container(
          width: 360,
          height: 40,
          decoration: BoxDecoration(color: const Color(0xffffffff)),
          child: Container(
              height: 20,
              margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
              child: Text("최근 검색어",
                  style: const TextStyle(
                      color: const Color(0xe6000000),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansCJKKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.left)),
        ));
      }
      widgetList.add(new Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: _recentSearchItem(searchTextController.text)),
      ));
      return widgetList;
    } else {
      // search result
      // [0] select category
      widgetList.add(InkWell(
          onTap: () => showYrkModalBottomSheet(
              context: context,
              type: YrkModelBottomSheetType.search,
              labelList: categoryList,
              listHeight: 284.0,
              onTap: (index) {
                Navigator.of(context).pop();
                _handleCategorySelection(index);
              }),
          child: Container(
              height: 48,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: const Color(0xffe5e5e5))),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(categoryList[selectedCategoryIndex],
                          style: const YrkTextStyle(),
                          textAlign: TextAlign.left),
                      Spacer(),
                      SvgPicture.asset(
                        "assets/icons/icon_arrow_down_24_px.svg",
                        width: 24.0,
                        height: 24.0,
                      )
                    ],
                  )))));
      // [1] short border
      widgetList.add(Container(
          width: double.infinity,
          height: 1,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffe5e5e5), width: 1),
              color: const Color(0xffffffff))));
      // [2] select filter
      widgetList.add(Container(
          height: 32.0,
          margin:
              EdgeInsets.only(top: 12.0, bottom: 4.0, left: 16.0, right: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              color: const Color(0xfff4f4f4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[..._buildFilterButtons()],
          )));
      // [3] select sort
      widgetList.add(Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: const Color(0xffe5e5e5))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: 10.0, bottom: 18.0, left: 16.0, right: 4.0),
                child: Text("검색 결과",
                    style: const TextStyle(
                        color: const Color(0x4d000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left)),
            Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 16.0, right: 2.0),
                child: Text("120",
                    style: const TextStyle(
                        color: const Color(0x4d000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left)),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 18.0),
              child: Text("건",
                  style: const TextStyle(
                      color: const Color(0x4d000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.left),
            ),
            Spacer(),
            Container(
                width: 148,
                height: 24,
                margin: EdgeInsets.only(top: 8.0, right: 16.0, bottom: 16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    color: const Color(0xfff4f4f4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[..._buildSortButtons()],
                ))
          ],
        ),
      ));
      // [4] search result
      widgetList.addAll(_buildSearchResults());
      return widgetList;
    }
  }

  List<Widget> _buildBoardYrkListView(SubPageItem subPageItem) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkListView(
          itemCount: 4, item: _buildList(i, subPageItem, onPushNavigator!)));
    }
    return list;
  }

  List<Widget> _buildList(int pageIndex, SubPageItem subPageItem,
      ValueChanged<YrkData> onPushNavigator) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(YrkPageListItem(
        pageIndex: pageIndex,
        listIndex: i,
        onPushNavigator: onPushNavigator,
        subPageItem: subPageItem,
      ));
    }
    return list;
  }

  List<Widget> _buildSearchResults() {
    if (this.selectedCategoryIndex == 0) {
      return [
        ..._buildBoardYrkListView(SubPageItem.boardJobFinding),
        ..._buildBoardYrkListView(SubPageItem.boardQna)
      ];
    } else if (this.selectedCategoryIndex == 1) {
      return _buildBoardYrkListView(SubPageItem.boardQna);
    } else if (this.selectedCategoryIndex == 2) {
      return _buildBoardYrkListView(SubPageItem.boardJobFinding);
    } else if (this.selectedCategoryIndex == 3) {
      return <Widget>[];
    } else {
      return _buildInfoShareCards();
    }
  }

  List<Widget> _buildInfoShareCards() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 8; i++) {
      list.add(InfoShareCardListItem(
        width: MediaQuery.of(context).size.width - 32 - 16,
        height: 104,
        index: i,
        onPushNavigator: onPushNavigator,
      ));
    }
    return list;
  }

  List<Widget> _buildSortButtons() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < this.sortList.length; i++) {
      if (i == this.selectedSortIndex) {
        list.add(_getColoredSortButton(this.sortList[i]));
      } else {
        list.add(_getDefaultSortButton(this.sortList[i]));
      }
      if (i != this.sortList.length - 1) {
        list.add(Spacer());
      }
    }
    return list;
  }

  void _handleSortSelection(String title) {
    this.selectedSortIndex = this.sortList.indexOf(title);
    setState(() {});
  }

  Widget _getDefaultSortButton(String title) {
    return InkWell(
        onTap: () => _handleSortSelection(title),
        child: Container(
          width: 72.0,
          alignment: Alignment.center,
          child: Text(title,
              style: const TextStyle(
                  color: const Color(0xe6000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKKR",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left),
        ));
  }

  Widget _getColoredSortButton(String title) {
    return Container(
      width: 72.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          color: const Color(0xfff5df4d)),
      alignment: Alignment.center,
      child: Text(title,
          style: const TextStyle(
              color: const Color(0xe6000000),
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansCJKKR",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: TextAlign.left),
    );
  }

  List<Widget> _buildFilterButtons() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < this.filterList.length; i++) {
      if (i == this.selectedFilterIndex) {
        list.add(_getColoredFilterButton(this.filterList[i]));
      } else {
        list.add(_getDefaultFilterButton(this.filterList[i]));
      }
      if (i != this.filterList.length - 1) {
        list.add(Spacer());
      }
    }
    return list;
  }

  void _handleFilterSelection(String title) {
    this.selectedFilterIndex = this.filterList.indexOf(title);
    setState(() {});
  }

  Widget _getDefaultFilterButton(String title) {
    return InkWell(
        onTap: () => _handleFilterSelection(title),
        child: Container(
          width: 104.0,
          alignment: Alignment.center,
          child: Text(title,
              style: const TextStyle(
                  color: const Color(0xff939597),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKKR",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left),
        ));
  }

  Widget _getColoredFilterButton(String title) {
    return Container(
      width: 104.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          color: const Color(0xfff5df4d)),
      alignment: Alignment.center,
      child: Text(title,
          style: const TextStyle(
              color: const Color(0xe6000000),
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansCJKKR",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: TextAlign.center),
    );
  }

  void _handleCategorySelection(int index) {
    this.selectedCategoryIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YrkAppBar(
          type: YrkAppBarType.arrowBackOnly,
        ),
        body: ListView(children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 64,
              decoration: BoxDecoration(color: const Color(0xffffffff)),
              child: Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 8, bottom: 8),
                  child: YrkTextField(
                    textFieldType: TextFieldType.search,
                    fillColor: const Color(0xfff8f8f8),
                    borderColor: const Color(0xfff8f8f8),
                    textInputAction: TextInputAction.search,
                    handleSubmission: _handleSubmission,
                    handleChange: _handleChange,
                    controller: searchTextController,
                  ))),
          ..._buildSearchBody(),
        ]),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
    // result of search page
  }
}
