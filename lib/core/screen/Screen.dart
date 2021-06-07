import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';

abstract class ScreenState<T extends YrkBlock2> {
  late final YrkRequestContext _reqCtx; // context for draw widgets
  late final T _block; // top level block of a screen

  T get block => this._block;

  set block(T block) {
    this._block = block;
  }

  // void setBlock(T block) {
  //   this._block = block;
  // }

  void initBlock();
  void updateBlockOn(String action);

  YrkRequestContext get reqCtx => _reqCtx;
}
