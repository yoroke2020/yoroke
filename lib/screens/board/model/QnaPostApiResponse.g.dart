// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QnaPostApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QnaPostApiResponse _$QnaPostApiResponseFromJson(Map<String, dynamic> json) {
  return QnaPostApiResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..qnaPosts = (json['qnaPosts'] as List<dynamic>)
        .map((e) => YrkListItemV2Model.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$QnaPostApiResponseToJson(QnaPostApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'qnaPosts': instance.qnaPosts.map((e) => e.toJson()).toList(),
    };
