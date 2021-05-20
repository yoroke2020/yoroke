import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextField.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: YrkAppBar(label: "프로필 편집", type: YrkAppBarType.arrowBackMidTitle),
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
                        child: YrkIconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 188,
                          icon: "assets/icons/account_circle_default.svg",
                        )),
                    YrkButton(
                      buttonType: ButtonType.chip,
                      label: '사진 변경하기',
                      textStyle: YrkTextStyle(fontWeight: FontWeight.bold),
                      onPressed: () {},
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: YrkTextField(
                        textFieldType: TextFieldType.board,
                        style: YrkTextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Text("요로케에 표시되는 사용자 이름입니다."),
                      height: 105,
                    ),
                  ],
                ),
              ),
              YrkButton(
                textStyle: YrkTextStyle(fontWeight: FontWeight.bold),
                buttonType: ButtonType.solid,
                label: "저장",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
