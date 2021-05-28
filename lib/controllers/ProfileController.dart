import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  ProfileController()
      : _accountImage = AssetImage("assets/images/account_circle_default.png"),
        _accountNickname = "조문기";

  ImageProvider get accountImage => _accountImage;
  ImageProvider _accountImage;

  set accountImage(ImageProvider image) {
    _changeAccountImage(image);
  }

  String get accountNickname => _accountNickname;
  String _accountNickname;

  set accountNickname(String nickname) {
    _changeAccountNickname(nickname);
  }

  bool get isChanging => _isChangingCount != 0;
  int _isChangingCount = 0;

  bool get isImageChanging => _isImageChangingCount != 0;
  int _isImageChangingCount = 0;

  bool get isNicknameChanging => _isNicknameChangingCount != 0;
  int _isNicknameChangingCount = 0;

  void _changeAccountNickname(String nickname) {
    assert(_isChangingCount >= 0);
    assert(_isNicknameChangingCount >= 0);
    _isChangingCount += 1;
    _isNicknameChangingCount += 1;
    notifyListeners();
    _accountNickname = nickname;
    _isChangingCount -= 1;
    _isNicknameChangingCount -= 1;
    notifyListeners();
  }

  void _changeAccountImage(ImageProvider image) {
    assert(_isChangingCount >= 0);
    assert(_isImageChangingCount >= 0);
    _isChangingCount += 1;
    _isImageChangingCount += 1;
    notifyListeners();
    _accountImage = image;
    _isChangingCount -= 1;
    _isImageChangingCount -= 1;
    notifyListeners();
  }
}
