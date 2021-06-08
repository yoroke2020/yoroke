import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'BoardQnaBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardQnaBlock extends YrkBlock2 {
  BoardQnaBlock();

  factory BoardQnaBlock.fromJson(Map<String, dynamic> json) =>
      _$BoardQnaBlockFromJson(json);
  Map<String, dynamic> toJson() => _$BoardQnaBlockToJson(this);
}
