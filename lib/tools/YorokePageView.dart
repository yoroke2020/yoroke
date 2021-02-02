import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/tools/YorokeDotsIndicator.dart';

class YorokePageView extends StatelessWidget {
  YorokePageView({
    @required this.page,
    @required this.controller,
    @required this.viewRatio,
    this.isIndicatorEnabled = false,
  });

  final List<Widget> page;
  final PageController controller;
  final double viewRatio;
  final bool isIndicatorEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
            aspectRatio: viewRatio,
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
                child: new YorokeDotsIndicator(
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
