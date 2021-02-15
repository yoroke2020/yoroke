import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/views/widgets/YrkDotsIndicator.dart';

class YrkPageView extends StatelessWidget {
  YrkPageView({
    @required this.page,
    @required this.controller,
    this.viewWidth = double.maxFinite,
    this.viewHeight = 260.0,
    this.isIndicatorEnabled = false,
  });

  final List<Widget> page;
  final PageController controller;
  final double viewWidth;
  final double viewHeight;
  final bool isIndicatorEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: viewWidth,
            height: viewHeight,
            child: PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              itemCount: page.length,
              controller: controller,
              itemBuilder: (BuildContext context, int index) {
                return page[index];
              },
            )),
        isIndicatorEnabled
            ? Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
                child: new YrkDotsIndicator(
                  itemCount: page.length,
                  controller: controller,
                  onPageSelected: (int page) {
                    controller.animateToPage(page,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.ease);
                  },
                ))
            : Container()
      ],
    );
  }
}
