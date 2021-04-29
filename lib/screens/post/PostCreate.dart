import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';

enum PostCreateType {
  boardReview,
  boardQna,
  boardJobFinding,
}

class PostCreate extends StatelessWidget {
  PostCreate({required this.data});

  final YrkData? data;

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
                        btnColor: const Color(0xfff4f4f4),
                        fontSize: 14.0,
                        fontFamily: "NotoSansCJKKR",
                        fontWeight: FontWeight.w500,
                        fontColor: const Color(0xffaaaaaa),
                        fontStyle: FontStyle.normal,
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
                child: _getCreatePostCategory()),
            Container(
                width: double.maxFinite,
                height: 49.0,
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: const Color(0xffe5e5e5))),
                ),
                child: YrkTextField(
                    textFieldType: TextFieldType.rect,
                    fillColor: const Color(0xfffffff),
                    borderColor: const Color(0xffffffff),
                    label: "제목을 입력하세요 (필수)")),
          ])),
      body: ListView(
        children: <Widget>[
          Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Text("helloworld"))
        ],
      ),
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
                    fontColor: const Color(0xe6000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansCJKKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0,
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget _getCreatePostCategory() {
    // ignore: missing_enum_constant_in_switch
    switch (data!.postCreateType) {
      case PostCreateType.boardReview:
        return Container();
      case PostCreateType.boardQna:
        return Container();
      case PostCreateType.boardJobFinding:
        return Container();
    }
    return Container();
  }

  void _onPressedRegister() {}

  void _onTapAddImage() {}

  void _onPressedTempSave() {}
}