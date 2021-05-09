import 'package:flutter/material.dart';

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
      list.add(Container(
          width: eachWidth,
          height: eachHeight,
          decoration: BoxDecoration(color: const Color(0x00000000)),
          child: Image.asset("assets/icons/icon_grade_fill_24_px.png")));
    }
    for (int i = 0; i < 5 - filledStarCount; i++) {
      list.add(Container(
          width: eachWidth,
          height: eachHeight,
          decoration: BoxDecoration(color: const Color(0x00000000)),
          child: Image.asset("assets/icons/icon_grade_24_px.png")));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(top: 3),
        width: this.eachWidth * 5,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[..._buildStarRating()]));
  }
}
