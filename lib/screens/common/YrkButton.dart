import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonType { solid, outline, text, chip, outlinechip, rect, image }

// ignore: must_be_immutable
class YrkElevatedButton extends ElevatedButton {
  YrkElevatedButton({
    Key? key,
    required VoidCallback? onPressed,
    // VoidCallback? onLongPress,
    // ButtonStyle? style,
    // FocusNode? focusNode,
    // bool autofocus = false,
    // Clip clipBehavior = Clip.none,
    required Widget? child,
    // required this.label,
  }) : super(
          key: key,
          onPressed: onPressed,
          // onLongPress: onLongPress,
          // style: style,
          // focusNode: focusNode,
          // autofocus: autofocus,
          clipBehavior: Clip.none,
          child: child,
          //Custom
          style: ElevatedButton.styleFrom(
            primary: const Color(0xfff5df4d),
            alignment: Alignment.center,
            elevation: 0,
          ),
        );
}

// ignore: must_be_immutable
class YrkButton extends StatefulWidget {
  double? width;
  double? height;
  final ButtonType buttonType;
  final String? label;

  VoidCallback? onPressed;

  // TextStyle
  final Color? fontColor;
  final double? fontHeight;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final double? letterSpacing;

  final Color? btnColor;
  final Color? outlineBackgroundColor;
  final String? img;

  bool? clickable;

  YrkButton({
    Key? key,
    required this.buttonType,
    this.width,
    this.height,
    required this.label,

    // Default
    required this.onPressed,

    // TextStyle
    this.fontColor,
    this.fontHeight,
    this.fontSize = 14,
    this.fontWeight,
    this.fontFamily,
    this.fontStyle,
    this.letterSpacing,

    // ButtonStyle
    this.btnColor,
    this.outlineBackgroundColor,
    this.img = "assets/icons/thumb_up_16_px.png",

    // Button Status
    this.clickable,
  }) : super(key: key);

  @override
  _YrkButtonState createState() => _YrkButtonState();
}

class _YrkButtonState extends State<YrkButton> {
  Widget getChild() {
    Color? _fontColor = widget.fontColor ?? const Color(0xe6000000);
    double? _fontHeight = widget.fontHeight ?? 1;
    double? _fontSize = widget.fontSize ?? 14.0;
    FontWeight? _fontWeight = widget.fontWeight ?? FontWeight.w400;
    String? _fontFamily = widget.fontFamily ?? 'NotoSansCJKkr';
    FontStyle? _fontStyle = widget.fontStyle ?? FontStyle.normal;
    double? _letterSpacing = widget.letterSpacing ?? -0.28;

    switch (widget.buttonType) {
      case ButtonType.solid:
        break;
      case ButtonType.outline:
      case ButtonType.text:
      case ButtonType.image:
        _fontWeight = FontWeight.bold;
        break;
      case ButtonType.chip:
        _fontWeight = FontWeight.bold;
        _fontColor = const Color(0x99000000);
        break;
      default:
        break;
    }

    Text ret = Text(widget.label!,
        style: TextStyle(
          color: _fontColor,
          height: _fontHeight,
          letterSpacing: _letterSpacing,
          fontSize: _fontSize,
          fontWeight: _fontWeight,
          fontFamily: _fontFamily,
          fontStyle: _fontStyle,
        ),
        textAlign: TextAlign.center);
    if (widget.buttonType != ButtonType.image) {
      return ret;
    } else
      return (Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.asset(widget.img!,width: ,),
          Container(
            width: widget.fontSize! * 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(widget.img!),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          ret,
          Container(width: widget.fontSize! * 2),
        ],
      ));
  }

  ButtonStyle getButtonStyle() {
    double _radius = widget.buttonType == ButtonType.rect ? 8 : 100;
    Color _btnColor = widget.btnColor ?? const Color(0xfff5df4d);
    Color _outlineBackgroundColor = widget.btnColor ?? const Color(0xffffffff);

    switch (widget.buttonType) {
      case ButtonType.solid:
      case ButtonType.chip:
      case ButtonType.rect:
        return ElevatedButton.styleFrom(
          primary: _btnColor,
          alignment: Alignment.center,
          elevation: 0,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius)),
        );
      case ButtonType.outline:
      case ButtonType.outlinechip:
        return OutlinedButton.styleFrom(
          primary: _btnColor,
          alignment: Alignment.center,
          elevation: 0,
          padding: EdgeInsets.all(0),
          backgroundColor: _outlineBackgroundColor,
          side: BorderSide(color: _btnColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radius),
          ),
        );
      case ButtonType.text:
        return OutlinedButton.styleFrom(
          primary: _btnColor,
          alignment: Alignment.center,
          elevation: 0,
          padding: EdgeInsets.all(0),
        );
      case ButtonType.image:
        return ElevatedButton.styleFrom(
          primary: _btnColor,
          alignment: Alignment.center,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius)),
        );
      default:
        return ElevatedButton.styleFrom(
          primary: _btnColor,
          alignment: Alignment.center,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius)),
        );
    }
  }

  Widget getButton() {
    switch (widget.buttonType) {
      case ButtonType.solid:
      case ButtonType.chip:
      case ButtonType.rect:
        return ElevatedButton(
          onPressed: widget.onPressed,
          child: getChild(),
          style: getButtonStyle(),
        );

      case ButtonType.outline:
      case ButtonType.outlinechip:
        return OutlinedButton(
          onPressed: widget.onPressed,
          child: getChild(),
          style: getButtonStyle(),
        );

      case ButtonType.text:
        return TextButton(
          onPressed: widget.onPressed,
          child: getChild(),
          style: getButtonStyle(),
        );
      case ButtonType.image:
        return ElevatedButton(
          onPressed: widget.onPressed,
          child: getChild(),
          // icon: Image.asset(widget.img!),
          style: getButtonStyle(),
        );

      default:
        return YrkElevatedButton(
          key: widget.key,
          child: getChild(),
          onPressed: widget.onPressed,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = widget.width ?? 328;
    double _height = widget.height ?? 48;

    if (widget.buttonType == ButtonType.chip ||
        widget.buttonType == ButtonType.outlinechip ||
        widget.buttonType == ButtonType.text) {
      _width = widget.label!.length * widget.fontSize!;
      _height = widget.fontSize! + 4;
    }

    return Container(
      width: _width,
      height: _height,
      alignment: AlignmentDirectional.center,
      child: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        height: double.infinity,
        child: getButton(),
      ),
    );
  }
}
