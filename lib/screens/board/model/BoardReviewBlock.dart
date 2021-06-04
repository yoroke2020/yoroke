import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'BoardReviewBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardReviewBlock extends YrkBlock {
  BoardReviewBlock() : super('BoardReview');

  late String title;

  factory BoardReviewBlock.fromJson(Map<String, dynamic> json) =>
      _$BoardReviewBlockFromJson(json);
  Map<String, dynamic> toJson() => _$BoardReviewBlockToJson(this);
}
