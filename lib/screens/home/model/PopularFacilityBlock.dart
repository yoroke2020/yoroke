import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'PopularFacilityBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class PopularFacilityBlock extends YrkBlock {
  // TODO map 'PopularFacilityBlock' to static string
  PopularFacilityBlock() : super('PopularFacilityBlock');

  late String title;

  factory PopularFacilityBlock.fromJson(Map<String, dynamic> json) =>
      _$PopularFacilityBlockFromJson(json);
  Map<String, dynamic> toJson() => _$PopularFacilityBlockToJson(this);
}
