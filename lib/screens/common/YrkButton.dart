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
  bool _isRect = false;
  bool _isChip = false;
  bool _isBordered = false;
  bool _isText = false;

  void setProp() {
    switch (widget.buttonType) {
      case ButtonType.solid:
        break;
      case ButtonType.rect:
        _isRect = true;
        break;
      case ButtonType.outline:
        _isBordered = true;
        break;
      case ButtonType.chip:
        _isChip = true;
        break;
      case ButtonType.outlinechip:
        _isChip = true;
        _isBordered = true;
        break;
      case ButtonType.text:
        _isChip = true;
        _isText = true;
        break;
      case ButtonType.image:
        break;
      default:
        break;
    }
  }

  void setHeight() {
    if (widget.width != null && widget.height != null) return;

    if (_isChip || _isText) {
      TextPainter textSize = TextPainter(
          text: TextSpan(text: widget.label, style: widget.textStyle),
          maxLines: 1,
          textDirection: TextDirection.ltr)
        ..layout(minWidth: 0, maxWidth: double.infinity);
      if (widget.width == null) widget.width = textSize.size.width + 30;
      if (widget.height == null) widget.height = textSize.size.height + 4;
    }
    widget.width = widget.width ?? 320;
    widget.height = widget.height ?? 48;
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
      softWrap: false,
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
    double _radius = _isRect ? 8 : 100;
    Color _fillColor = widget.fillColor ??
        (_isBordered || _isText ? Colors.transparent : Color(0xfff5df4d));
    Color _borderColor = widget.borderColor ??
        (_isBordered ? Color(0xfff5df4d) : Colors.transparent);

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
      child: OutlinedButton(
        onPressed: widget.onPressed,
        child: getChild(),
        style: getButtonStyle(),
      ),
    );
  }
}
