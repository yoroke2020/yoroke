import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/components/YrkListView.dart';
import 'package:yoroke/views/widgets/YrkButton.dart';
import 'package:yoroke/views/widgets/YrkTextStyle.dart';

class BoardReviewTabViewList extends YrkListItem {
  BoardReviewTabViewList(width, height,
      {Key key, @required this.data})
      : super(width, height);

  final YrkData data;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.maxFinite,
            height: 65,
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: 7.0, bottom: 6.0),
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
                          padding: const EdgeInsets.only(top: 1.0, right: 8.0),
                          child: Text("후기",
                              style: const YrkTextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left)),
                      Container(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                              "조문기의 리뷰 카드 번호 " +
                                  data.i1.toString() +
                                  "번",
                              style: const YrkTextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left)),
                      Visibility(
                          visible: true,
                          child: Container(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: YrkButton(
                                type: ButtonType.chip,
                                width: 27,
                                height: 16,
                                label: "BEST",
                                fontSize: 8.0,
                                clickable: false,
                              ))),
                    ])),
                Expanded(
                  flex: 1,
                  child: Row(children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Text("사용자ID",
                          style: const YrkTextStyle(
                              fontSize: 12.0, color: const Color(0x4d000000)),
                          textAlign: TextAlign.left),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 19.0),
                      child: Text("2020.10.21",
                          style: const YrkTextStyle(
                              fontSize: 12.0, color: const Color(0x4d000000)),
                          textAlign: TextAlign.left),
                    ),
                    Container(
                        width: 14,
                        height: 12,
                        margin: const EdgeInsets.only(right: 5.0, top: 2.0),
                        child: Image.asset("assets/icons/thumb_up_16_px.png")),
                    Container(
                      margin: const EdgeInsets.only(right: 19.0),
                      child: Text("15k",
                          style: const YrkTextStyle(
                              fontSize: 12.0, color: const Color(0x4d000000)),
                          textAlign: TextAlign.left),
                    ),
                    Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 8.0, top: 3.0),
                        child:
                            Image.asset("assets/icons/mode_comment_16_px.png")),
                    Container(
                        child: Text("152",
                            style: const YrkTextStyle(
                                fontSize: 12.0, color: const Color(0x4d000000)),
                            textAlign: TextAlign.left)),
                    Expanded(child: Container()),
                    Container(child: _buildRantingStarList()),
                  ]),
                ),
              ],
            ));
  }

  Widget _buildRantingStarList() {
    List<Widget> list = List<Widget>();
    if (testNumber[this.index] == -1)
      return Container();
    else {
      for (int i = 0; i < testNumber[this.index]; i++) {
        list.add(Icon(
          Icons.star,
          color: const Color(0xfff5df4d),
          size: 12,
        ));
      }
      for (int i = 0; i < 5 - testNumber[this.index]; i++) {
        list.add(
            Icon(Icons.star_border, color: const Color(0xff939597), size: 12));
      }
      return Wrap(children: list);
    }
  }

  @override
  clone() {
    return BoardReviewTabViewList(width, height, data: data,);
  }
}
