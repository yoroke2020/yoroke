import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonType { solid, outline, text, chip, outlinechip, rect, image }

class YrkButton extends StatelessWidget {
  double width;
  double height;
  final String label;
  final bool enable;
  final bool clickable;
  final double fontSize;
  final Function onPress;

  final ButtonType type;
  final Color btnColor;
  final Color fontColor;
  final Color outlineBtnColor;
  Text text;

  final String img;

  final RoundedRectangleBorder radius =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(100));
  final Color disableColor = const Color(0xffe8e8e8);

  YrkButton({
    Key key,
    @required this.type,
    this.width = double.infinity,
    this.height = double.infinity,
    this.label,
    this.enable = true,
    this.clickable = true,
    this.fontSize = 14,
    this.onPress,
    this.btnColor = const Color(0xfff5df4d),
    this.fontColor,
    this.outlineBtnColor = const Color(0xffffffff),
    this.img = "assets/icons/thumb_up_16_px.png",
  }) : super(key: key);

  Text getText(
    ButtonType type,
    String label,
    double fontSize,
    Color fontColor,
  ) {
    TextStyle textStyle;

    switch (type) {
      case ButtonType.solid:
        textStyle = YrkBtnTxtStyle(
          fontSize: fontSize,
          color: fontColor,
        );
        break;
      case ButtonType.outline:
        textStyle = YrkBtnTxtStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: FontWeight.bold,
        );
        break;
      case ButtonType.chip:
        textStyle = YrkBtnTxtStyle(
          fontWeight: FontWeight.bold,
          color: const Color(0x99000000),
          fontSize: fontSize,
        );
        break;
      case ButtonType.text:
        textStyle = YrkBtnTxtStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: fontColor,
        );
        break;
      case ButtonType.image:
        textStyle = YrkBtnTxtStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: FontWeight.bold,
        );
        break;
      default:
        textStyle = YrkBtnTxtStyle(
          fontSize: fontSize,
          color: fontColor,
        );
        break;
    }

    return Text(label, style: textStyle, textAlign: TextAlign.center);
  }

  Widget getButton() {
    switch (type) {
      case ButtonType.solid:
        return FlatButton(
          child: text,
          shape: radius,
          color: btnColor,
          onPressed: !(enable && clickable) ? null : onPress,
          disabledColor: clickable ? disableColor : btnColor,
        );

      case ButtonType.outline:
        return OutlineButton(
          child: text,
          shape: radius,
          borderSide: BorderSide(
            width: 2.0,
            color: btnColor,
          ),
          color: outlineBtnColor,
          onPressed: !(enable && clickable) ? null : onPress,
          disabledBorderColor: clickable ? disableColor : btnColor,
        );

      case ButtonType.chip:
        width = 60;
        height = 24;
        return FlatButton(
          padding: EdgeInsets.all(0),
          child: text,
          shape: radius,
          color: btnColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: !(enable && clickable) ? null : onPress,
          disabledColor: clickable ? disableColor : btnColor,
        );

      case ButtonType.outlinechip:
        return OutlineButton(
          padding: EdgeInsets.all(0),
          child: text,
          shape: radius,
          borderSide: BorderSide(
            width: 2.0,
            color: btnColor,
          ),
          color: outlineBtnColor,
          onPressed: !(enable && clickable) ? null : onPress,
          disabledBorderColor: clickable ? disableColor : btnColor,
        );

      case ButtonType.rect:
        return FlatButton(
          child: text,
          shape: radius,
          onPressed: !(enable && clickable) ? null : onPress,
          disabledColor: clickable ? disableColor : btnColor,
        );

      case ButtonType.text:
        return FlatButton(
          child: text,
          onPressed: !(enable && clickable) ? null : onPress,
          disabledColor: clickable ? disableColor : btnColor,
        );
      // Todo: Image icon btn
      case ButtonType.image:
        return FlatButton(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: this.fontSize * 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(img),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16), //모서리를 둥글게
                    // border: Border.all(color: Colors.black, width: 3),
                  ),
                ),
                text,
                Container(
                  width: this.fontSize * 2,
                ),
              ],
            ),
          ),
          shape: radius,
          color: btnColor,
          onPressed: !(enable && clickable) ? null : onPress,
          disabledColor: clickable ? disableColor : btnColor,
        );
      default:
        return FlatButton(
          child: text,
          shape: radius,
          onPressed: !(enable && clickable) ? null : onPress,
          disabledColor: clickable ? disableColor : btnColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    text = getText(type, label, fontSize, fontColor);
    if (type == ButtonType.chip || type == ButtonType.outlinechip) {
      width = 60;
      height = 24;
    }
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: getButton(),
      ),
      alignment: AlignmentDirectional.center,
    );
  }
}

class YrkBtnTxtStyle extends TextStyle {
  final Color color;
  final double height;
  final double letterSpacing;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final FontStyle fontStyle;

  const YrkBtnTxtStyle({
    this.color = const Color(0xe6000000),
    this.fontSize = 14.0,
    this.height = 1,
    this.letterSpacing = 0,
    this.fontWeight = FontWeight.w400,
    this.fontFamily = 'NotoSansCJKkr',
    this.fontStyle = FontStyle.normal,
  }) : super(
          color: color,
          height: height,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          fontStyle: FontStyle.normal,
        );
}
