import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'BoardReviewBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardReviewBlock extends YrkBlock2 {
  BoardReviewBlock();

  late String title;

  factory BoardReviewBlock.fromJson(Map<String, dynamic> json) =>
      _$BoardReviewBlockFromJson(json);
  Map<String, dynamic> toJson() => _$BoardReviewBlockToJson(this);
}
