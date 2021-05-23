import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class PostComment extends StatefulWidget {
  PostComment(
      {required this.focusNode,
      required this.index,
      required this.comment,
      required this.controller});

  final FocusNode focusNode;
  final int index;
  final String comment;
  final TextEditingController controller;

  @override
  _PostCommentState createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  int likeCount = 0;
  int dislikeCount = 0;

  bool isLiked = false;
  bool isDisliked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 14.0, bottom: 10.0),
        margin: EdgeInsets.only(left: 16.0, right: 16.0),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: const Color(0xffe5e5e5), width: 1),
        )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 6.0),
                    child: SvgPicture.asset(
                        "assets/icons/account_circle_default.svg",
                        width: 32.0,
                        height: 32.0),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text("사용자ID",
                          style: YrkTextStyle(
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                          ))),
                  Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text("20.10.22",
                          style: YrkTextStyle(
                            color: const Color(0x4d000000),
                            fontFamily: "OpenSans",
                            height: 0.8,
                            fontSize: 12.0,
                          ))),
                  Text("17:03",
                      style: YrkTextStyle(
                        color: const Color(0x4d000000),
                        fontFamily: "OpenSans",
                        height: 0.8,
                        fontSize: 12.0,
                      )),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(Icons.more_vert,
                        color: const Color(0x4d000000), size: 24.0),
                    onPressed: () => {},
                  )
                ],
              )),
              Container(
                padding: EdgeInsets.only(
                    top: 1.0, bottom: 8.0, left: 38.0, right: 40.0),
                child: Text(
                  widget.comment,
                  style: YrkTextStyle(
                    height: 1.0,
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  YrkIconButton(
                    icon: "assets/icons/icon_tumbs_up_60.svg",
                    onTap: _onTapLikeCount,
                    padding: EdgeInsets.only(right: 5.0),
                    width: 14.0,
                    height: 12.0,
                    color: const Color(0x4d000000),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 17.0),
                    child: Text(likeCount.toString(),
                        style: const YrkTextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0x4d000000))),
                  ),
                  YrkIconButton(
                    icon: "assets/icons/icon_thumbs_down_60.svg",
                    onTap: _onTapDislikeCount,
                    padding: EdgeInsets.only(right: 5.0),
                    width: 14.0,
                    height: 12.0,
                    color: const Color(0x4d000000),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: Text(dislikeCount.toString(),
                        style: const YrkTextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0x4d000000)),
                        textAlign: TextAlign.left),
                  ),
                  InkWell(
                      onTap: _onTapAddComment,
                      child: Text(
                        "댓글 달기",
                        style: const YrkTextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: const Color(0x4d000000)),
                      )),
                ],
              ),
            ]));
  }

  void _onTapLikeCount() {
    setState(() {
      this.likeCount = this.isLiked ? this.likeCount - 1 : this.likeCount + 1;
      this.isLiked = this.isLiked ? false : true;
    });
  }

  void _onTapDislikeCount() {
    setState(() {
      this.dislikeCount =
          this.isDisliked ? this.dislikeCount - 1 : this.dislikeCount + 1;
      this.isDisliked = this.isDisliked ? false : true;
    });
  }

  void _onTapAddComment() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
    currentFocus.requestFocus(widget.focusNode);
    widget.controller.text = "@사용자ID ";
  }
}
