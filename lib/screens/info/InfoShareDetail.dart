import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

import 'InfoShareCardListItem.dart';

class InfoShareDetail extends StatefulWidget {
  InfoShareDetail({required this.data, required this.onPushNavigator});

  final YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _InfoShareDetailState createState() => _InfoShareDetailState();
}

class _InfoShareDetailState extends State<InfoShareDetail> {
  List<String> titleList = [
    "요양병원 후기/리뷰",
    "요양원 후기/리뷰",
    "복지관 후기/리뷰",
    "간병인 후기/리뷰"
  ];

  List<String> date = [
    "2020.04.21",
  ];

  bool isScrolled = false;

  late QuillController _quillController;

  @override
  void initState() {
    super.initState();
    _loadFromAssets();
  }

  Future<void> _loadFromAssets() async {
    final doc = Document();
    setState(() {
      _quillController = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  Widget build(BuildContext context) {
    return CustomScrollView(controller: ScrollController(), slivers: <Widget>[
      SliverAppBar(
          automaticallyImplyLeading: false,
          snap: false,
          pinned: true,
          floating: false,
          centerTitle: false,
          titleSpacing: 0.0,
          shadowColor: const Color(0xffffffff),
          elevation: 0.0,
          toolbarHeight: 48.0,
          expandedHeight: 460.0,
          backgroundColor: const Color(0xffffffff),
          title: YrkAppBar(type: YrkAppBarType.arrowBackOnly),
          flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  height: 460.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(testInfoShareImage.elementAt(0)),
                          fit: BoxFit.cover)),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 4.0),
                                child: new YrkButton(
                                    buttonType: ButtonType.chip,
                                    clickable: true,
                                    onPressed: () {},
                                    label: "복지시설",
                                    width: 88.0,
                                    height: 24.0)),
                            Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text("조문기 요양병원",
                                    style: YrkTextStyle(
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32.0))),
                            Text("20.10.22",
                                style: YrkTextStyle(
                                    color: const Color(0xffffffff)))
                          ]))))),
      SliverToBoxAdapter(
          child: Container(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16, top: 56.0, bottom: 8.0),
              child: QuillEditor(
                  focusNode: FocusNode(),
                  scrollable: true,
                  readOnly: true,
                  autoFocus: false,
                  expands: false,
                  showCursor: false,
                  scrollController: ScrollController(),
                  padding: EdgeInsets.all(0),
                  controller: _quillController))),
      SliverToBoxAdapter(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Text("연관정보",
                  style: YrkTextStyle(
                      height: 1.5, fontSize: 18.0, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left))),
      SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 1),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Material(
                    child: InfoShareCardListItem(
                        width: 158.0,
                        height: 158.0,
                        index: index,
                        onPushNavigator: widget.onPushNavigator));
              }, childCount: 6)))
    ]);
  }
}
