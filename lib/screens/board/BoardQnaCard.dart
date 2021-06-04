import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

part 'BoardQnaCard.g.dart';

class BoardQnaCard extends StatelessWidget {
  BoardQnaCard({required this.model});

  final BoardQnaCardModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 328.0,
        height: 135.0,
        margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x99939597),
                  offset: Offset(0, 2),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
            color: const Color(0xffffffff)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 328.0,
                  height: 32.0,
                  child: Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                          radius: 16.0,
                          //TODO: Account 정보를 받아서 Display
                          backgroundImage: AssetImage(
                              "assets/images/account_circle_default.png"),
                          backgroundColor: const Color(0xffffffff)),
                    ),
                    Container(
                        height: 32.0,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 256.0,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(model.author ?? "",
                                          style: const YrkTextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0)),
                                      YrkButton(
                                        buttonType: ButtonType.chip,
                                        width: 32,
                                        height: 16,
                                        label: "BEST",
                                        textStyle: YrkTextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "OpenSans",
                                        ),
                                        clickable: false,
                                        onPressed: () {},
                                      )
                                    ]),
                              ),
                              Row(children: <Widget>[
                                Text(model.type ?? "",
                                    style: const YrkTextStyle(
                                        color: const Color(0x99000000))),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Icon(
                                    Icons.brightness_1,
                                    size: 4.0,
                                    color: const Color(0x4d000000),
                                  ),
                                ),
                                Text(model.timestamp ?? "",
                                    style: const YrkTextStyle(
                                        color: const Color(0x99000000)))
                              ])
                            ]))
                  ])),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(model.title ?? "", style: const YrkTextStyle())),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  YrkIconButton(
                    icon: "icon_thumb_up.svg",
                    width: 16.0,
                    height: 16.0,
                    padding: EdgeInsets.only(right: 4.0),
                    clickable: false,
                    color: const Color(0x4d000000),
                  ),
                  Text(
                    '${model.likeCount ?? -1}',
                    style: const YrkTextStyle(
                        color: const Color(0x4d000000),
                        fontWeight: FontWeight.w600,
                        fontFamily: "OpenSans",
                        fontSize: 12.0),
                  ),
                  YrkIconButton(
                    icon: "icon_thumb_down.svg",
                    width: 16.0,
                    height: 16.0,
                    padding: EdgeInsets.only(left: 8.0, right: 4.0),
                    clickable: false,
                    color: const Color(0x4d000000),
                  ),
                  Text(
                    '${model.dislikeCount ?? -1}',
                    style: const YrkTextStyle(
                        color: const Color(0x4d000000),
                        fontWeight: FontWeight.w600,
                        fontFamily: "OpenSans",
                        fontSize: 12.0),
                  ),
                  YrkIconButton(
                    icon: "icon_mode_comment.svg",
                    width: 16.0,
                    height: 16.0,
                    padding: EdgeInsets.only(left: 8.0, right: 4.0),
                    clickable: false,
                    color: const Color(0x4d000000),
                  ),
                  Text(
                    '${model.commentCount ?? -1}',
                    style: const YrkTextStyle(
                        color: const Color(0x4d000000),
                        fontWeight: FontWeight.w600,
                        fontFamily: "OpenSans",
                        fontSize: 12.0),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () => {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            YrkIconButton(
                              icon: "icon_share.svg",
                              width: 16.0,
                              height: 16.0,
                              padding: EdgeInsets.only(left: 8.0, right: 4.0),
                              clickable: false,
                              color: const Color(0x4d000000),
                            ),
                            Text("공유하기",
                                style: const YrkTextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0))
                          ]))
                ],
              )
            ],
          ),
        ));
  }
}

@JsonSerializable()
class BoardQnaCardModel extends YrkModel {
  String? type;
  String? title;
  String? author;
  String? timestamp;
  double? likeCount;
  double? dislikeCount;
  double? commentCount;

  BoardQnaCardModel();

  factory BoardQnaCardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardQnaCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardQnaCardModelToJson(this);
}
