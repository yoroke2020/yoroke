import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'PostPreviewModel.g.dart';

@JsonSerializable()
class PostPreviewModel extends YrkModel2 {
  String? boardType;
  String? boardLabel;
  String? title;
  String? content;
  String? profileImage;
  String? author;
  int? likeCount;
  int? viewCount;
  int? commentCount;

  PostPreviewModel();

  factory PostPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$PostPreviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostPreviewModelToJson(this);
}
