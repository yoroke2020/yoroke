import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: const Color(0xff939597),
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;

  Color color;
  Color boarder;

  Widget _buildDot(int index) {
    color = (controller.page ?? controller.initialPage).round() == index
        ? Color(0xfff5df4d)
        : Color(0xffffffff);
    boarder = (controller.page ?? controller.initialPage).round() == index
        ? Color(0xfff5df4d)
        : Color(0xff939597);
    return new Container(
      padding: EdgeInsets.all(4.0),
      child: new Center(
        child: new Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: color,
                border: Border.all(color: boarder, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(20)))
            // child: new InkWell(
            //    onTap: () => onPageSelected(index),
            // ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
