import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'BoardBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardBlock extends YrkBlock {
  BoardBlock() : super('BoardBlock');

  factory BoardBlock.fromJson(Map<String, dynamic> json) =>
      _$BoardBlockFromJson(json);
  Map<String, dynamic> toJson() => _$BoardBlockToJson(this);
}
