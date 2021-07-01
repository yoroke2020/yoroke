import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';

part 'PopularPostBlock.g.dart';

@JsonSerializable(explicitToJson: true)
class PopularPostBlock extends YrkBlock {
  // TODO map 'PopularPostBlock' to static string
  PopularPostBlock() : super('PopularPostBlock');

  late String title;

  factory PopularPostBlock.fromJson(Map<String, dynamic> json) =>
      _$PopularPostBlockFromJson(json);
  Map<String, dynamic> toJson() => _$PopularPostBlockToJson(this);
}
