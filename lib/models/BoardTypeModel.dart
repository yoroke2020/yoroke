import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'BoardTypeModel.g.dart';

@JsonSerializable()
class BoardTypeModel extends YrkModel2 {
  String? boardType;
  String? boardLabel;

  BoardTypeModel();

  factory BoardTypeModel.fromJson(Map<String, dynamic> json) =>
      _$BoardTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardTypeModelToJson(this);
}
