// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PopularPostApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularPostApiResponse _$PopularPostApiResponseFromJson(
    Map<String, dynamic> json) {
  return PopularPostApiResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..popularPost = (json['popularPost'] as List<dynamic>)
        .map((e) => YrkListItemV2Model.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$PopularPostApiResponseToJson(
        PopularPostApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'popularPost': instance.popularPost.map((e) => e.toJson()).toList(),
    };
