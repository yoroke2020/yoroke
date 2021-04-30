import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkScrollFadedWidget.dart';
import 'YrkTextStyle.dart';

class YrkCustomScrollView extends StatelessWidget {
  YrkCustomScrollView({
    this.controller,
    required this.appBar,
    this.flexibleSpace,
    this.bottom,
    required this.body,
    required this.bottomNavigatorBar,
    required this.appBarHeight,
    this.expandedHeight,
    this.flexibleSpaceHeight = 0,
    this.bottomHeight = 0,
    this.isFadedTitle = false,
    this.fadedTitle = "",
  });

  final ScrollController? controller;
  final Widget appBar;
  final Widget? flexibleSpace;
  final Widget? bottom;
  final Widget body;
  final Widget? bottomNavigatorBar;

  final double appBarHeight;
  final double? expandedHeight;
  final double? flexibleSpaceHeight;
  final double? bottomHeight;

  final bool? isFadedTitle;
  final String? fadedTitle;

  @override
  Widget build(BuildContext context) {
    bool isAvailable = controller != null ? isFadedTitle! : false;

    return Scaffold(
      body: CustomScrollView(controller: controller!, slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          snap: false,
          pinned: true,
          floating: false,
          centerTitle: false,
          titleSpacing: 0.0,
          toolbarHeight: appBarHeight,
          expandedHeight: expandedHeight != null
              ? expandedHeight
              : appBarHeight,
          backgroundColor: const Color(0xffffffff),
          title: Stack(
            children: <Widget>[
              appBar,
              isAvailable ? YrkScrollFadedWidget(
                  scrollController: controller!,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 48.0),
                      height: 48.0,
                      child: Text(fadedTitle!,
                          style: const YrkTextStyle(
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left))): Container(),
            ],
          ),
          flexibleSpace:
              flexibleSpace != null ? FlexibleSpaceBar(
                background: PreferredSize(
                  preferredSize: Size.fromHeight(flexibleSpaceHeight!),
                  child: flexibleSpace!,
                ),
              ) : Container(),
          bottom: bottom != null
              ? PreferredSize(
              child: bottom!, preferredSize: Size.fromHeight(bottomHeight!))
              : PreferredSize(
                  child: Container(), preferredSize: Size.fromHeight(0)),
        ),
        SliverToBoxAdapter(
          child: body,
        )
      ]),
      bottomNavigationBar: bottomNavigatorBar,
    );
  }
}
