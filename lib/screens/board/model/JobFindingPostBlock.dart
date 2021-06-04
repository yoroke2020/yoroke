import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'JobFindingPostBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class JobFindingPostBlock extends YrkBlock {
  // TODO map 'PopularPostBlock' to static string
  JobFindingPostBlock() : super('JobFindingPost');

  late String title = "구인구직";

  factory JobFindingPostBlock.fromJson(Map<String, dynamic> json) =>
      _$JobFindingPostBlockFromJson(json);
  Map<String, dynamic> toJson() => _$JobFindingPostBlockToJson(this);
}
