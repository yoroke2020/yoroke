import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YrkTitleView extends StatelessWidget {
  YrkTitleView(
      {@required this.titleText,
      @required this.subTitleText,
      @required this.buttonText,
      this.buttonColor = const Color(0x00000000),
      this.buttonBorderColor = const Color(0xfff5df4d),
      this.buttonTextColor= const Color(0xfff5df4d)});

  final String titleText;
  final String subTitleText;
  final String buttonText;
  final Color buttonColor;
  final Color buttonBorderColor;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    // Color buttonColor = colorType == 0 ? ;
    // Color buttonBorderColor;
    // Color buttonTextColor;
    return Container(
        height: 168,
        child: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/icons/sample_image.png",
                  ),
                )),
          ),
          Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.5385274291038513, 1),
                end: Alignment(0.5381971597671509, 0),
                colors: [const Color(0xe6000000), const Color(0x4d000000)]),
            // image: new DecorationImage(
            //     image: new AssetImage(
            //       "assets/icons/card_sample_image.png",
            //     ),
            //     fit: BoxFit.fill,
            //   )
          )),
          Container(
              child: Column(children: [
            Container(
                height: 48,
                child: Row(children: [
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/icon_back_color_24_px.png",
                      height: 16,
                      width: 16,
                    ),
                    padding: EdgeInsets.only(left: 16),
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/icon_search_color_24_px.png",
                      height: 16,
                      width: 16,
                    ),
                    padding: EdgeInsets.only(right: 8),
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/icon_create_color_24_px.png",
                      height: 16,
                      width: 16,
                    ),
                    padding: EdgeInsets.only(right: 8),
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/icon_notification_color_24_px.png",
                      height: 16,
                      width: 16,
                    ),
                    padding: EdgeInsets.only(right: 16),
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ])),
            Expanded(child: Container()),
            Container(
                height: 24,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16),
                child: Text("요양병원 후기/리뷰",
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left)),
            Container(
              height: 20,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16),
              child: Text("요양병원 위주의 후기와 리뷰를 알아보세요",
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.left),
            ),
            Container(
                height: 48,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Container(
                    width: 98,
                    height: 24,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        border: Border.all(
                            color: buttonBorderColor, width: 1)),
                    child: Center(
                        child: Text("다른 후기 보기",
                            style: TextStyle(
                                color: buttonTextColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                            textAlign: TextAlign.center)))),
          ]))
        ]));
  }
}
