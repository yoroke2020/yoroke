import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/CommentModel.dart';
import 'package:yoroke/models/PostModel.dart';
import 'package:yoroke/temp/TestPostData.dart';
import 'package:yoroke/temp/YrkData.dart';
import 'package:yoroke/temp/YrkMbsListData.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarComment.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/mbs/YrkModelBottomSheet.dart';
import 'package:http/http.dart' as http;

import 'PostComment.dart';

class Post extends StatefulWidget {
  Post({Key? key, required this.data}) : super(key: key);

  final YrkData? data;

  _PostState createState() => _PostState();
}

class _PostState extends State<Post> with ScreenState<YrkBlock2> {
  // Keyboard FocusNode for the Current Post Page
  FocusNode _focusNode = new FocusNode();

  // ScrollController for the Current Post Page
  ScrollController _scrollController = ScrollController();

  // Post Title Controller & Document
  TextEditingController _textEditingController = TextEditingController();

  // Post Body Controller & Document
  late QuillController _quillController;
  late Document _document;

  // Like & Dislike Count for the Current Post
  bool _isMyPost = false;

  // ModalBottomSheet Type, LabelList & ImageList
  final YrkMbsType _mbsType = YrkMbsType.image;
  late List<String> _mbsLabelList;
  late List<String> _mbsImageList;

  // TODO: convert this.block into future obj
  late Future<YrkBlock2> mBlocks;

  @override
  void initState() {
    super.initState();
    mBlocks = fetchPost();
    // initBlock();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _quillController.dispose();
    super.dispose();
  }

  @override
  void initBlock() {
    // Map<String, dynamic> jsonResponse = TestPostData().jsonResponse;
    // YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    // // List<YrkBlock2> blocks = apiResponse.body!;
    // this.block = YrkBlock2()..blocks = apiResponse.body!;
    // this.block = mBlocks as YrkBlock2;
  }

  @override
  void updateBlockOn(String action) {
    // TODO: implement updateBlockOn
  }

  Future<YrkBlock2> fetchPost() async {
    _document = Document();
    _isMyPost = false;

    setState(() {
      _quillController = QuillController(
          document: _document,
          selection: const TextSelection.collapsed(offset: 0));
    });

    _setMbsList();

    // TODO: get URI
    // final response = await http
    //     .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    final response = YrkApiResponse2.fromJson(TestPostData().jsonResponse);

    this.block = YrkBlock2()..blocks = response.body;

    // TODO: change to http statusCode & BODY
    if (response.status == "200") {
      // if (response.statusCode == 200) {
      return await Future<YrkBlock2>.delayed(
        const Duration(seconds: 2),
        () => this.block,
        // ..blocks = YrkApiResponse2.fromJson(jsonDecode(response.body)).body,
      ).whenComplete(() => this.block);
      // ..blocks = YrkApiResponse2.fromJson(jsonDecode(response.body)).body);
    } else {
      throw Exception('Failed to fetch post');
    }
  }

  Future<YrkBlock2> _loadFromAssets() async {
    _document = Document();
    _isMyPost = false;

    setState(() {
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

  /// [Event Controllers]
  void _onTapBodyLike() {
    setState(() {
      // TODO: Check whethrer already liked or not
      this.block.blocks![1].items.cast<PostModel>()[0].likeCount += 1;
    });
  }

  void _onTapBodyDislike() {
    setState(() {
      // TODO: Check whethrer already disliked or not
      this.block.blocks![1].items.cast<PostModel>()[0].dislikeCount += 1;
    });
  }

  void _onTapNavigatorPrev() {
    //TODO: When Min hits, not to navigate
  }

  void _onTapNavigatorNext() {
    //TODO: When Max hits, not to navigate
  }

  void _onTapRegisterButton(String comment) {
    setState(() {
      var _newComment = CommentModel(
          commentId: 0,
          author: "TEMP",
          accountId: 0,
          timestamp: "TEMP",
          likeCount: 0,
          dislikeCount: 0,
          description: comment);
      this.block.blocks![3].items.cast<CommentModel>().add(_newComment);
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 56,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeOut);
    });
  }

  /// [FutureBuilder] Widget building state
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mBlocks,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return buildPost(context, snapshot);
        } else if (snapshot.hasError) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Error: ${snapshot.error}',
                  style: const YrkTextStyle()));
        } else
          return buildPost(context, snapshot);
      },
    );
  }

  /// Widget building state [FutureBuilder] - when [AsyncSnapshot.hasData]
  /// Build entire post screen
  Widget buildPost(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    Widget _getUserInfo(AsyncSnapshot<dynamic> snapshot) {
      PostModel _post = this.block.blocks![1].items.cast<PostModel>()[0];
      var _time = _post.timestamp!.split("T");
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: double.maxFinite,
                    height: 32.0,
                    child: Text(this.block.blocks![1].title,
                        style: const YrkTextStyle(
                            color: const Color(0x99000000)))),
                Container(
                    width: double.maxFinite,
                    height: 32.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
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
                                          fontFamily: "OpenSans"),
                                      clickable: false))),
                          Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Text(_post.title!,
                                  style: const YrkTextStyle(
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
                                  Text(_time[0],
                                      style: const YrkTextStyle(
                                          color: const Color(0x4d000000))),
                                  Padding(padding: EdgeInsets.only(right: 8.0)),
                                  Text(_time[1],
                                      style: const YrkTextStyle(
                                          color: const Color(0x4d000000)))
                                ])
                              ])
                        ]))
              ]));
    }

    Widget _getPost() {
      return Container(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 48.0),
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

    Widget _getPostOption(BuildContext context) {
      var _post = this.block.blocks![1].items.cast<PostModel>()[0];

      Widget _likeWidgetButton(bool isLike) {
        return Expanded(
            flex: 1,
            child: InkWell(
                hoverColor: Colors.transparent,
                onTap: isLike ? _onTapBodyLike : _onTapBodyDislike,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: YrkIconButton(
                              icon: isLike
                                  ? "icon_thumb_up.svg"
                                  : "icon_thumb_down.svg",
                              iconSize: 14,
                              color: const Color(0x4d000000))),
                      Text(
                          isLike
                              ? _post.likeCount.toString()
                              : _post.dislikeCount.toString(),
                          style: Theme.of(context).textTheme.headline4)
                    ])));
      }

      Widget _moreWidgetButton() {
        return Expanded(
            flex: 1,
            child: InkWell(
                hoverColor: Colors.transparent,
                onTap: () => showYrkModalBottomSheet(
                      context: context,
                      type: _mbsType,
                      labelList: _mbsLabelList,
                      imageList: _mbsImageList,
                      onTap: (index) => Navigator.of(context).pop(),
                    ),
                child: Center(
                    child: Icon(Icons.more_horiz,
                        color: const Color(0x4d000000), size: 24.0))));
      }

      return Container(
          width: double.maxFinite,
          height: 32.0,
          child: Row(children: <Widget>[
            _likeWidgetButton(true),
            _likeWidgetButton(false),
            _moreWidgetButton()
          ]));
    }

    Widget _getPostNavigation() {
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
                          child: Text(
                            index == 0 ? "이전" : "다음",
                            style: Theme.of(context).textTheme.headline4,
                          )),
                      Text(_naviBlock[index].title,
                          style: const YrkTextStyle(fontSize: 16.0)),
                      Spacer(),
                      YrkIconButton(
                          icon: index == 0
                              ? "icon_arrow_up.svg"
                              : "icon_arrow_down.svg",
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
            _isBefore && _isNext ? Divider(height: 1) : Container(),
            _isNext ? _postNavigatorWidget(1) : Container(),
          ]));
    }

    Widget _getComment() {
      var _comment = this.block.blocks![3].items.cast<CommentModel>();
      Widget _commentList() {
        if (_comment.length == 0)
          return Padding(
              padding: EdgeInsets.only(top: 48.0),
              child: Text(
                "등록된 댓글이 없습니다. 댓글을 남겨보세요.",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ));

        List<Widget> list = <Widget>[];
        for (int i = 0; i < _comment.length; i++) {
          list.add(PostComment(
              model: _comment[i],
              focusNode: _focusNode,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Text("댓글",
                              style: const YrkTextStyle(
                                color: const Color(0xff999999),
                              )),
                        ),
                        Text(_comment.length.toString(),
                            style: const YrkTextStyle(
                              fontFamily: "Helvetica",
                              color: const Color(0xff999999),
                            ))
                      ],
                    )),
                Divider(height: 1),
                _commentList()
              ]));
    }

    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
        },
        child: Scaffold(
            appBar: YrkAppBar(type: YrkAppBarType.arrowBackOnly),
            body: ListView(controller: _scrollController, children: <Widget>[
              _getUserInfo(snapshot),
              Divider(color: const Color(0xffe5e5e5), height: 0.5),
              _getPost(),
              Divider(color: const Color(0xffe5e5e5)),
              _getPostOption(context),
              _getPostNavigation(),
              _getComment(),
            ]),
            bottomNavigationBar: BottomBarComment(
                focusNode: _focusNode,
                controller: _textEditingController,
                onTapRegister: (comment) => _onTapRegisterButton(comment))));
  }
}
