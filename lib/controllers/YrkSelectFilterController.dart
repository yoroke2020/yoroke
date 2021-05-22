import 'package:flutter/cupertino.dart';

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
