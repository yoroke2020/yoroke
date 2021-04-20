import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkButton.dart';
import 'package:yoroke/screens/common/YrkChipButtonLong.dart';

import 'package:yoroke/models/TestData.dart';
import 'AppBarYellow.dart';

class AppBarXLargeImage extends StatefulWidget implements PreferredSizeWidget {
  AppBarXLargeImage(
      {required this.titleText,
      required this.subTitleText,
      this.buttonColor = const Color(0x00000000),
      this.buttonBorderColor = const Color(0xfff5df4d),
      this.buttonTextColor = const Color(0xfff5df4d),
      this.onButtonClicked,
      this.widgetVisible});

  final String titleText;
  final String subTitleText;
  final Color buttonColor;
  final Color buttonBorderColor;
  final Color buttonTextColor;
  final Function? onButtonClicked;
  final bool? widgetVisible;

  @override
  final Size preferredSize = Size.fromHeight(168);

  @override
  _AppBarXLargeImageState createState() => _AppBarXLargeImageState();
}

class _AppBarXLargeImageState extends State<AppBarXLargeImage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            "assets/icons/icon_bookmark_24_px.png",
            width: 18,
            height: 18,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
      flexibleSpace: Image(
        image: AssetImage(testCardImage.elementAt(0)),
        fit: BoxFit.cover,
      ),
      bottom: PreferredSize(
          preferredSize: widget.preferredSize,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 24,
                    width: 88,
                    child: new YrkButton(
                      buttonType: ButtonType.chip,
                      clickable: true,
                      onPressed: () {},
                      label: "복지시설",
                      fontSize: 14.0,
                      width: 88,
                    )),
                Container(
                    // height: 24,
                    child: Text(widget.titleText,
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 32.0),
                        textAlign: TextAlign.left)),
                Container(
                  // height: 20,
                  child: Text(widget.subTitleText,
                      style: const TextStyle(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          )),
    );
    // return PreferredSize(
    //     preferredSize: widget.preferredSize,
    //     child: Container(
    //         width: double.maxFinite,
    //         child: Stack(children: <Widget>[
    //           Container(
    //             decoration: BoxDecoration(
    //                 color: Colors.transparent,
    //                 image: DecorationImage(
    //                   fit: BoxFit.fill,
    //                   image: AssetImage(
    //                     "assets/icons/sample_image.png",
    //                   ),
    //                 )),
    //           ),
    //           Container(
    //               decoration: BoxDecoration(
    //             gradient: LinearGradient(
    //                 begin: Alignment(0.5385274291038513, 1),
    //                 end: Alignment(0.5381971597671509, 0),
    //                 colors: [const Color(0xe6000000), const Color(0x4d000000)]),
    //           )),
    //           Container(
    //               padding: EdgeInsets.all(16),
    //               child: Column(children: [
    //                 AppBarYellow.getInstance()!,
    //                 Expanded(child: Container()),
    //                 Container(
    //                     height: 24,
    //                     width: 88,
    //                     alignment: Alignment.bottomLeft,
    //                     child: new YrkButton(
    //                       buttonType: ButtonType.chip,
    //                       clickable: true,
    //                       onPressed: () {},
    //                       label: "복지시설",
    //                       fontSize: 14.0,
    //                       width: 18,
    //                     )),
    //                 Container(
    //                     height: 24,
    //                     alignment: Alignment.centerLeft,
    //                     padding: EdgeInsets.only(left: 16),
    //                     child: Text(widget.titleText,
    //                         style: const TextStyle(
    //                             color: const Color(0xffffffff),
    //                             fontWeight: FontWeight.w500,
    //                             fontFamily: "NotoSansCJKkr",
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 16.0),
    //                         textAlign: TextAlign.left)),
    //                 Container(
    //                   height: 20,
    //                   alignment: Alignment.centerLeft,
    //                   padding: EdgeInsets.only(left: 16),
    //                   child: Text(widget.subTitleText,
    //                       style: const TextStyle(
    //                           color: const Color(0xffffffff),
    //                           fontWeight: FontWeight.w400,
    //                           fontFamily: "NotoSansCJKkr",
    //                           fontStyle: FontStyle.normal,
    //                           fontSize: 14.0),
    //                       textAlign: TextAlign.left),
    //                 ),
    //               ]))
    //         ])));
  }

  void _onTap() {
    print("AppBarLargeTheme - onTap is called");
    widget.onButtonClicked!();
  }
}
