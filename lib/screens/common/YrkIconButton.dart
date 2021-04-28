import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YrkIconButton extends InkWell {
  YrkIconButton({
    Key? key,
    required String iconFile,
    required Function() onPressed,
    double iconSize = double.infinity,
    EdgeInsets padding = EdgeInsets.zero,
    Color? color,
  }) : super(
            key: key,
            onTap: onPressed,
            child: Center(
              child: Container(
                padding: padding,
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(color: Colors.white),
                child: SvgPicture.asset(
                  iconFile,
                  width: iconSize,
                  height: iconSize,
                  color: color,
                ),
              ),
            ));
}
