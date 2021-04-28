import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/appbars/AppBarArrowBack.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'SearchListItem.dart';

class Search extends StatefulWidget {
  Search({Key? key, required this.data}) : super(key: key);

  final YrkData? data;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  YrkData? data;
  final TextEditingController searchController = TextEditingController();

  @override
  initState() {
    data = widget.data;
    super.initState();
  }

  List<Widget> _recentSearchItem(String searchKeyword) {
    List<Widget> list = <Widget>[];
    List<String> tempText = ["", " 요양원", " 요양시설", " 복지사"];
    for (int i = 0; i < 4; i++) {
      list.add(SearchListItem(
          width: MediaQuery.of(context).size.width,
          height: 44,
          index: i,
          searchText: searchKeyword == '' ? '' : searchKeyword + tempText[i]));
    }
    return list;
  }

  void _handleSubmission(String? value) {
    print(searchController.text);
  }

  void _handleChange(String? value) {
    List<String> testNames = <String>["조문기", "최진호", "최승규", "최민기", "정홍규", "최병옥"];
    if (testNames.contains(searchController.text)) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarArrowBack.getInstance(),
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
                  textEditingController: searchController,
                )),
          ),
          Container(
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
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: _recentSearchItem(searchController.text)),
          ),
        ]),
        bottomNavigationBar:
            BottomBarNavigation.getInstance(RootPageItem.board));
  }
}
