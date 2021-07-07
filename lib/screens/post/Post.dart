import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/PostModel.dart';
import 'package:yoroke/temp/TestPostData.dart';
// import 'package:yoroke/temp/TestData.dart';
import 'package:yoroke/temp/YrkData.dart';
import 'package:yoroke/temp/YrkMbsListData.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarComment.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/mbs/YrkModelBottomSheet.dart';

import 'PostComment.dart';

class Post extends StatefulWidget {
  Post({Key? key, required this.data}) : super(key: key);

  final YrkData? data;

  _PostState createState() => _PostState();
}

class _PostState extends State<Post> with ScreenState<YrkBlock2> {
  // ScrollController for the Current Post Page
  ScrollController _scrollController = ScrollController();

  // Keyboard FocusNode for the Current Post Page
  FocusNode _focusNode = new FocusNode();

  // Post Title Controller & Document
  TextEditingController _textEditingController = TextEditingController();
  // String _postTitle = "";

  // Post Body Controller & Document
  late QuillController _quillController;
  late Document _document;

  // CommentList & Count for the Current Post
  List<String> _comments = <String>[];

  // Like & Dislike Count for the Current Post
  bool _isMyPost = false;

  // ModalBottomSheet Type, LabelList & ImageList
  final YrkMbsType _mbsType = YrkMbsType.image;
  late List<String> _mbsLabelList;
  late List<String> _mbsImageList;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadFromAssets(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(fontSize: 15),
            ),
          );
        } else
          return buildPost(context, snapshot);
      },
    );
  }

  Widget buildPost(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
        },
        child: Scaffold(
            appBar: YrkAppBar(type: YrkAppBarType.arrowBackOnly),
            body: ListView(controller: _scrollController, children: <Widget>[
              getUserInfo(snapshot),
              getPost(),
              getPostOption(context),
              getPostNavigation(),
              getComment(),
            ]),
            bottomNavigationBar: BottomBarComment(
                focusNode: _focusNode,
                controller: _textEditingController,
                onTapRegister: (comment) => _onTapRegisterButton(comment))));
  }

  Widget getUserInfo(AsyncSnapshot<dynamic> snapshot) {
    PostModel _post = this.block.blocks![1].items.cast<PostModel>()[0];
    var _time = _post.timestamp!.split("T");
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: const Color(0xffe5e5e5), width: 1)),
            color: const Color(0xffffffff)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: double.maxFinite,
                  height: 32.0,
                  child: Text("요양병원 후기",
                      style:
                          const YrkTextStyle(color: const Color(0x99000000)))),
              Container(
                  width: double.maxFinite,
                  height: 32.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                            // TODO: change it when the best appears
                            visible: _post.isBest!,
                            child: Container(
                                child: YrkButton(
                              buttonType: ButtonType.chip,
                              width: 27.0,
                              height: 16.0,
                              label: "BEST",
                              textStyle: YrkTextStyle(
                                fontSize: 8.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: "OpenSans",
                              ),
                              clickable: false,
                              onPressed: () {},
                            ))),
                        Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text(_post.title!,
                                style: const YrkTextStyle(
                                    color: const Color(0xe6000000),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0)))
                      ])),
              Container(
                  width: double.maxFinite,
                  height: 65.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 6.0),
                            child: YrkIconButton(
                                icon: "account_circle_default.svg",
                                iconSize: 32.0)),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(_post.author!,
                                  style: const TextStyle(
                                      color: const Color(0x4d000000))),
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(_time[0],
                                      style: const YrkTextStyle(
                                          color: const Color(0x4d000000))),
                                ),
                                Text(_time[1],
                                    style: const YrkTextStyle(
                                        color: const Color(0x4d000000)))
                              ])
                            ])
                      ]))
            ]));
  }

  Widget getPost() {
    return Container(
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 48.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: const Color(0xffe5e5e5), width: 1)),
            color: const Color(0xffffffff)),
        width: double.maxFinite,
        child: QuillEditor(
            focusNode: FocusNode(),
            scrollable: true,
            readOnly: true,
            autoFocus: false,
            expands: false,
            showCursor: false,
            scrollController: ScrollController(),
            padding: EdgeInsets.all(0),
            controller: _quillController));
  }

  Widget getPostOption(BuildContext context) {
    // _post = this.block.blocks![1].items.cast<PostModel>()[0];

    var _post = this.block.blocks![1].items.cast<PostModel>()[0];
    Widget _likeWidgetButton(bool isLike) {
      return Expanded(
          flex: 1,
          child: InkWell(
              onTap: isLike ? _onTapBodyLike : _onTapBodyDislike,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: YrkIconButton(
                        icon: isLike
                            ? "icon_thumb_up.svg"
                            : "icon_thumb_down.svg",
                        iconSize: 14,
                        color: const Color(0x4d000000),
                      ),
                    ),
                    Text(
                        isLike
                            ? _post.likeCount.toString()
                            : _post.dislikeCount.toString(),
                        style:
                            const YrkTextStyle(color: const Color(0x99000000)))
                  ])));
    }

    return Container(
        width: double.maxFinite,
        height: 32.0,
        child: Row(children: <Widget>[
          _likeWidgetButton(true),
          _likeWidgetButton(false),
          Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () => showYrkModalBottomSheet(
                        context: context,
                        type: _mbsType,
                        labelList: _mbsLabelList,
                        imageList: _mbsImageList,
                        onTap: (index) => Navigator.of(context).pop(),
                      ),
                  child: Center(
                      child: Icon(Icons.more_horiz,
                          color: const Color(0x4d000000), size: 24.0))))
        ]));
  }

  Widget getPostNavigation() {
    var _naviBlock = this.block.blocks![2].items.cast<PostModel>();
    bool _isBefore = _naviBlock[0].title != "" ? true : false;
    bool _isNext = _naviBlock[1].title != "" ? true : false;

    Widget _postNavigatorWidget(int index) {
      return InkWell(
          onTap: index == 1 ? _onTapNavigatorNext : _onTapNavigatorPrev,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              width: double.maxFinite,
              height: 40.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: 12.0),
                        child: Text(index == 0 ? "이전" : "다음",
                            style: const YrkTextStyle(
                                color: const Color(0x99000000)))),
                    Text(_naviBlock[index].title,
                        style: const YrkTextStyle(fontSize: 16.0)),
                    Spacer(),
                    YrkIconButton(
                        icon: index == 0
                            ? "icon_navigate_next.svg"
                            : "icon_navigate_next.svg",
                        iconSize: 24.0)
                  ])));
    }

    return Container(
        width: double.maxFinite,
        height: _isBefore && _isNext ? 97.0 : 56.0,
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal:
                    BorderSide(color: const Color(0xffeaeaea), width: 8)),
            color: const Color(0xffffffff)),
        child: Column(children: <Widget>[
          _isBefore ? _postNavigatorWidget(0) : Container(),
          _isBefore && _isNext
              ? Divider(height: 1, color: const Color(0xffeaeaea))
              : Container(),
          _isNext ? _postNavigatorWidget(1) : Container(),
        ]));
  }

  Widget getComment() {
    // var _comments = this.block.blocks![3].items.cast<PostModel>();
    Widget _commentList() {
      if (_comments.length == 0)
        return Padding(
            padding: EdgeInsets.only(top: 48.0),
            child: Text(
              "등록된 댓글이 없습니다. 댓글을 남겨보세요.",
              style: const TextStyle(
                color: const Color(0x99000000),
              ),
              textAlign: TextAlign.center,
            ));

      List<Widget> list = <Widget>[];
      for (int i = 0; i < _comments.length; i++) {
        list.add(PostComment(
            focusNode: _focusNode,
            index: _comments.length,
            comment: _comments[i],
            controller: _textEditingController));
      }
      return Wrap(children: list);
    }

    return Padding(
        padding: EdgeInsets.only(bottom: 68.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: double.maxFinite,
                  height: 41.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: const Color(0xffe5e5e5), width: 1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Text("댓글",
                            style: const YrkTextStyle(
                              color: const Color(0x99000000),
                              height: 1.2,
                            )),
                      ),
                      Text(_comments.length.toString(),
                          style: const YrkTextStyle(
                            fontFamily: "Helvetica",
                            color: const Color(0x99000000),
                          ))
                    ],
                  )),
              _commentList()
            ]));
  }

  Future<YrkBlock2> _loadFromAssets() async {
    Map<String, dynamic> jsonResponse = TestPostData().jsonResponse;
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    List<YrkBlock2> blocks = apiResponse.body!;

    _document = Document();
    _isMyPost = false;

    setState(() {
      this.block = YrkBlock2()..blocks = blocks;
      _quillController = QuillController(
          document: _document,
          selection: const TextSelection.collapsed(offset: 0));
    });

    _setMbsList();

    return Future<YrkBlock2>.delayed(
      Duration(seconds: 1),
      () => this.block,
    ).whenComplete(() => this.block);
  }

  void _setMbsList() {
    _mbsLabelList = _isMyPost
        ? YrkMbsListData.getLabelList("post").sublist(3)
        : YrkMbsListData.getLabelList("post");

    _mbsImageList = _isMyPost
        ? YrkMbsListData.getImageList("post").sublist(3)
        : YrkMbsListData.getImageList("post");
  }

  void _onTapBodyLike() {
    // setState(() {
    //   this._likeCount =
    //       this._isLiked ? this._likeCount - 1 : this._likeCount + 1;
    //   this._isLiked = this._isLiked ? false : true;
    // });
  }

  void _onTapBodyDislike() {
    // setState(() {
    //   this._dislikeCount =
    //       this._isDisliked ? this._dislikeCount - 1 : this._dislikeCount + 1;
    //   this._isDisliked = this._isDisliked ? false : true;
    // });
  }

  void _onTapNavigatorPrev() {
    //TODO: When Min hits, not to navigate
    // if (_itemIndex > 0) {
    //   _itemIndex--;
    //   _loadFromAssets();
    // } else {}
  }

  void _onTapNavigatorNext() {
    //TODO: When Max hits, not to navigate
    // _itemIndex++;
    // _loadFromAssets();
  }

  void _onTapRegisterButton(String comment) {
    setState(() {
      _comments.add(comment);
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
    });
  }

  @override
  void initBlock() {
    // TODO: implement initBlock
  }

  @override
  void updateBlockOn(String action) {
    // TODO: implement updateBlockOn
  }
}
