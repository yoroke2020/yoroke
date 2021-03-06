import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

import 'buttons/YrkIconButton.dart';

class YrkStarRating extends StatelessWidget {
  const YrkStarRating(
      {Key? key,
      required this.rating,
      required this.eachWidth,
      required this.eachHeight})
      : super(key: key);

  final double rating;
  final double eachWidth;
  final double eachHeight;

  List<Widget> _buildStarRating() {
    List<Widget> list = <Widget>[];
    int filledStarCount = (this.rating).floor();
    for (int i = 0; i < filledStarCount; i++) {
      list.add(YrkIconButton(
          padding: const EdgeInsets.all(0),
          width: eachWidth,
          height: eachHeight,
          icon: "icon_grade_fill.svg"));
    }
    for (int i = 0; i < 5 - filledStarCount; i++) {
      list.add(YrkIconButton(
          padding: const EdgeInsets.all(0),
          width: eachWidth,
          height: eachHeight,
          icon: "icon_grade.svg"));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[..._buildStarRating()]);
  }
}
