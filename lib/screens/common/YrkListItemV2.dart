import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

part 'YrkListItemV2.g.dart';

class YrkPageListItemV2 extends StatelessWidget {
  YrkPageListItemV2(
      {required this.pageType,
      required this.nextPageItem,
      required this.onPushNavigator,
      required this.model});

  final pageType;
  final nextPageItem;
  final ValueChanged<YrkData>? onPushNavigator;
  final YrkListItemV2Model model;

  @override
  Widget build(BuildContext context) {
    // Text or Button appears before a title. If it is true, a text appears.
    // If it is false, a button appears
    bool isText = true;
    // Best Icon appears next to a title
    bool isBestIcon = false;
    // Rating appears next to a comment icon on the second line
    bool isRating = false;

    // Add case here when new kinds of pageListItem is defined
    switch (pageType) {
      case SubPageItem.boardJobFinding:
        isText = false;
        break;
      case SubPageItem.post:
        isRating = true;
        isBestIcon = true;
        break;
      default:
        break;
    }

    return InkWell(
      onTap: () => onPushNavigator!(new YrkData(
          nextPageItem: nextPageItem, prevPageItem: pageType, i1: 0)),
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
                            ? Text(model.facilityType!,
                                style: const YrkTextStyle(
                                    color: const Color(0x99000000),
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)
                            : YrkButton(
                                buttonType: ButtonType.solid,
                                label: "구인중",
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
                          child: Text(model.title!,
                              style: const YrkTextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left)),
                      model.isBest!
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
                        child: Text(model.author!,
                            style: const TextStyle(
                                color: const Color(0x4d000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                            textAlign: TextAlign.left)),
                    Container(
                        margin: EdgeInsets.only(right: 9.0),
                        child: Text(model.timestamp!,
                            style: const TextStyle(
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
                        child: Text(model.likeCount!.toString(),
                            style: const TextStyle(
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
                        child: Text(model.commentCount!.toString(),
                            style: const TextStyle(
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
                                child: Text(model.rating.toString(),
                                    style: const TextStyle(
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
