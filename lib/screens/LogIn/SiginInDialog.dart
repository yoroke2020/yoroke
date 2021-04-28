import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/login/SingInNickname.dart';

class SignInDialog extends StatefulWidget {
  @override
  _SignInDialogState createState() => _SignInDialogState();
}

class _SignInDialogState extends State<SignInDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: YrkAppBar(
        appBarType: AppBarType.back,
        context: context,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(16.0),
          color: Color(0x4d000000),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(17),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(16.0),
                  color: Color(0xffffffff),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.asset('assets/icons/icon_naver.png'),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "요로케",
                                  style: YrkTextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -0.32,
                                  ),
                                ),
                                Text(
                                  "Team name",
                                  style: YrkTextStyle(
                                    fontSize: 10.0,
                                    color: Color(0x99000000),
                                    letterSpacing: -0.2,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Color(0x4d000000),
                    ),
                    Container(
                      height: 56,
                      child: YrkButton(
                        buttonType: ButtonType.text,
                        label: "동의하고 계속하기",
                        clickable: true,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInNickname()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 328,
              height: 48,
              child: YrkButton(
                buttonType: ButtonType.text,
                label: "취소",
                clickable: true,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
