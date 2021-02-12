import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonType { solid, outline, text, chip, outlinechip, rect, image }

class YrkButton extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final bool disable;
  final bool clickable;
  final double fontSize;
  final Function onPress;

  final ButtonType type;

  final RoundedRectangleBorder radius =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(32));
  final Color btnColor = const Color(0xfff5df4d);
  final Color disableColor = const Color(0xffe8e8e8);

  YrkButton({
    Key key,
    @required this.type,
    this.width,
    this.height,
    this.label,
    this.disable = false,
    this.clickable = true,
    this.fontSize = 14,
    this.onPress,
  }) : super(key: key);

  Text getText(ButtonType type, String label, double fontSize) {
    TextStyle textStyle;

    switch (type) {
      case ButtonType.solid:
        textStyle = YrkBtnTxtStyle(fontSize: fontSize);
        break;
      case ButtonType.outline:
        textStyle = YrkBtnTxtStyle(fontWeight: FontWeight.bold);
        break;
      case ButtonType.chip:
        textStyle = YrkBtnTxtStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0x99000000),
            fontSize: this.fontSize);
        break;
      case ButtonType.text:
        textStyle = YrkBtnTxtStyle(fontWeight: FontWeight.bold);
        break;
      case ButtonType.image:
        textStyle = YrkBtnTxtStyle(fontWeight: FontWeight.bold);
        break;
      default:
        textStyle = YrkBtnTxtStyle(fontSize: fontSize);
        break;
    }

    return Text(label, style: textStyle, textAlign: TextAlign.center);
  }

  Widget getButton(
    ButtonType type,
    Text text,
    Function onPress,
    bool disable,
    bool clickable,
    double width,
    double height,
  ) {
    switch (type) {
      case ButtonType.solid:
        return FlatButton(
          minWidth: width = 100,
          height: height = 48,
          child: text,
          shape: radius,
          color: btnColor,
          onPressed: this.disable || !this.clickable ? null : onPress,
          disabledColor: this.clickable ? disableColor : btnColor,
        );

      case ButtonType.outline:
        return OutlineButton(
          child: text,
          shape: radius,
          borderSide: BorderSide(
            width: 2.0,
            color: btnColor,
          ),
          onPressed: this.disable || !this.clickable ? null : onPress,
          disabledBorderColor: this.clickable ? disableColor : btnColor,
        );

      case ButtonType.chip:
        return FlatButton(
          padding: EdgeInsets.all(0),
          minWidth: width = 60,
          height: height = 24,
          child: text,
          shape: radius,
          color: btnColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: this.disable || !this.clickable ? null : onPress,
          disabledColor: this.clickable ? disableColor : btnColor,
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
          color: btnColor,
          onPressed: this.disable || !this.clickable ? null : onPress,
          disabledBorderColor: this.clickable ? disableColor : btnColor,
        );

      case ButtonType.rect:
        return FlatButton(
          minWidth: width = 100,
          height: height = 48,
          child: text,
          color: btnColor,
          onPressed: this.disable || !this.clickable ? null : onPress,
          disabledColor: this.clickable ? disableColor : btnColor,
        );

      case ButtonType.text:
        return FlatButton(
          minWidth: width = 100,
          height: height = 48,
          child: text,
          onPressed: this.disable || !this.clickable ? null : onPress,
          disabledColor: this.clickable ? disableColor : btnColor,
        );
      // Todo: Image icon btn
      case ButtonType.image:
        return FlatButton(
          child: text,
          onPressed: this.disable || !this.clickable ? null : onPress,
          disabledColor: this.clickable ? disableColor : btnColor,
        );
      default:
        return FlatButton(
          minWidth: width = 100,
          height: height = 48,
          child: text,
          shape: radius,
          onPressed: this.disable || !this.clickable ? null : onPress,
          disabledColor: this.clickable ? disableColor : btnColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      padding: EdgeInsets.all(0),
      child: getButton(this.type, getText(this.type, this.label, this.fontSize),
          this.onPress, this.disable, this.clickable, this.width, this.height),
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
