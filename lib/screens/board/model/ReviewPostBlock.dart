import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'ReviewPostBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewPostBlock extends YrkBlock {
  ReviewPostBlock() : super('ReviewPost');

  late String title;

  factory ReviewPostBlock.fromJson(Map<String, dynamic> json) =>
      _$ReviewPostBlockFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewPostBlockToJson(this);
}
