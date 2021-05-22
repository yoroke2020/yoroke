import 'dart:math';

import 'package:flutter/material.dart';

class YrkScrollOpacity extends StatefulWidget {
  YrkScrollOpacity(
      {Key? key,
      required this.scrollController,
      required this.child,
      this.reversed = false})
      : super(key: key);

  final ScrollController scrollController;
  final Widget child;
  final bool reversed;

  @override
  _YrkScrollOpacityState createState() => _YrkScrollOpacityState();
}

class _YrkScrollOpacityState extends State<YrkScrollOpacity> {
  late double _currentOpacityOffset;
  late double _fullOpacityOffset = double.maxFinite;
  final double zeroOpacityOffset = 0;

  late Widget _child = widget.child;
  @override
  initState() {
    super.initState();
    _currentOpacityOffset = widget.scrollController.offset;
    widget.scrollController.addListener(_setOffset);
  }

  @override
  dispose() {
    widget.scrollController.removeListener(_setOffset);
    super.dispose();
  }

  void _setOffset() {
    if (_fullOpacityOffset == double.maxFinite)
      _fullOpacityOffset = widget.scrollController.position.maxScrollExtent;

    setState(() {
      _currentOpacityOffset = widget.scrollController.offset;
    });
  }

  double _calculate() {
    if (_fullOpacityOffset == zeroOpacityOffset)
      return 1;
    else if (_fullOpacityOffset > zeroOpacityOffset) {
      if (_currentOpacityOffset <= zeroOpacityOffset)
        return 0;
      else if (_currentOpacityOffset >= _fullOpacityOffset)
        return 1;
      else
        return (_currentOpacityOffset - zeroOpacityOffset) /
            (_fullOpacityOffset - zeroOpacityOffset);
    } else if (_currentOpacityOffset <= _fullOpacityOffset)
      return 1;
    else if (_currentOpacityOffset >= zeroOpacityOffset)
      return 0;
    else
      return (_currentOpacityOffset - _fullOpacityOffset) /
          (zeroOpacityOffset - _fullOpacityOffset);
  }

  double _calculateOpacity() {
    double result = widget.reversed ? 1 - _calculate() : _calculate();
    print(result);
    _child = result != 0 ? widget.child : Container();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _calculateOpacity(),
      child: _child,
    );
  }
}
