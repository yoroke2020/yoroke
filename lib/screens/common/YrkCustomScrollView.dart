import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkScrollFadedWidget.dart';
import 'YrkTextStyle.dart';

class YrkCustomScrollView extends StatelessWidget {
  YrkCustomScrollView(
      {required this.controller,
      required this.appBar,
      this.flexibleSpace,
      this.bottom,
      required this.body,
      required this.bottomNavigatorBar,
      required this.appBarHeight,
      this.expandedHeight,
      this.flexibleSpaceHeight = 0,
      this.bottomHeight = 0,
      this.bottomNavigationHeight = 56.0,
      this.isFadedTitle = false,
      this.fadedTitle = "",
      this.isCenteredFadedTitle = false,
      this.isScrollable = true,
      this.itemExtent});

  final ScrollController controller;
  final Widget appBar;
  final Widget? flexibleSpace;
  final Widget? bottom;
  final Widget body;
  final Widget? bottomNavigatorBar;

  final double appBarHeight;
  final double? expandedHeight;
  final double flexibleSpaceHeight;
  final double bottomHeight;
  final double bottomNavigationHeight;

  final bool isFadedTitle;
  final String fadedTitle;
  final bool isCenteredFadedTitle;

  final bool isScrollable;
  final double? itemExtent;

  @override
  Widget build(BuildContext context) {
    double _itemExtent;
    if (itemExtent != null)
      _itemExtent = itemExtent!;
    else {
      if (expandedHeight != null)
        _itemExtent = MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            expandedHeight! -
            bottomNavigationHeight;
      else
        _itemExtent = MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            appBarHeight -
            bottomNavigationHeight;
    }

    return Scaffold(
      body: CustomScrollView(controller: controller, slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          snap: false,
          pinned: true,
          floating: false,
          centerTitle: false,
          titleSpacing: 0.0,
          shadowColor: const Color(0xffffffff),
          elevation: 0.0,
          toolbarHeight: appBarHeight,
          expandedHeight:
              expandedHeight != null ? expandedHeight : appBarHeight,
          backgroundColor: const Color(0xffffffff),
          title: Stack(
            children: <Widget>[
              appBar,
              isFadedTitle
                  ? YrkScrollFadedWidget(
                      scrollController: controller,
                      child: Container(
                          alignment: isCenteredFadedTitle
                              ? Alignment.center
                              : Alignment.centerLeft,
                          margin: isCenteredFadedTitle
                              ? EdgeInsets.zero
                              : EdgeInsets.only(left: 48.0),
                          height: 48.0,
                          child: Text(fadedTitle,
                              style: const YrkTextStyle(
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left)))
                  : Container(),
            ],
          ),
          flexibleSpace: flexibleSpace != null
              ? FlexibleSpaceBar(
                  background: Container(
                    height: flexibleSpaceHeight,
                    child: flexibleSpace!,
                  ),
                )
              : Container(),
          bottom: bottom != null
              ? PreferredSize(
                  child: bottom!, preferredSize: Size.fromHeight(bottomHeight))
              : PreferredSize(
                  child: Container(), preferredSize: Size.fromHeight(0)),
        ),
        isScrollable
            ? SliverToBoxAdapter(
                child: body,
              )
            : SliverFixedExtentList(
                itemExtent: _itemExtent,
                delegate: SliverChildBuilderDelegate((context, index) => body,
                    childCount: 1),
              )
      ]),
      bottomNavigationBar: bottomNavigatorBar,
    );
  }
}
