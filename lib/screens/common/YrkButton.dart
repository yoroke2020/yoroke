import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

enum ButtonType { solid, outline, text, chip, outlinechip, rect, image }

// ignore: must_be_immutable
class YrkButton extends StatefulWidget {
  double? width;
  double? height;
  final ButtonType buttonType;
  final String? label;

  VoidCallback? onPressed;

  // TextStyle
  YrkTextStyle? textStyle;

  final Color? fillColor;
  final Color? borderColor;
  final String? image;

  final double? borderWidth;

  bool? clickable;

  YrkButton({
    Key? key,
    required this.buttonType,
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
    this.textStyle,

    // ButtonStyle
    this.fillColor,
    this.borderColor,
    this.image = "",

    // Button Status
    this.clickable,
    this.borderWidth,
  }) : super(key: key);

  @override
  _YrkButtonState createState() => _YrkButtonState();
}

class _YrkButtonState extends State<YrkButton> {
  bool isRect = false;
  bool isChip = false;
  bool isBordered = false;
  bool isText = false;

  void setProp() {
    switch (widget.buttonType) {
      case ButtonType.solid:
        break;
      case ButtonType.rect:
        isRect = true;
        break;
      case ButtonType.outline:
        isBordered = true;
        break;
      case ButtonType.chip:
        isChip = false;
        break;
      case ButtonType.outlinechip:
        isBordered = true;
        isChip = false;
        break;
      case ButtonType.text:
        isChip = true;
        isText = true;
        break;
      case ButtonType.image:
        break;
      default:
        break;
    }
  }

  void setHeight() {
    double? _width;
    double? _height;

    if (widget.width == null) {
      if (widget.buttonType == ButtonType.chip ||
          widget.buttonType == ButtonType.outlinechip ||
          widget.buttonType == ButtonType.text) {
        _width = widget.label!.length * 9.0;
        print(MediaQuery.of(context).textScaleFactor);
        _height = widget.textStyle!.fontSize! + 4;
      } else {
        _width = widget.width ?? 328;
        _height = widget.height ?? 48;
      }
    } else {
      _width = widget.width ?? 328;
      _height = widget.height ?? 48;
    }

    widget.width = _width;
    widget.height = _height;
  }

  void setTextStyle() {
    if (widget.textStyle != null) return;

    Color? _fontColor = const Color(0xe6000000);
    FontWeight? _fontWeight = FontWeight.w400;

    switch (widget.buttonType) {
      case ButtonType.solid:
        break;
      case ButtonType.outline:
        break;
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

    widget.textStyle = YrkTextStyle(
      fontWeight: _fontWeight,
      color: _fontColor,
    );
  }

  Widget getChild() {
    Text ret = Text(
      widget.label ?? "",
      style: widget.textStyle,
      textAlign: TextAlign.center,
    );

    if (widget.buttonType != ButtonType.image) {
      return ret;
    }
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: widget.height! - 16,
            height: widget.height! - 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: YrkIconButton(
                icon: widget.image!,
                onTap: () {},
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          ret,
          Container(width: widget.height! - 16),
        ],
      ),
    );
  }

  ButtonStyle getButtonStyle() {
    double _radius = isRect ? 8 : 100;
    Color _fillColor = widget.fillColor ??
        (isBordered || isText ? Colors.transparent : Color(0xfff5df4d));
    Color _borderColor = widget.borderColor ??
        (isBordered ? Color(0xfff5df4d) : Colors.transparent);

    return OutlinedButton.styleFrom(
      primary: _fillColor,
      backgroundColor: _fillColor,
      alignment: Alignment.center,
      elevation: 0,
      padding: EdgeInsets.all(0),
      side: BorderSide(color: _borderColor, width: widget.borderWidth ?? 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setProp();
    setTextStyle();
    setHeight();

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        height: double.infinity,
        child: OutlinedButton(
          onPressed: widget.onPressed,
          child: getChild(),
          style: getButtonStyle(),
        ),
      ),
    );
  }
}
