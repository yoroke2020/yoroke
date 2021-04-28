import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/appbars/AppBarArrowBack.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarArrowBack(
        label: "프로필 편집",
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.zero,
                          width: 188,
                          height: 188,
                          child: Image.asset(
                            "assets/icons/account_circle_default_24_px.png",
                            fit: BoxFit.fill,
                          ),
                        )),
                    YrkButton(
                      width: 98,
                      height: 24,
                      buttonType: ButtonType.solid,
                      label: '사진 변경하기',
                      onPressed: () {},
                    ),
                    YrkTextField(
                      textFieldType: TextFieldType.board,
                    ),
                    Container(
                      child: Text("요로케에 표시되는 사용자 이름입니다."),
                      height: 105,
                    ),
                  ],
                ),
              ),
              YrkButton(
                  buttonType: ButtonType.solid, label: "저장", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
