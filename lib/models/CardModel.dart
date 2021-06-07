import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'CardModel.g.dart';

@JsonSerializable()
class CardModel extends YrkModel2 {
  String? title;
  String? imagePath;

  CardModel();

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
