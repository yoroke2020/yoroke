import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'JobFindingPostBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class JobFindingPostBlock extends YrkBlock {
  // TODO map 'PopularPostBlock' to static string
  JobFindingPostBlock() : super('JobFindingPostBlock');

  late String title;

  factory JobFindingPostBlock.fromJson(Map<String, dynamic> json) =>
      _$JobFindingPostBlockFromJson(json);
  Map<String, dynamic> toJson() => _$JobFindingPostBlockToJson(this);
}
