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
              width: (iconSize ?? width) + padding.left + padding.right,
              height: (iconSize ?? height) + padding.top + padding.bottom,
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/" + icon,
                  width: iconSize ?? width,
                  height: iconSize ?? height,
                  color: color,
                ),
              ),
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: clickable ? onTap : null);
}
