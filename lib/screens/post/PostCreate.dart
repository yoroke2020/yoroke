import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/models/documents/nodes/embed.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoroke/temp/TestData.dart';
import 'package:yoroke/temp/YrkData.dart';
import 'package:yoroke/temp/YrkMbsListData.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/common/imagepickers/YrkImagePicker.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/mbs/YrkModelBottomSheet.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class PostCreate extends StatefulWidget {
  PostCreate({this.postData, this.data});

  final PostData? postData;
  final YrkData? data;

  @override
  _PostCreateState createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  // Keyboard FocusNode for the Current PostCreate Page
  final FocusNode _focusNode = FocusNode();

  // PostCreate Title Controller & Document
  final TextEditingController _titleController = TextEditingController();

  // PostCreate Body Controller & Document
  late QuillController _bodyController;
  late Document _document;

  // ScrollController for the Current PostCreate Body
  final ScrollController _scrollController = ScrollController();

  // PageType to notice which PageItem called PostCreate
  late var _pageType;

  // ModalBottomSheet type, TitleList, LabelList, LabelCountPerTitleList
  late YrkMbsType _mbsType;
  late List<String> _mbsTitleList;
  late List<String> _mbsLabelList;
  late List<int> _mbsLabelCountPerTitleList;

  // Selected Category Index & Text from ModalBottomSheet
  String _selectedCategory = "testPage";
  int _selectedCategoryIndex = -1;
  late String _selectedCategoryText;

  // Changes due to RegisterButton Activation
  late Color _registerButtonFillColor;
  late Color _registerButtonTextColor;
  bool _isRegisterButtonClickable = false;

  // Three checking fields to activate RegisterButton
  bool _isCategoryEmpty = true;
  bool _isTitleEmpty = true;
  bool _isBodyEmpty = true;

  String _tempTitle = "";
  String _tempBody = "";
  String _tempCategoryIndex = "";

  late PostData _postData;

  @override
  void initState() {
    super.initState();
    _postData = widget.postData ?? PostData("", "", "testPage", -1);

    _pageType = widget.data!.prevPageItem;
    _loadFromAssets();

    if (_isTitleEmpty || _isBodyEmpty || _isCategoryEmpty) {
      _registerButtonFillColor = const Color(0xfff4f4f4);
      _registerButtonTextColor = const Color(0xffaaaaaa);
      _isRegisterButtonClickable = false;
    } else {
      _registerButtonFillColor = const Color(0xffffec6a);
      _registerButtonTextColor = const Color(0x99000000);
      _isRegisterButtonClickable = true;
    }

    _titleController.addListener(() {
      _setRegisterButtonColor();
    });

    _bodyController.addListener(() {
      _setRegisterButtonColor();
    });
  }

  void _setRegisterButtonColor() {
    _isTitleEmpty = _titleController.text.isEmpty;
    _isBodyEmpty = _bodyController.document.isEmpty();
    if (_isTitleEmpty || _isBodyEmpty || _isCategoryEmpty) {
      setState(() {
        _registerButtonFillColor = const Color(0xfff4f4f4);
        _registerButtonTextColor = const Color(0xffaaaaaa);
        _isRegisterButtonClickable = false;
      });
    } else {
      setState(() {
        _registerButtonFillColor = const Color(0xffffec6a);
        _registerButtonTextColor = const Color(0x99000000);
        _isRegisterButtonClickable = true;
      });
    }
  }

  Future<void> _loadFromAssets() async {
    _selectedCategory = _postData.category;
    _selectedCategoryIndex = _postData.categoryIndex;
    _isCategoryEmpty = _selectedCategory == "testPage";
    if (!_isCategoryEmpty) {
      _pageType = _selectedCategory;
      _selectedCategoryText = _selectedCategory != "boardReview"
          ? YrkMbsListData.getLabelList(
              _selectedCategory)[_selectedCategoryIndex]
          : YrkMbsListData.getLabelList(
                  _selectedCategory)[_selectedCategoryIndex] +
              "후기";
    }

    _titleController.text = _postData.title;
    _isTitleEmpty = _titleController.text.isEmpty;

    if (_postData.body != "") {
      _document = Document.fromJson(jsonDecode(_postData.body));
      _isBodyEmpty = false;
    } else {
      _document = Document();
      _isBodyEmpty = true;
    }

    setState(() {
      _bodyController = QuillController(
          document: _document,
          selection: const TextSelection.collapsed(offset: 0));
    });

    _setMbsList();
  }

  void _setMbsList() {
    _mbsType = YrkMbsType.radioButton;
    if (_pageType == RootPageItem.home || _pageType == RootPageItem.board) {
      _mbsTitleList = [
        YrkMbsListData.getTitleList("boardReview"),
        YrkMbsListData.getTitleList("boardQna"),
        YrkMbsListData.getTitleList("boardJobFinding"),
      ];
      _mbsLabelList = [
        YrkMbsListData.getLabelList("boardReview"),
        YrkMbsListData.getLabelList("boardQna"),
        YrkMbsListData.getLabelList("boardJobFinding")
      ].expand((element) => element).toList();
      _mbsLabelCountPerTitleList = [
        YrkMbsListData.getLabelList("boardReview").length,
        YrkMbsListData.getLabelList("boardQna").length,
        YrkMbsListData.getLabelList("boardJobFinding").length,
      ];
    } else {
      _mbsLabelList = YrkMbsListData.getLabelList(_pageType);
      _mbsTitleList = [YrkMbsListData.getTitleList(_pageType)];
      _mbsLabelCountPerTitleList = [
        YrkMbsListData.getLabelList(_pageType).length
      ];
    }
  }

  @override
  void dispose() {
    _titleController.removeListener(() {
      _setRegisterButtonColor();
    });
    _titleController.dispose();
    _bodyController.removeListener(() {
      _setRegisterButtonColor();
    });
    _bodyController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(147.0),
          child: Column(children: <Widget>[
            // [1] 1st AppBar - Clear & Save
            Container(
                width: double.maxFinite,
                height: 49.0,
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: const Color(0xffe5e5e5))),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      YrkIconButton(
                        onTap: () => _onTapClearButton(context),
                        icon: "icon_clear.svg",
                        iconSize: 24.0,
                      ),
                      Spacer(),
                      YrkButton(
                        buttonType: ButtonType.solid,
                        label: "등록",
                        clickable: _isRegisterButtonClickable,
                        onPressed: () => _onPressedRegister(context),
                        width: 48.0,
                        height: 24.0,
                        fillColor: _registerButtonFillColor,
                        textStyle: YrkTextStyle(
                          fontWeight: FontWeight.w500,
                          color: _registerButtonTextColor,
                        ),
                      )
                    ],
                  ),
                )),
            // [2] 2nd AppBar - Select Category
            InkWell(
                onTap: () => showYrkModalBottomSheet(
                    context: context,
                    titleList: _mbsTitleList,
                    labelList: _mbsLabelList,
                    labelCountPerTitleList: _mbsLabelCountPerTitleList,
                    type: _mbsType,
                    defaultRadioGroupIndex: _selectedCategoryIndex,
                    onTap: (index) => _onTapModelBottomSheetRadioButton(index)),
                child: Container(
                    width: double.maxFinite,
                    height: 49.0,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: const Color(0xffe5e5e5))),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: _isCategoryEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                    Text("게시글의 카테고리를 선택해주세요",
                                        style: const YrkTextStyle(),
                                        textAlign: TextAlign.left),
                                    Spacer(),
                                    YrkIconButton(
                                      icon: "icon_navigate_next.svg",
                                      iconSize: 24,
                                    )
                                  ])
                            : Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _selectedCategoryText,
                                  style: const YrkTextStyle(),
                                ))))),
            // [3] 3rd AppBar - Title
            Container(
              width: double.maxFinite,
              height: 49.0,
              decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 1, color: const Color(0xffe5e5e5))),
              ),
              alignment: Alignment.center,
              child: YrkTextField(
                  textFieldType: TextFieldType.comment,
                  fillColor: const Color(0xfffffff),
                  borderColor: const Color(0xffffffff),
                  controller: _titleController,
                  label: "제목을 입력하세요 (필수)"),
            ),
          ])),
      // [4] Body - TextField
      body: Padding(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 40.0),
          child: QuillEditor(
            controller: _bodyController,
            readOnly: false,
            autoFocus: false,
            focusNode: _focusNode,
            scrollable: true,
            scrollController: _scrollController,
            padding: EdgeInsets.all(0),
            expands: false,
          )),
      // [5] Bottom - Get photo & temp save
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: BottomAppBar(
          notchMargin: 0.0,
          child: Container(
              width: double.maxFinite,
              height: 40.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    YrkImagePicker(
                        icon: YrkIconButton(
                            icon: 'icon_photo_library.svg',
                            width: 24.0,
                            height: 24.0),
                        onImagePickCallback: _onImagePickCallback),
                    Spacer(),
                    YrkButton(
                      buttonType: ButtonType.text,
                      label: "임시저장",
                      onPressed: _onPressedTempSave,
                      textStyle: YrkTextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _onTapModelBottomSheetRadioButton(int index) {
    _setSelectedCategory(index);
    _setRegisterButtonColor();
  }

  void _setSelectedCategory(int index) {
    _isCategoryEmpty = false;
    if (_pageType == RootPageItem.home || _pageType == RootPageItem.board) {
      if (index < _mbsLabelCountPerTitleList[0]) {
        _selectedCategoryIndex = index;
        _selectedCategory = "boardReview";
        _selectedCategoryText = _mbsLabelList[index] + " 후기";
      } else if (index >= _mbsLabelCountPerTitleList[0] &&
          index <
              _mbsLabelCountPerTitleList[0] + _mbsLabelCountPerTitleList[1]) {
        _selectedCategoryIndex = index - _mbsLabelCountPerTitleList[0];
        _selectedCategory = "boardQna";
        _selectedCategoryText = _mbsLabelList[index];
      } else {
        _selectedCategoryIndex = index -
            _mbsLabelCountPerTitleList[0] -
            _mbsLabelCountPerTitleList[1];
        _selectedCategory = "boardJobFinding";
        _selectedCategoryText = _mbsLabelList[index];
      }
    } else {
      _selectedCategoryIndex = index;
      _selectedCategory = _pageType;
      if (_pageType == "boardReview")
        _selectedCategoryText = _mbsLabelList[index] + " 후기";
      else
        _selectedCategoryText = _mbsLabelList[index];
    }
  }

  void _onPressedRegister(BuildContext context) {
    PostData data = PostData(
        _titleController.text,
        jsonEncode(_bodyController.document.toDelta().toJson()),
        _selectedCategory,
        _selectedCategoryIndex);
    testPostData.add(data);
    Navigator.pop(context);
  }

  void _onPressedTempSave() {
    if (_isTitleEmpty && _isBodyEmpty && _isCategoryEmpty) {
      Fluttertoast.showToast(
        msg: "글 작성 후 임시저장을 해주세요",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff616161),
        textColor: const Color(0xe6ffffff),
        fontSize: 14.0,
      );
    } else {
      String title = _titleController.text;
      String body = jsonEncode(_bodyController.document.toDelta().toJson());
      PostData newTempPost =
          PostData(title, body, _selectedCategory, _selectedCategoryIndex);
      tempPostData.add(newTempPost);
      _tempTitle = title;
      _tempBody = body;
      _tempCategoryIndex = _selectedCategoryText;
      Fluttertoast.showToast(
        msg: "글이 임시저장 되었습니다",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff616161),
        textColor: const Color(0xe6ffffff),
        fontSize: 14.0,
      );
    }
  }

  void _onTapClearButton(BuildContext context) {
    print(_isTitleEmpty.toString() +
        _isBodyEmpty.toString() +
        _isCategoryEmpty.toString());
    if ((_isTitleEmpty && _isBodyEmpty && _isCategoryEmpty) ||
        (_tempTitle == _titleController.text &&
            _tempBody ==
                jsonEncode(_bodyController.document.toDelta().toJson()) &&
            _tempCategoryIndex == _selectedCategoryText)) {
      Navigator.pop(context);
      return;
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            title: Container(
              height: 40.0,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 21.0, left: 21.0),
              child: YrkIconButton(
                onTap: () => Navigator.of(dialogContext).pop(),
                icon: "icon_clear.svg",
                padding: EdgeInsets.zero,
                iconSize: 24.0,
              ),
            ),
            titlePadding: EdgeInsets.zero,
            content: Text("글쓰기를 취소하시겠습니까?\n이 기기에 임시보관하면\n나중에 이어서 작성할 수 있습니다.",
                style: const YrkTextStyle(), textAlign: TextAlign.center),
            contentPadding: EdgeInsets.zero,
            actions: <Widget>[
              YrkButton(
                width: 256.0 / 288.0 * MediaQuery.of(context).size.width,
                height: 40.0,
                buttonType: ButtonType.solid,
                fillColor: const Color(0xffffec6a),
                label: "이 기기에 임시보관",
                textStyle: YrkTextStyle(
                  color: const Color(0xcc000000),
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  _onPressedTempSave();
                  Navigator.of(context).pop();
                },
              ),
              YrkButton(
                width: 256.0 / 288.0 * MediaQuery.of(context).size.width,
                height: 40.0,
                buttonType: ButtonType.solid,
                fillColor: const Color(0xffe5e5e5),
                label: "글쓰기 취소",
                textStyle: YrkTextStyle(
                  color: const Color(0x99000000),
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  Navigator.of(context).pop();
                },
              )
            ],
            actionsPadding: EdgeInsets.all(16.0),
            actionsOverflowButtonSpacing: 4.0,
          );
        });
  }

  Future<void> _onImagePickCallback(List<File> imageFiles) async {
    final index = _bodyController.selection.baseOffset;
    final length = _bodyController.selection.extentOffset - index;

    if (Platform.isAndroid || Platform.isIOS) {
      for (int i = imageFiles.length - 1; i >= 0; i--) {
        _bodyController.replaceText(
            index, length, BlockEmbed.image(imageFiles[i].path), null);
      }
    } else {
      _bodyController.replaceText(
          index, length, BlockEmbed.image(imageFiles[0].path), null);
    }
  }
}
