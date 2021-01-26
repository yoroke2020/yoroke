import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YorokeDotsIndicator extends AnimatedWidget {
  YorokeDotsIndicator({
    this.controller,
    this.itemCount = 1,
    this.onPageSelected,
    this.selectedIndicatorColor: const Color(0xff939597),
    this.selectedBoarderColor: const Color(0xff939597),
    this.unselectedIndicatorColor: const Color(0xffffffff),
    this.unselectedBoarderColor: const Color(0xff939597),
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;

  Color selectedIndicatorColor;
  Color unselectedIndicatorColor;
  Color selectedBoarderColor;
  Color unselectedBoarderColor;

  Widget _buildDot(int index) {
    Color indicatorColor =
        (controller.page ?? controller.initialPage).round() == index
            ? selectedIndicatorColor
            : unselectedIndicatorColor;
    Color boarderColor =
        (controller.page ?? controller.initialPage).round() == index
            ? selectedBoarderColor
            : unselectedBoarderColor;
    return new Container(
      padding: EdgeInsets.all(4.0),
      child: new Center(
        child: new Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: indicatorColor,
                border: Border.all(color: boarderColor, width: 1),
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
