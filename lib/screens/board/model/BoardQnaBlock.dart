import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'BoardQnaBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardQnaBlock extends YrkBlock {
  BoardQnaBlock() : super('BoardQna');

  factory BoardQnaBlock.fromJson(Map<String, dynamic> json) =>
      _$BoardQnaBlockFromJson(json);
  Map<String, dynamic> toJson() => _$BoardQnaBlockToJson(this);
}
