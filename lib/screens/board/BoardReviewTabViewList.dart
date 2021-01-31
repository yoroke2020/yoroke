import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/navigator/TabItem.dart';
import 'package:helloflutter/tools/Data.dart';
import 'package:helloflutter/tools/YorokeWidgetList.dart';

class BoardReviewTabViewList extends YorokeWidgetList {
  @override
  BoardReviewTabViewList(
      {@required this.items,
      @required this.widgetRatio,
      @required this.listLength,
      @required this.itemLength,
      @required this.data,
      @required this.onPushNavigator,
      this.ratings = -1})
      : super(
            items: items,
            widgetRatio: widgetRatio,
            listLength: listLength,
            itemLength: itemLength,
            data: data,
            onPushNavigator: onPushNavigator);

  @override
  final List<String> items;
  @override
  final double widgetRatio;
  @override
  final int listLength;
  @override
  final int itemLength;
  @override
  final Data data;
  @override
  final ValueChanged<Data> onPushNavigator;
  final int ratings;

  @override
  List<Widget> getWidgetList();

  @override
  Widget createWidget(int currentIndex) {
    return InkWell(
        onTap: () => onPushNavigator(new Data(DetailItem.qna,
            "This is # " + currentIndex.toString() + " in 요양병원 후기/질문")),
        child: Container(
            height: 65,
            padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 9),
            decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border(
                    top: BorderSide(width: 1, color: const Color(0x14000000)))),
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Row(children: [
                      Container(
                          width: 33,
                          padding: EdgeInsets.only(right: 8),
                          child: Text("후기",
                              style: const TextStyle(
                                  color: const Color(0x99000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left)),
                      Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(data.data,
                              style: const TextStyle(
                                  color: const Color(0xe6000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left)),
                      Container(
                          width: 27,
                          height: 16,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                              border: Border.all(
                                  color: const Color(0xfff5df4d), width: 1),
                              color: const Color(0xfff5df4d)),
                          child: Center(
                              child: Text("BEST",
                                  style: const TextStyle(
                                      color: const Color(0xe6000000),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 8.0),
                                  textAlign: TextAlign.center))),
                    ])),
                Expanded(
                  flex: 1,
                  child: Row(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 16),
                      child: Text("사용자ID",
                          style: const TextStyle(
                              color: const Color(0x4d000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 19),
                      child: Text("2020.10.21",
                          style: const TextStyle(
                              color: const Color(0x4d000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                    ),
                    Container(
                        width: 19,
                        height: 12,
                        padding: EdgeInsets.only(right: 5),
                        child: Image.asset("assets/icons/thumb_up_16_px.png")),
                    Container(
                      padding: EdgeInsets.only(right: 19),
                      child: Text("15k",
                          style: const TextStyle(
                              color: const Color(0x4d000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                    ),
                    Container(
                        width: 18,
                        height: 12,
                        padding: EdgeInsets.only(right: 8),
                        child:
                            Image.asset("assets/icons/mode_comment_16_px.png")),
                    Container(
                        child: Text("152",
                            style: const TextStyle(
                                color: const Color(0x4d000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.left)),
                    Expanded(child: Container()),
                    Container(child: _buildRantingStarList())
                  ]),
                ),
              ],
            )));
  }

  Widget _buildRantingStarList() {
    List<Widget> list = List<Widget>();
    if (ratings == -1)
      return Wrap(children: list);
    else {
      for (int i = 0; i < ratings; i++) {
        list.add(Icon(
          Icons.star,
          color: const Color(0xfff5df4d),
          size: 12,
        ));
      }
      for (int i = 0; i < 5 - ratings; i++) {
        list.add(
            Icon(Icons.star_border, color: const Color(0xff939597), size: 12));
      }
      return Wrap(children: list);
    }
  }
}
