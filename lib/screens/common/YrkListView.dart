import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/controllers/YrkSizeController.dart';
import 'YrkWidgetSize.dart';

class YrkListView extends StatefulWidget {
  YrkListView(
      {this.width = double.maxFinite,
      this.height = 120.0,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(0),
      this.scrollable = false,
      this.scrollDirection = Axis.vertical,
      @Deprecated("") this.pageIndex = 0,
      required this.item,
      @Deprecated("") this.itemCount = 0,
      @Deprecated("") this.itemMargin = const EdgeInsets.all(0),
      @Deprecated("") this.itemPadding = const EdgeInsets.all(0),
      this.isIndicator = false,
      this.sizeController});

  final Axis scrollDirection;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final EdgeInsets? itemMargin;
  final EdgeInsets? itemPadding;

  final int itemCount;
  final double width;
  final double height;
  final bool scrollable;
  final bool? isIndicator;
  final List<Widget> item;
  final int pageIndex;

  final YrkSizeController? sizeController;

  @override
  _YrkListViewState createState() => _YrkListViewState();
}

class _YrkListViewState extends State<YrkListView> {
  Size _childSize = Size(0, 0);

  late YrkSizeController _sizeController;

  @override
  void initState() {
    super.initState();
    _sizeController = widget.sizeController != null
        ? widget.sizeController!
        : YrkSizeController();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        removeLeft: true,
        removeRight: true,
        child: Container(
            width: widget.width,
            height: widget.scrollDirection != Axis.vertical
                ? widget.height
                : _childSize.height * widget.item.length,
            margin: widget.margin,
            padding: widget.padding,
            child: ListView.builder(
              scrollDirection: widget.scrollDirection,
              physics: widget.scrollable
                  ? new AlwaysScrollableScrollPhysics()
                  : new NeverScrollableScrollPhysics(),
              itemCount: widget.isIndicator!
                  ? widget.item.length + 1
                  : widget.item.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.isIndicator! && index == widget.item.length) {
                  print("CircularProgressIndicator appears");
                  return CircularProgressIndicator();
                }
                return YrkWidgetSize(
                    onChanged: (Size size) {
                      setState(() {
                        _childSize = size;
                        print("size = " + (size.height * widget.item.length).toString());
                        _sizeController.size = widget.scrollDirection ==
                                Axis.vertical
                            ? Size(size.width, size.height * widget.item.length)
                            : size;
                      });
                    },
                    child: widget.item[index]);
              },
            )));
  }
}
