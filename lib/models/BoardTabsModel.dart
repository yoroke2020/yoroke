import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel2.dart';
import 'package:yoroke/models/BoardTypeModel.dart';

part 'BoardTabsModel.g.dart';

@JsonSerializable()
class BoardTabsModel extends YrkModel2 {
  List<BoardTypeModel>? boards;

  BoardTabsModel();

  factory BoardTabsModel.fromJson(Map<String, dynamic> json) =>
      _$BoardTabsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardTabsModelToJson(this);
}
