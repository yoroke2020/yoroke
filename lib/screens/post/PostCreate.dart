import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/models/YrkMbsListData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkQuillIconButton.dart';
import 'package:yoroke/screens/common/mbs/YrkModelBottomSheet.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:path/path.dart';

class PostCreate extends StatefulWidget {
  PostCreate({required this.data});

  final YrkData? data;

  @override
  _PostCreateState createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  // Keyboard FocusNode for the Current PostCreate Page
  FocusNode _focusNode = FocusNode();

  // PostCreate Title Controller & Document
  TextEditingController _titleController = TextEditingController();

  // PostCreate Body Controller & Document
  late QuillController _bodyController;
  late Document _document;

  // ScrollController for the Current PostCreate Body
  ScrollController _scrollController = ScrollController();

  // PageType to notice which PageItem called PostCreate
  late SubPageItem pageType = widget.data!.prevPageItem;

  // Selected Category Index from ModalBottomSheet
  int selectedCategoryIndex = -1;

  // Changes due to RegisterButton Activation
  Color _registerButtonFillColor = const Color(0xfff4f4f4);
  Color _registerButtonTextColor = const Color(0xffaaaaaa);
  bool _isRegisterButtonClickable = false;

  // Three checking fields to activate RegisterButton
  bool _isCategorySelected = false;
  bool _isTitleEmpty = true;
  bool _isBodyEmpty = true;

  @override
  void initState() {
    super.initState();
    _loadFromAssets();
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
    _titleController.text = tempPostData.title;

    if (tempPostData.body != "")
      _document = Document.fromJson(jsonDecode(tempPostData.body));
    else
      _document = Document();

    setState(() {
      _bodyController = QuillController(
          document: _document,
          selection: const TextSelection.collapsed(offset: 0));
    });
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
                EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .padding
                    .top),
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
                        onTap: () => Navigator.pop(context),
                        icon: "assets/icons/icon_clear_24_px.svg",
                        width: 24.0,
                        height: 24.0,
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
                onTap: () =>
                    showYrkModalBottomSheet(
                        context: context,
                        title: YrkMbsListData.getTitleList(pageType),
                        labelList: YrkMbsListData.getLabelList(pageType),
                        type: YrkMbsType.radioButton,
                        defaultRadioGroupIndex: selectedCategoryIndex,
                        onTap: (index) =>
                            _onTapModelBottomSheetRadioButton(index)),
                child: Container(
                  width: double.maxFinite,
                  height: 49.0,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(width: 1, color: const Color(0xffe5e5e5))),
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: selectedCategoryIndex == -1
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("게시글의 카테고리를 선택해주세요",
                              style: const YrkTextStyle(),
                              textAlign: TextAlign.left),
                          Spacer(),
                          SvgPicture.asset(
                            "assets/icons/icon_navigate_next_24_px.svg",
                            width: 24.0,
                            height: 24.0,
                          )
                        ],
                      )
                          : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          YrkMbsListData.getLabelList(pageType)[selectedCategoryIndex],
                          style: const YrkTextStyle(),
                        ),
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
        offset: Offset(0.0, -1 * MediaQuery
            .of(context)
            .viewInsets
            .bottom),
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
                    YrkQuillImageButton(
                      icon: "assets/icons/icon_photo_library_24_px.svg",
                      imageSource: ImageSource.gallery,
                      controller: _bodyController,
                      onImagePickCallback: _onImagePickCallback,
                    ),
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
    _isCategorySelected = true;
    selectedCategoryIndex = index;
    _setRegisterButtonColor();
  }

  Future<String> _onImagePickCallback(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
    await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile.path.toString();
  }

  void _onPressedRegister(BuildContext context) {
    PostData data = PostData(_titleController.text,
        jsonEncode(_bodyController.document.toDelta().toJson()));
    testPostData.add(data);
    Navigator.pop(context);
  }

  void _onPressedTempSave() {
    try {
      String title = _titleController.text;
      String body = jsonEncode(_bodyController.document.toDelta().toJson());
      tempPostData.title = title;
      tempPostData.body = body;
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
}
