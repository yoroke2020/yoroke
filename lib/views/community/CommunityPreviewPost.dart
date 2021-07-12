import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/PostPreviewModel.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

class CommunityPreviewPost extends StatelessWidget {
  CommunityPreviewPost({required this.model, this.isBestTab = false});

  final PostPreviewModel model;
  final bool isBestTab;

  void _onFindFacilityClicked(BuildContext context) async {
    print('clicked');
  }

  @override
  Widget build(BuildContext context) {
    // popular tab
    if (isBestTab) {
      return InkWell(
        onTap: () => _onFindFacilityClicked(context),
        child: Container(
            width: double.maxFinite,
            height: 172.0,
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                model.boardLabel != null
                    ? YrkButton(
                        buttonType: ButtonType.chip,
                        width: 34,
                        height: 16,
                        label: model.boardLabel,
                        textStyle: YrkTextStyle(
                          fontSize: 8.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "OpenSans",
                        ),
                        clickable: false,
                        onPressed: () {},
                      )
                    : Container(),
                Container(width: double.maxFinite, height: 8.0),
                Text(model.title!,
                    style: const TextStyle(
                        color: const Color(0xe6000000),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansCJKKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left),
                Container(width: double.maxFinite, height: 8.0),
                Container(
                    padding: const EdgeInsets.only(right: 15.0),
                    height: 40,
                    child: Text(model.content!)),
                Container(width: double.maxFinite, height: 12.0),
                Container(
                  margin: const EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 1, color: const Color(0xffe5e5e5))),
                  ),
                ),
                Container(width: double.maxFinite, height: 12.0),
                Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(2.0),
                                child: YrkIconButton(
                                  icon: model.profileImage!,
                                  width: 14.0,
                                  height: 14.0,
                                  clickable: false,
                                )),
                            Text(model.author!,
                                style: const TextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "NotoSansCJKKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            YrkIconButton(
                              icon: "icon_visibility_off.svg",
                              width: 16.0,
                              height: 16.0,
                              clickable: false,
                            ),
                            Container(width: 2.0),
                            Text(model.viewCount!.toString(),
                                style: const TextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "OpenSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                            Container(width: 8.0),
                            YrkIconButton(
                              icon: "icon_thumb_up.svg",
                              width: 16.0,
                              height: 16.0,
                              clickable: false,
                            ),
                            Container(width: 2.0),
                            Text(model.likeCount!.toString(),
                                style: const TextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "OpenSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                            Container(width: 8.0),
                            YrkIconButton(
                              icon: "icon_comment.svg",
                              width: 16.0,
                              height: 16.0,
                              clickable: false,
                            ),
                            Container(width: 2.0),
                            Text(model.commentCount!.toString(),
                                style: const TextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "OpenSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                          ],
                        )
                      ],
                    ))
              ],
            )),
      );
    }
    // normal tab
    bool isBest = model.boardLabel == null ? false : true;
    // normal tab - best
    if (isBest) {
      return InkWell(
        onTap: () => _onFindFacilityClicked(context),
        child: Container(
            width: 320.0,
            height: 167.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x26000000),
                      offset: Offset(2, 2),
                      blurRadius: 8,
                      spreadRadius: 0)
                ],
                color: const Color(0xffffffff)),
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            margin: const EdgeInsets.only(left: 16.0, right: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                model.boardLabel != null
                    ? YrkButton(
                        buttonType: ButtonType.chip,
                        width: 34,
                        height: 16,
                        label: model.boardLabel,
                        textStyle: YrkTextStyle(
                          fontSize: 8.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "OpenSans",
                        ),
                        clickable: false,
                        onPressed: () {},
                      )
                    : Container(),
                Container(width: double.maxFinite, height: 8.0),
                Text(model.title!,
                    style: const TextStyle(
                        color: const Color(0xe6000000),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansCJKKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left),
                Container(width: double.maxFinite, height: 8.0),
                Container(
                    padding: const EdgeInsets.only(right: 15.0),
                    height: 40,
                    child: Text(model.content!)),
                Container(width: double.maxFinite, height: 12.0),
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 1, color: const Color(0xffe5e5e5))),
                  ),
                ),
                Container(width: double.maxFinite, height: 11.0),
                Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(2.0),
                                child: YrkIconButton(
                                  icon: model.profileImage!,
                                  width: 14.0,
                                  height: 14.0,
                                  clickable: false,
                                )),
                            Text(model.author!,
                                style: const TextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "NotoSansCJKKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            YrkIconButton(
                              icon: "icon_visibility_off.svg",
                              width: 16.0,
                              height: 16.0,
                              clickable: false,
                            ),
                            Container(width: 2.0),
                            Text(model.viewCount!.toString(),
                                style: const TextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "OpenSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                            Container(width: 8.0),
                            YrkIconButton(
                              icon: "icon_thumb_up.svg",
                              width: 16.0,
                              height: 16.0,
                              clickable: false,
                            ),
                            Container(width: 2.0),
                            Text(model.likeCount!.toString(),
                                style: const TextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "OpenSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                            Container(width: 8.0),
                            YrkIconButton(
                              icon: "icon_comment.svg",
                              width: 16.0,
                              height: 16.0,
                              clickable: false,
                            ),
                            Container(width: 2.0),
                            Text(model.commentCount!.toString(),
                                style: const TextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "OpenSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                          ],
                        )
                      ],
                    ))
              ],
            )),
      );
    }
    return InkWell(
      onTap: () => _onFindFacilityClicked(context),
      child: Container(
          width: double.maxFinite,
          height: 172.0,
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              model.boardLabel != null
                  ? YrkButton(
                      buttonType: ButtonType.chip,
                      width: 34,
                      height: 16,
                      label: model.boardLabel,
                      textStyle: YrkTextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: "OpenSans",
                      ),
                      clickable: false,
                      onPressed: () {},
                    )
                  : Container(),
              Container(width: double.maxFinite, height: 8.0),
              Text(model.title!,
                  style: const TextStyle(
                      color: const Color(0xe6000000),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansCJKKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.left),
              Container(width: double.maxFinite, height: 8.0),
              Container(
                  padding: const EdgeInsets.only(right: 15.0),
                  height: 40,
                  child: Text(model.content!)),
              Container(width: double.maxFinite, height: 12.0),
              Container(
                margin: const EdgeInsets.only(right: 15.0),
                decoration: BoxDecoration(
                  border: Border(
                      top:
                          BorderSide(width: 1, color: const Color(0xffe5e5e5))),
                ),
              ),
              Container(width: double.maxFinite, height: 12.0),
              Container(
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(2.0),
                              child: YrkIconButton(
                                icon: model.profileImage!,
                                width: 14.0,
                                height: 14.0,
                                clickable: false,
                              )),
                          Text(model.author!,
                              style: const TextStyle(
                                  color: const Color(0x4d000000),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansCJKKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          YrkIconButton(
                            icon: "icon_visibility_off.svg",
                            width: 16.0,
                            height: 16.0,
                            clickable: false,
                          ),
                          Container(width: 2.0),
                          Text(model.viewCount!.toString(),
                              style: const TextStyle(
                                  color: const Color(0x4d000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left),
                          Container(width: 8.0),
                          YrkIconButton(
                            icon: "icon_thumb_up.svg",
                            width: 16.0,
                            height: 16.0,
                            clickable: false,
                          ),
                          Container(width: 2.0),
                          Text(model.likeCount!.toString(),
                              style: const TextStyle(
                                  color: const Color(0x4d000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left),
                          Container(width: 8.0),
                          YrkIconButton(
                            icon: "icon_comment.svg",
                            width: 16.0,
                            height: 16.0,
                            clickable: false,
                          ),
                          Container(width: 2.0),
                          Text(model.commentCount!.toString(),
                              style: const TextStyle(
                                  color: const Color(0x4d000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left),
                        ],
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
