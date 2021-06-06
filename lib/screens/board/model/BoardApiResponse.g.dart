// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardApiResponse _$BoardApiResponseFromJson(Map<String, dynamic> json) {
  return BoardApiResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..body = (json['body'] as List<dynamic>)
        .map((e) => YrkBlockJson.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$BoardApiResponseToJson(BoardApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'body': instance.body.map((e) => e.toJson()).toList(),
    };
