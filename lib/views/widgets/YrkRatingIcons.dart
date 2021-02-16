import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';

class YrkRatingIcons extends StatelessWidget {
  YrkRatingIcons({@required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return _widget();
  }

  Widget _widget() {
    List<Widget> list = List<Widget>();
    if (testNumber[this.index] == -1)
      return Container();
    else {
      for (int i = 0; i < testNumber[this.index]; i++) {
        list.add(Icon(
          Icons.star,
          color: const Color(0xfff5df4d),
          size: 12,
        ));
      }
      for (int i = 0; i < 5 - testNumber[this.index]; i++) {
        list.add(
            Icon(Icons.star_border, color: const Color(0xff939597), size: 12));
      }
      return Wrap(children: list);
    }
  }
}
