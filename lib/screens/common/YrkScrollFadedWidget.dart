import 'package:flutter/material.dart';

class YrkScrollFadedWidget extends StatefulWidget {
  YrkScrollFadedWidget(
      {Key? key,
        required this.scrollController,
        required this.child})
      : super(key: key);

  final ScrollController scrollController;
  final Widget child;

  @override
  _YrkScrollFadedWidgetState createState() => _YrkScrollFadedWidgetState();
}

class _YrkScrollFadedWidgetState extends State<YrkScrollFadedWidget> {
  late double _currentOpacityOffset;
  final double _fullOpacityOffset = 180.0;
  final double zeroOpacityOffset = 0;

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
    setState(() {
      _currentOpacityOffset = widget.scrollController.offset;
    });
  }

  double _calculateOpacity() {
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
    } else {
      if (_currentOpacityOffset <= _fullOpacityOffset)
        return 1;
      else if (_currentOpacityOffset >= zeroOpacityOffset)
        return 0;
      else
        return (_currentOpacityOffset - _fullOpacityOffset) /
            (zeroOpacityOffset - _fullOpacityOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _calculateOpacity(),
      child: widget.child,
    );
  }
}
