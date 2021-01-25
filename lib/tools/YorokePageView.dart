import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/tools/YorokeDotsIndicator.dart';

class YorokePageView extends StatelessWidget {
  YorokePageView({
    this.page,
    this.controller,
    this.isIndicatorEnabled = false,
  });

  final List<Widget> page;
  final PageController controller;
  final bool isIndicatorEnabled;

  Widget _buildListPageView() {
    return new AspectRatio(
        aspectRatio: 360 / 268,
        child: PageView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          itemCount: page.length,
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            return page[index];
          },
        ));
  }

  Widget _buildCircleIndicator() {
    return new AspectRatio(
        aspectRatio: 360 / 40,
        child: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new DotsIndicator(
              itemCount: page.length,
              controller: controller,
              onPageSelected: (int page) {
                controller.animateToPage(page,
                    duration: Duration(milliseconds: 100), curve: Curves.ease);
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
          ),
          child: _buildListPageView(),
        ),
        isIndicatorEnabled
            ? Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
                child: _buildCircleIndicator())
            : Container()
      ],
    );
  }
}
