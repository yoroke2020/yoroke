import 'dart:core';

import 'package:yoroke/core/model/YrkModel.dart';

abstract class YrkBlock {
  String type;
  List<YrkBlock>? blocks;
  List<YrkModel>? items;

  factory YrkBlock.fromJson(Map<String, dynamic> json) => _YrkBlockImpl();
  Map<String, dynamic> toJson();

  YrkBlock findFirstBlockWhere(String type) {
    return this.blocks!.firstWhere((element) => element.type == type);
  }

  YrkBlock(this.type);
}

class _YrkBlockImpl implements YrkBlock {
  @override
  Map<String, dynamic> toJson() {
    return new Map();
  }

  @override
  List<YrkBlock>? blocks;

  @override
  List<YrkModel>? items;

  @override
  late String type;

  @override
  YrkBlock findFirstBlockWhere(String type) {
    return this.blocks!.firstWhere((element) => element.type == type);
  }
}
