import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/post/PostCreateImageUpload.dart';
import 'package:path/path.dart';

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
                  child: YrkButton(
                      height: 24.0 / 592 * MediaQuery.of(context).size.height,
                      buttonType: ButtonType.chip,
                      label: '사진 변경하기',
                      textStyle: YrkTextStyle(fontWeight: FontWeight.bold),
                      onPressed: () => onPressedChangePhoto(context))),
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
                  onPressed: () => _onPressedSave(context))
            ])));
  }

  void onPressedChangePhoto(BuildContext context) async {
    final pickedFiles = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => PostCreateImageUpload()));
    if (pickedFiles == null) return;
    print(pickedFiles);
    List<File> files = pickedFiles as List<File>;
    List<String> imageUrls = [];
    if (files[0].path == "camera") {
      final cameraFile =
          await ImagePicker().getImage(source: ImageSource.camera);
      imageUrls.add(await _onImagePickCallback(File(cameraFile!.path)));
    } else {
      for (int i = 0; i < files.length; i++)
        imageUrls.add(await _onImagePickCallback(File(files[i].path)));
    }

    setState(() {
      _image = FileImage(File(imageUrls[0]));
    });
  }

  Future<String> _onImagePickCallback(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
        await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile.path.toString();
  }

  void _onPressedSave(BuildContext context) {
    profileController.accountImage = _image;
    profileController.accountNickname = _textEditingController.text;
    Navigator.pop(context, true);
  }
}
