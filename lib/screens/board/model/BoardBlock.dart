import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'BoardBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardBlock extends YrkBlock2 {
  // BoardBlock() : super('Board');
  BoardBlock();
  factory BoardBlock.fromJson(Map<String, dynamic> json) =>
      _$BoardBlockFromJson(json);
  Map<String, dynamic> toJson() => _$BoardBlockToJson(this);
}
