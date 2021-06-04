// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReviewPostApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewPostApiResponse _$ReviewPostApiResponseFromJson(
    Map<String, dynamic> json) {
  return ReviewPostApiResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..title = json['title'] as String
    ..reviewPosts = (json['reviewPosts'] as List<dynamic>)
        .map((e) => YrkListItemV2Model.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$ReviewPostApiResponseToJson(
        ReviewPostApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'title': instance.title,
      'reviewPosts': instance.reviewPosts.map((e) => e.toJson()).toList(),
    };
