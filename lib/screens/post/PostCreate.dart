import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/models/documents/nodes/embed.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/models/YrkMbsListData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/imagepickers/YrkImagePicker.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/mbs/YrkModelBottomSheet.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class PostCreate extends StatefulWidget {
  PostCreate({required this.data});

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
  SubPageItem _selectedCategory = SubPageItem.testPage;
  int _selectedCategoryIndex = -1;
  late String _selectedCategoryText;

  // Changes due to RegisterButton Activation
  late Color _registerButtonFillColor;
  late Color _registerButtonTextColor;
  bool _isRegisterButtonClickable = false;

  // Three checking fields to activate RegisterButton
  bool _isCategorySelected = false;
  bool _isTitleEmpty = true;
  bool _isBodyEmpty = true;

  @override
  void initState() {
    super.initState();
    _pageType = widget.data!.prevPageItem;
    _loadFromAssets();

    if (_isTitleEmpty || _isBodyEmpty || !_isCategorySelected) {
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
    if (_isTitleEmpty || _isBodyEmpty || !_isCategorySelected) {
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
    _selectedCategory = tempPostData.category;
    _selectedCategoryIndex = tempPostData.categoryIndex;
    _isCategorySelected = _selectedCategory != SubPageItem.testPage;
    if (_isCategorySelected) {
      _pageType = _selectedCategory;
      _selectedCategoryText = _selectedCategory != SubPageItem.boardReview
          ? YrkMbsListData.getLabelList(
              _selectedCategory)[_selectedCategoryIndex]
          : YrkMbsListData.getLabelList(
                  _selectedCategory)[_selectedCategoryIndex] +
              "후기";
    }

    _titleController.text = tempPostData.title;
    _isTitleEmpty = _titleController.text.isEmpty;

    if (tempPostData.body != "") {
      _document = Document.fromJson(jsonDecode(tempPostData.body));
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
        YrkMbsListData.getTitleList(SubPageItem.boardReview),
        YrkMbsListData.getTitleList(SubPageItem.boardQna),
        YrkMbsListData.getTitleList(SubPageItem.boardJobFinding),
      ];
      _mbsLabelList = [
        YrkMbsListData.getLabelList(SubPageItem.boardReview),
        YrkMbsListData.getLabelList(SubPageItem.boardQna),
        YrkMbsListData.getLabelList(SubPageItem.boardJobFinding)
      ].expand((element) => element).toList();
      _mbsLabelCountPerTitleList = [
        YrkMbsListData.getLabelList(SubPageItem.boardReview).length,
        YrkMbsListData.getLabelList(SubPageItem.boardQna).length,
        YrkMbsListData.getLabelList(SubPageItem.boardJobFinding).length,
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
                      child: _isCategorySelected
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _selectedCategoryText,
                                style: const YrkTextStyle(),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("게시글의 카테고리를 선택해주세요",
                                    style: const YrkTextStyle(),
                                    textAlign: TextAlign.left),
                                Spacer(),
                                SvgPicture.asset(
                                  "icon_navigate_next.svg",
                                  width: 24.0,
                                  height: 24.0,
                                )
                              ],
                            )),
                )),
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
    _isCategorySelected = true;
    if (_pageType == RootPageItem.home || _pageType == RootPageItem.board) {
      if (index < _mbsLabelCountPerTitleList[0]) {
        _selectedCategoryIndex = index;
        _selectedCategory = SubPageItem.boardReview;
        _selectedCategoryText = _mbsLabelList[index] + " 후기";
      } else if (index >= _mbsLabelCountPerTitleList[0] &&
          index <
              _mbsLabelCountPerTitleList[0] + _mbsLabelCountPerTitleList[1]) {
        _selectedCategoryIndex = index - _mbsLabelCountPerTitleList[0];
        _selectedCategory = SubPageItem.boardQna;
        _selectedCategoryText = _mbsLabelList[index];
      } else {
        _selectedCategoryIndex = index -
            _mbsLabelCountPerTitleList[0] -
            _mbsLabelCountPerTitleList[1];
        _selectedCategory = SubPageItem.boardJobFinding;
        _selectedCategoryText = _mbsLabelList[index];
      }
    } else {
      _selectedCategoryIndex = index;
      _selectedCategory = _pageType;
      if (_pageType == SubPageItem.boardReview)
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
    tempPostData = PostData("", "", SubPageItem.testPage, -1);
    Navigator.pop(context);
  }

  void _onPressedTempSave() {
    try {
      String title = _titleController.text;
      String body = jsonEncode(_bodyController.document.toDelta().toJson());
      tempPostData.title = title;
      tempPostData.body = body;
      tempPostData.category = _selectedCategory;
      tempPostData.categoryIndex = _selectedCategoryIndex;
      Fluttertoast.showToast(
        msg: "글이 임시저장 되었습니다",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff616161),
        textColor: const Color(0xe6ffffff),
        fontSize: 14.0,
      );
    } catch (error) {
      Fluttertoast.showToast(
        msg: "FAIL",
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
