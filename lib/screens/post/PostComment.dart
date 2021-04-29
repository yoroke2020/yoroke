import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/mbs/YrkModelBottomSheet.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class PostComment extends StatefulWidget {
  PostComment({required this.index});

  final int index;

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
        padding: EdgeInsets.only(left: 18.0, right: 16.0),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: const Color(0xffe5e5e5), width: 1),
        )),
        child: Column(children: <Widget>[
          Container(
            height: 32.0,
            margin: EdgeInsets.only(top: 14.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 32.0,
                        height: 32.0,
                        margin: EdgeInsets.only(right: 6.0),
                        child: Center(
                          child: Image.asset(
                              "assets/icons/account_circle_default_24_px.png"),
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text("사용자ID",
                            style: YrkTextStyle(
                              fontWeight: FontWeight.w700,
                              height: 1.0,
                            ),
                            textAlign: TextAlign.left)),
                    Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text("20.10.22",
                            style: YrkTextStyle(
                              color: const Color(0x4d000000),
                              fontFamily: "OpenSans",
                              height: 0.8,
                              fontSize: 12.0,
                            ))),
                    Container(
                        child: Text("17:03",
                            style: YrkTextStyle(
                              color: const Color(0x4d000000),
                              fontFamily: "OpenSans",
                              height: 0.8,
                              fontSize: 12.0,
                            ))),
                    Expanded(child: Container()),
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.more_vert,
                          color: const Color(0x4d000000), size: 24.0),
                      onPressed: () {
                        print("more button clicked");
                        _getModalBottomSheet(context);
                      },
                    )
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 38.0, right: 40.0),
            child: Text(
              "좋은 정보 감사합니다. 좋은 정보 감사합니다. 좋은 정보 감사합니다.",
              style: YrkTextStyle(
                height: 1.0,
              ),
              textAlign: TextAlign.left,
            ),
            alignment: Alignment.topLeft,
          ),
          Container(
              height: 32.0,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Container()),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 5.0),
                          child: Image.asset(
                            "assets/icons/thumb_up_16_px.png",
                            width: 16.0,
                            height: 14.0,
                          ),
                        ),
                        onTap: _onTapLikeCount,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 17.0),
                        child: Text(likeCount.toString(),
                            style: const YrkTextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0x4d000000)),
                            textAlign: TextAlign.left),
                      ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 5.0),
                          child: Image.asset(
                            "assets/icons/thumb_up_16_px.png",
                            width: 16.0,
                            height: 14.0,
                          ),
                        ),
                        onTap: _onTapDislikeCount,
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
                          ))
                    ],
                  )))
        ]));
  }

  void _onTapLikeCount() {
    print("likeCount pressed");
    setState(() {
      this.likeCount = this.isLiked ? this.likeCount - 1 : this.likeCount + 1;
      this.isLiked = this.isLiked ? false : true;
    });
  }

  void _onTapDislikeCount() {
    print("dislikeCount pressed");
    setState(() {
      this.dislikeCount =
          this.isDisliked ? this.dislikeCount - 1 : this.dislikeCount + 1;
      this.isDisliked = this.isDisliked ? false : true;
    });
  }

  void _onTapAddComment() {
    print("add comment button clicked");
    //TODO: TextField에 @사용자ID가 붙게 하면서 Keyboard가 나타나게 해야함 (ValueChanged 같은 callback 필요)
  }

  void _getModalBottomSheet(context) {
    final List<String> imageAssetList = [
      "assets/icons/icon_clear_24_px.png",
      "assets/icons/icon_clear_24_px.png",
      "assets/icons/icon_clear_24_px.png",
      "assets/icons/icon_clear_24_px.png",
      "assets/icons/icon_clear_24_px.png",
      "assets/icons/icon_clear_24_px.png",
    ];

    final List<String> titleList = [
      "공유하기",
      "저장하기",
      "글 복사하기",
      "게시물 숨기기",
      "사용자 차단하기",
      "신고하기"
    ];

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return YrkModelBottomSheet(
            type: YrkModelBottomSheetType.post,
            labelList: titleList,
            imageList: imageAssetList,
            listHeight: 356.0,
            onTap: (index) {
              print(index);
              Navigator.of(context).pop();
            },
          );
        });
  }
}
