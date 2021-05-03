import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/mbs/YrkModelBottomSheet.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

enum PostCreateType {
  boardReview,
  boardQna,
  boardJobFinding,
}

class PostCreate extends StatefulWidget {
  PostCreate({required this.data});

  final YrkData? data;

  @override
  _PostCreateState createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  int selectedCategoryIndex = -1;

  final List<String> labelList = ["요양병원", "요양원", "복지관", "경로당", "노인교실", "보호센터"];

  Widget _getCreatePostCategory(BuildContext context) {
    // ignore: missing_enum_constant_in_switch
    switch (widget.data!.postCreateType) {
      case PostCreateType.boardReview:
        return Container();
      case PostCreateType.boardQna:
        return Container();
      case PostCreateType.boardJobFinding:
        return Container();
    }
    return InkWell(
      onTap: () => _getBoardModalBottomSheet(context),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: selectedCategoryIndex == -1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("게시글의 카테고리를 선택해주세요",
                        style: const YrkTextStyle(), textAlign: TextAlign.left),
                    Spacer(),
                    Image.asset(
                      "assets/icons/icon_clear_24_px.png",
                      width: 24.0,
                      height: 24.0,
                    )
                  ],
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    labelList[selectedCategoryIndex] + " 후기",
                    style: const YrkTextStyle(),
                  ),
                )),
    );
  }

  void _getBoardModalBottomSheet(BuildContext context) {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return YrkModelBottomSheet(
              type: YrkModelBottomSheetType.createPost,
              title: "후기게시판",
              labelList: labelList,
              listHeight: 452.0,
              onTap: (index) => setState(() {
                    selectedCategoryIndex = index;
                  }));
        });
  }

  void _onPressedRegister() {}

  void _onTapAddImage() {}

  void _onPressedTempSave() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(147.0),
          child: Column(children: <Widget>[
            Container(
                width: double.maxFinite,
                height: 49.0,
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
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            child: Image.asset(
                                "assets/icons/icon_clear_24_px.png"),
                          )),
                      Spacer(),
                      YrkButton(
                        buttonType: ButtonType.solid,
                        label: "등록",
                        onPressed: _onPressedRegister,
                        width: 48.0,
                        height: 24.0,
                        fillColor: const Color(0xfff4f4f4),
                        textStyle: YrkTextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffaaaaaa),
                        ),
                      )
                    ],
                  ),
                )),
            Container(
                width: double.maxFinite,
                height: 49.0,
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: const Color(0xffe5e5e5))),
                ),
                child: _getCreatePostCategory(context)),
            Container(
                width: double.maxFinite,
                height: 49.0,
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: const Color(0xffe5e5e5))),
                ),
                child: YrkTextField(
                    textFieldType: TextFieldType.comment,
                    fillColor: const Color(0xfffffff),
                    borderColor: const Color(0xffffffff),
                    label: "제목을 입력하세요 (필수)")),
          ])),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "내용을 입력하세요",
          ),
          keyboardType: TextInputType.multiline,
          maxLines: 99999,
        ),
      )),
      bottomNavigationBar: BottomAppBar(
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
                  InkWell(
                      onTap: _onTapAddImage,
                      child: Container(
                          width: 24.0,
                          height: 24.0,
                          child: Image.asset(
                              "assets/icons/icon_clear_24_px.png"))),
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
    );
  }
}
