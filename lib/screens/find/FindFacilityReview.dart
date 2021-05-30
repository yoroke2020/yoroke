import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/YrkSelectFilter.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/controllers/YrkSelectFilterController.dart';
import 'package:yoroke/screens/find/FindFacilityReviewPostCreate.dart';

import 'FindFacilityReviewComment.dart';

class FindFacilityReview extends StatefulWidget {
  FindFacilityReview();

  @override
  _FindFacilityReviewState createState() => _FindFacilityReviewState();
}

class _FindFacilityReviewState extends State<FindFacilityReview> {
  final YrkSelectFilterController controller =
      YrkSelectFilterController(length: 3);

  late int _reviewCount = 10;

  List<String> _commentExamples = [
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "감사합니다",
    "안녕하세요",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "감사합니다",
    "안녕하세요",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "감사합니다",
    "안녕하세요",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "감사합니다",
    "안녕하세요",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
    "요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기 요양병원 후기",
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.indexIsChanging) {
        print("index = " + controller.index.toString());
      }
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {
      if (controller.indexIsChanging) {
        print("index = " + controller.index.toString());
      }
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(builder: (BuildContext context) {
        return NotificationListener<ScrollNotification>(
            onNotification: (notification) =>
                _onScrollNotification(notification),
            child: CustomScrollView(slivers: <Widget>[
              SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              SliverToBoxAdapter(
                  child: Container(
                      width: double.maxFinite,
                      height: 120.0,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: const Color(0xffe5e5e5), width: 8))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("최근 리뷰",
                                    style: const YrkTextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.0)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.0, right: 2.0),
                                    child: Text("$_reviewCount",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "OpenSans",
                                            fontSize: 20.0))),
                                Text("개",
                                    style: const YrkTextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.0)),
                                Spacer(),
                                YrkButton(
                                    buttonType: ButtonType.solid,
                                    label: "리뷰쓰기",
                                    width: 72.0,
                                    height: 24.0,
                                    onPressed: () => _onPressedPostCreate())
                              ],
                            ),
                            YrkSelectFilter(
                                width: MediaQuery.of(context).size.width - 32.0,
                                controller: controller,
                                margin: EdgeInsets.only(top: 17.0),
                                filterList: ["최신순", "별점높은순", "별점낮은순"],
                                selectedColor: const Color(0xffffffff),
                                selectedBorderColor: const Color(0xfff5df4d))
                          ]))),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                return FindFacilityReviewComment(
                    rating: 4, body: _commentExamples[index]);
              }, childCount: _reviewCount))
            ]));
      }),
    );
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is! ScrollEndNotification) return false;

    if (notification.metrics.extentBefore + 50.0 >
        notification.metrics.maxScrollExtent) {
      setState(() {
        _reviewCount += 10;
      });
    }
    return true;
  }

  void _onPressedPostCreate() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FindFacilityReviewCreatePost()));
    if (result != null) {
      setState(() {
        _commentExamples.add(result);
      });
    }
  }
}
