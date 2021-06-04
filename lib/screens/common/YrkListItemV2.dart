import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/board/BoardJobFinding.dart';
import 'package:yoroke/screens/board/BoardQna.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/post/Post.dart';

import '../TestPage.dart';

part 'YrkListItemV2.g.dart';

class YrkPageListItemV2 extends StatelessWidget {
  YrkPageListItemV2({this.type, required this.model});

  final String? type;
  final YrkListItemV2Model model;

  void _onItemClicked(BuildContext context, nextPageItem) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        switch (nextPageItem) {
          case "post":
            return Post(data: new YrkData());
          default:
            return TestPage();
        }
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isText = true;
    bool isBestIcon = false;
    bool isRating = false;

    switch (type ?? "") {
      case "JobFindingPost":
        isText = false;
        break;
      case "PopularPostBlock":
      case "reviewPost":
      case "QnaPost":
        isRating = true;
        isBestIcon = model.isBest ?? false;
        break;
      default:
        break;
    }

    return InkWell(
      onTap: () => _onItemClicked(context, "post"),
      //TODO: YrkData -> API Call
      child: Container(
          width: double.maxFinite,
          height: 65.0,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(
              color: const Color(0xffffffff),
              border: Border(
                  top: BorderSide(width: 1, color: const Color(0x14000000)))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: isText
                            ? Text(model.facilityType ?? "",
                                style: const YrkTextStyle(
                                    color: const Color(0x99000000),
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)
                            : YrkButton(
                                buttonType: ButtonType.solid,
                                label: model.facilityType ?? "",
                                onPressed: () {},
                                width: 60.0,
                                height: 24.0,
                                textStyle: YrkTextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 4.0),
                          child: Text(model.title ?? "",
                              style: const YrkTextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left)),
                      isBestIcon
                          ? Container(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: YrkButton(
                                buttonType: ButtonType.chip,
                                width: 32,
                                height: 16,
                                label: "BEST",
                                textStyle: YrkTextStyle(
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "OpenSans",
                                ),
                                clickable: false,
                                onPressed: () {},
                              ))
                          : Container()
                    ]),
                Container(width: double.maxFinite, height: 6.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text(model.author ?? "",
                            style: const YrkTextStyle(
                                color: const Color(0x4d000000),
                                fontWeight: FontWeight.w500,
                                height: 0.9,
                                fontSize: 12.0),
                            textAlign: TextAlign.left)),
                    Container(
                        margin: EdgeInsets.only(right: 9.0),
                        child: Text(model.timestamp ?? "",
                            style: const YrkTextStyle(
                              color: const Color(0x4d000000),
                              fontSize: 12.0,
                              fontFamily: "OpenSans",
                            ),
                            textAlign: TextAlign.left)),
                    Container(
                        margin: EdgeInsets.only(right: 3.0),
                        width: 14.0,
                        height: 12.0,
                        child: Center(
                            child: YrkIconButton(icon: "icon_thumb_up.svg"))),
                    Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text('${model.likeCount ?? -1}',
                            style: const YrkTextStyle(
                              color: const Color(0x4d000000),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              fontFamily: "OpenSans",
                            ),
                            textAlign: TextAlign.left)),
                    Container(
                        margin: EdgeInsets.only(right: 3.0),
                        width: 12.0,
                        height: 12.0,
                        child: Center(
                            child: YrkIconButton(icon: "icon_comment.svg"))),
                    Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text('${model.commentCount ?? -1}',
                            style: const YrkTextStyle(
                              color: const Color(0x4d000000),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              fontFamily: "OpenSans",
                            ),
                            textAlign: TextAlign.left)),
                    isRating
                        ? Container(
                            child: Row(children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(right: 3.0),
                                width: 12.0,
                                height: 12.0,
                                child: Icon(
                                  Icons.star,
                                  color: const Color(0xfff5df4d),
                                  size: 12,
                                )),
                            Container(
                                child: Text('${model.rating ?? -1}',
                                    style: const YrkTextStyle(
                                      color: const Color(0x4d000000),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                      fontFamily: "OpenSans",
                                    ),
                                    textAlign: TextAlign.left))
                          ]))
                        : Container(),
                  ],
                )
              ])),
    );
  }
}

@JsonSerializable()
class YrkListItemV2Model extends YrkModel {
  String? facilityType;
  String? title;
  bool? isBest;
  String? author;
  String? timestamp;
  double? likeCount;
  double? commentCount;
  double? rating;

  YrkListItemV2Model();

  factory YrkListItemV2Model.fromJson(Map<String, dynamic> json) =>
      _$YrkListItemV2ModelFromJson(json);

  Map<String, dynamic> toJson() => _$YrkListItemV2ModelToJson(this);
}
