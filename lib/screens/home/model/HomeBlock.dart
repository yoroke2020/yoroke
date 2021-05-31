import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'HomeBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeBlock extends YrkBlock {
  HomeBlock() : super('HomeBlock');

  factory HomeBlock.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockFromJson(json);
  Map<String, dynamic> toJson() => _$HomeBlockToJson(this);
}
