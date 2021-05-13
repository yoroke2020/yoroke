import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YrkIconButton extends InkWell {
  YrkIconButton({
    Key? key,
    required String icon,
    Function()? onTap,
    double? iconSize,
    double width = 24.0,
    double height = 24.0,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 4.0),
    Color? color,
    bool clickable = true,
  }) : super(
            key: key,
            child: Container(
              width: width + padding.left + padding.right,
              height: height + padding.top + padding.bottom,
              child: Center(
                child: Padding(
                  padding: padding,
                  child: SvgPicture.asset(
                    icon,
                    width: iconSize ?? width,
                    height: iconSize ?? height,
                    color: color,
                  ),
                ),
              ),
            ),
            splashColor: Colors.transparent,
            onTap: clickable ? onTap : null);
}
