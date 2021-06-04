// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JobFindingPostApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobFindingPostApiResponse _$JobFindingPostApiResponseFromJson(
    Map<String, dynamic> json) {
  return JobFindingPostApiResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..jobFindingPosts = (json['jobFindingPosts'] as List<dynamic>)
        .map((e) => YrkListItemV2Model.fromJson(e as Map<String, dynamic>))
        .toList()
    ..title = json['title'] as String;
}

Map<String, dynamic> _$JobFindingPostApiResponseToJson(
        JobFindingPostApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'jobFindingPosts':
          instance.jobFindingPosts.map((e) => e.toJson()).toList(),
      'title': instance.title,
    };
