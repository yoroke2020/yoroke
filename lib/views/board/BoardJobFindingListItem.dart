import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/components/YrkListView.dart';
import 'package:yoroke/views/widgets/YrkButton.dart';
import 'package:yoroke/views/widgets/YrkTextStyle.dart';

class BoardJobFindingListItem extends StatelessWidget {
  BoardJobFindingListItem({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 65.0,
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 7.0, bottom: 6.0),
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            border: Border(
                top: BorderSide(width: 1.0, color: const Color(0x14000000)))),
        child: Column(children: <Widget>[
          Expanded(
              flex: 1,
              child: Row(children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: YrkButton(
                      type: ButtonType.chip,
                      width: 60,
                      label: "구인중",
                      fontSize: 12,
                      clickable: false,
                    )),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: Text(testLongString[index],
                            style: const YrkTextStyle(fontSize: 16.0),
                            textAlign: TextAlign.left)))
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
                  child: Image.asset("assets/icons/mode_comment_16_px.png")),
              Container(
                  child: Text("152",
                      style: const YrkTextStyle(
                          fontSize: 12.0, color: const Color(0x4d000000)),
                      textAlign: TextAlign.left)),
            ]),
          ),
        ]));
  }
}
