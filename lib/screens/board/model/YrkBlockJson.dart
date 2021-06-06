import 'dart:math';
import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkBlock.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/models/CardModel.dart';
import 'package:yoroke/models/PostModel.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/home/HomePopularCardListItem.dart';

part 'YrkBlockJson.g.dart';

@JsonSerializable()
class YrkBlockJson extends YrkBlock{
  YrkBlockJson() : super('YrkBlockJson');

  late String category;
  late String title;

  factory YrkBlockJson.fromJson(Map<String, dynamic> json) =>
      _$YrkBlockJsonFromJson(json);
  Map<String, dynamic> toJson() => _$YrkBlockJsonToJson(this);
}