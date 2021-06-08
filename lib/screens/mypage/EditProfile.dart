import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:yoroke/screens/common/imagepickers/YrkImagePicker.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

import '../../main.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String _nickname;
  late ImageProvider _image;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _image = profileController.accountImage;
    _nickname = profileController.accountNickname;
    _textEditingController.text = _nickname;
    // _textEditingController..selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar:
            YrkAppBar(label: "프로필 편집", type: YrkAppBarType.arrowBackMidTitle),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: 73 / 592 * MediaQuery.of(context).size.height),
                  child: CircleAvatar(
                      radius: 94 / 592 * MediaQuery.of(context).size.height,
                      backgroundImage: _image,
                      backgroundColor: const Color(0xffffffff))),
              Padding(
                  padding: EdgeInsets.all(
                      8.0 / 592 * MediaQuery.of(context).size.height),
                  child: YrkImagePicker(
                      icon: YrkButton(
                        height: 24.0 / 592 * MediaQuery.of(context).size.height,
                        buttonType: ButtonType.chip,
                        label: '사진 변경하기',
                        clickable: false,
                        textStyle: YrkTextStyle(fontWeight: FontWeight.bold),
                        onPressed: () {},
                      ),
                      numPicks: 1,
                      onImagePickCallback: _onImagePickCallback)),
              Container(
                  margin: EdgeInsets.only(
                      top: 24.0 / 592 * MediaQuery.of(context).size.height,
                      bottom: 16.0 / 592 * MediaQuery.of(context).size.height,
                      left: 16.0,
                      right: 16.0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: const Color(0xffe5e5e5)))),
                  child: YrkTextField(
                      textFieldType: TextFieldType.board,
                      style: YrkTextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32),
                      controller: _textEditingController,
                      textAlign: TextAlign.center)),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: 71.0 / 592 * MediaQuery.of(context).size.height),
                  child: Text("요로케에 표시되는 사용자 이름입니다.",
                      style: const YrkTextStyle(
                          color: const Color(0x99000000), fontSize: 12.0))),
              YrkButton(
                  textStyle: YrkTextStyle(fontWeight: FontWeight.bold),
                  buttonType: ButtonType.solid,
                  label: "저장",
                  onPressed: () => _onPressedSaveButton(context))
            ])));
  }

  Future<void> _onImagePickCallback(List<File> imageFiles) async {
    _cropImage(imageFiles[0].path);
  }

  Future<Null> _cropImage(filePath) async {
    File? croppedImage = (await ImageCropper.cropImage(
        sourcePath: filePath,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: '',
          toolbarColor: const Color(0xfff5df4d),
          toolbarWidgetColor: const Color(0xfff5df4d),
          activeControlsWidgetColor: const Color(0xfff5df4d),
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
          hideBottomControls: true,
        ),
        iosUiSettings: IOSUiSettings(
          title: '',
        )));
    if (croppedImage != null) {
      setState(() {
        _image = FileImage(croppedImage);
      });
    }
  }

  void _onPressedSaveButton(BuildContext context) {
    profileController.accountImage = _image;
    profileController.accountNickname = _textEditingController.text;
    Navigator.pop(context, true);
  }
}
