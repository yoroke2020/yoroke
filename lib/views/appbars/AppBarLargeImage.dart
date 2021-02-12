import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/views/appbars/AppBarYellow.dart';
import 'package:yoroke/views/widgets/YrkChipButtonLong.dart';

class AppBarLargeImage extends StatefulWidget implements PreferredSizeWidget {
  AppBarLargeImage(
      {@required this.titleText,
      @required this.subTitleText,
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
  final Function onButtonClicked;
  final bool widgetVisible;

  @override
  final Size preferredSize = Size.fromHeight(168);

  @override
  _AppBarLargeImageState createState() => _AppBarLargeImageState();
}

class _AppBarLargeImageState extends State<AppBarLargeImage> {
  @override
  Widget build(BuildContext context) {
    return  PreferredSize(
        preferredSize: widget.preferredSize,
        child: Container(
            width: double.maxFinite,
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
              )),
              Container(
                  child: Column(children: [
                AppBarYellow.getInstance(),
                Expanded(child: Container()),
                Container(
                    height: 24,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16),
                    child: Text(widget.titleText,
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
                  child: Text(widget.subTitleText,
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
                    child: InkWell(
                        onTap: _onTap,
                        child: Stack(children: <Widget>[
                          Offstage(
                            offstage: widget.widgetVisible,
                              child: YrkChipButtonLong(
                            buttonStyle: YrkChipButtonLongStyle.outline,
                          )),
                          Offstage(
                              offstage: !widget.widgetVisible,
                              child: YrkChipButtonLong(
                                buttonStyle: YrkChipButtonLongStyle.solid,
                              )),
                        ]))
                    )
              ]))
            ])));
  }

  void _onTap() {
    print("AppBarLargeTheme - onTap is called");
    widget.onButtonClicked();
  }
}
