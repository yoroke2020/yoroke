import 'package:flutter/cupertino.dart';

class YrkSizeController extends ChangeNotifier {
  YrkSizeController({Size initialSize = const Size(0, 0)})
      : _size = initialSize,
        _previousSize = initialSize;

  Size get size => _size;
  Size _size;

  set size(Size value) {
    _changeSize(value);
  }

  Size get previousSize => _previousSize;
  Size _previousSize;

  bool get sizeIsChanging => _sizeIsChangingCount != 0;
  int _sizeIsChangingCount = 0;

  void _changeSize(Size value) {
    assert(_sizeIsChangingCount >= 0);
    if (value.height == _size.height && value.width == _size.width) return;
    _size = value;
    if (_previousSize.height != _size.height ||
        _previousSize.width != _size.width) {
      _sizeIsChangingCount += 1;
      notifyListeners();
      _previousSize = _size;
      _sizeIsChangingCount -= 1;
      notifyListeners();
    }
  }
}
