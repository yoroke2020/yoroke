import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/screens/board/Board.dart';

import 'YrkBlockJson.dart';

part 'BoardBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardBlock extends YrkBlockJson {
  // BoardBlock() : super('Board');
  BoardBlock();
  factory BoardBlock.fromJson(Map<String, dynamic> json) =>
      _$BoardBlockFromJson(json);
  Map<String, dynamic> toJson() => _$BoardBlockToJson(this);
}
