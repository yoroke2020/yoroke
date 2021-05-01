import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YrkIconButton extends InkWell {
  YrkIconButton({
    Key? key,
    required String icon,
    required Function() onTap,
    double width = 24.0,
    double height = 24.0,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 4.0),
    Color? color,
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
                    width: width,
                    height: height,
                    color: color,
                  ),
                ),
              ),
            ),
            onTap: onTap);
}
