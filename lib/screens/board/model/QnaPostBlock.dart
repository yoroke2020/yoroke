import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'QnaPostBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class QnaPostBlock extends YrkBlock {
  // TODO map 'PopularPostBlock' to static string
  QnaPostBlock() : super('QnaPostBlock');

  late String title = "구인/구직";

  factory QnaPostBlock.fromJson(Map<String, dynamic> json) =>
      _$QnaPostBlockFromJson(json);
  Map<String, dynamic> toJson() => _$QnaPostBlockToJson(this);
}
