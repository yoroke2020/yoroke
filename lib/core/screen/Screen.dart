import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';

abstract class Screen<T extends YrkBlock> {
  late final YrkRequestContext _reqCtx; // context for draw widgets
  late final T _block; // top level block of a screen

  Screen(this._block, this._reqCtx);
  T makeBlock(YrkRequestContext reqCtx);

  T get block => _block;
  YrkRequestContext get reqCtx => _reqCtx;
}
