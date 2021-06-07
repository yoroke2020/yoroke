import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'BoardJobFindingBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardJobFindingBlock extends YrkBlock2 {
  BoardJobFindingBlock();

  late String title;

  factory BoardJobFindingBlock.fromJson(Map<String, dynamic> json) =>
      _$BoardJobFindingBlockFromJson(json);
  Map<String, dynamic> toJson() => _$BoardJobFindingBlockToJson(this);
}
