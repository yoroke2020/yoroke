import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class YrkSelectFilter extends StatefulWidget {
  YrkSelectFilter(
      {this.width = -1,
      this.height = 30,
      this.margin = const EdgeInsets.all(0),
      required this.filterList,
      required this.controller,
      this.selectedColor = const Color(0xfff5df4d),
      this.selectedBorderColor = const Color(0xfff5df4d),
      this.unselectedColor = const Color(0xfff4f4f4),
      this.unselectedBorderColor = const Color(0xfff4f4f4),
      this.selectedTextStyle =
          const YrkTextStyle(color: const Color(0xe6000000)),
      this.unselectedTextStyle =
          const YrkTextStyle(color: const Color(0xff939597))});

  final double width;
  final double height;
  final EdgeInsets margin;
  final List<String> filterList;
  final YrkSelectFilterController controller;

  final Color selectedColor;
  final Color selectedBorderColor;
  final Color unselectedColor;
  final Color unselectedBorderColor;
  final YrkTextStyle selectedTextStyle;
  final YrkTextStyle unselectedTextStyle;

  @override
  _YrkSelectFilterState createState() => _YrkSelectFilterState();
}

class _YrkSelectFilterState extends State<YrkSelectFilter> {
  late double _width;

  List<Widget> _buildFilterButtons() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < widget.controller.length; i++) {
      list.add(_getColoredFilterButton(i));
    }
    return list;
  }

  Widget _getColoredFilterButton(int index) {
    return InkWell(
        onTap: () => _handleFilterSelection(index),
        child: AnimatedContainer(
            width: _width / widget.controller.length,
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.controller.index == index
                        ? widget.selectedBorderColor
                        : widget.unselectedBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: widget.controller.index == index
                    ? widget.selectedColor
                    : widget.unselectedColor),
            alignment: Alignment.center,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut,
            child: Text(widget.filterList[index],
                style: widget.controller.index == index
                    ? widget.selectedTextStyle
                    : widget.unselectedTextStyle)));
  }

  void _handleFilterSelection(int index) {
    if (widget.controller.index != index) {
      setState(() {
        // _boxColor[widget.controller.index] = const Color(0xfff4f4f4);
        // _textColor[widget.controller.index] = const Color(0xff939597);
        widget.controller.index = index;
        // _boxColor[index] = const Color(0xfff5df4d);
        // _textColor[index] = const Color(0xe6000000);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _width = widget.width != -1
        ? widget.width
        : MediaQuery.of(context).size.width -
            widget.margin.left -
            widget.margin.right;

    return Container(
        width: _width,
        height: widget.height,
        margin: widget.margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: const Color(0xfff4f4f4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[..._buildFilterButtons()],
        ));
  }
}

class YrkSelectFilterController extends ChangeNotifier {
  YrkSelectFilterController({int initialIndex = 0, required this.length})
      : assert(length >= 0),
        assert(initialIndex >= 0 && (length == 0 || initialIndex < length)),
        _index = initialIndex,
        _previousIndex = initialIndex;

  final int length;

  int get index => _index;
  int _index;

  set index(int value) {
    _changeIndex(value);
  }

  int get previousIndex => _previousIndex;
  int _previousIndex;

  bool get indexIsChanging => _indexIsChangingCount != 0;
  int _indexIsChangingCount = 0;

  void _changeIndex(int value) {
    assert(value >= 0 && (value < length || length == 0));
    assert(_indexIsChangingCount >= 0);
    if (value == _index || length < 2) return;
    _index = value;
    if (_previousIndex != _index) {
      _indexIsChangingCount += 1;
      notifyListeners();
      _previousIndex = _index;
      _indexIsChangingCount -= 1;
      notifyListeners();
    }
  }
}
