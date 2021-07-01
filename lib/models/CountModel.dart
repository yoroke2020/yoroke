import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel2.dart';
import 'package:yoroke/models/CardModel.dart';

part 'CountModel.g.dart';

@JsonSerializable()
class CountModel extends CardModel {
  int? count;
  String? unit;

  CountModel();

  factory CountModel.fromJson(Map<String, dynamic> json) =>
      _$CountModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountModelToJson(this);
}