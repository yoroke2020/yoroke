// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardApiResponse<T>
    _$BoardApiResponseFromJson<T extends YrkBlock2<dynamic, dynamic>>(
        Map<String, dynamic> json) {
  return BoardApiResponse<T>()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..body = (json['body'] as List<dynamic>)
        .map((e) => _BlockConverter<T>().fromJson(e as Object))
        .toList();
}

Map<String, dynamic>
    _$BoardApiResponseToJson<T extends YrkBlock2<dynamic, dynamic>>(
            BoardApiResponse<T> instance) =>
        <String, dynamic>{
          'status': instance.status,
          'message': instance.message,
          'body': instance.body.map(_BlockConverter<T>().toJson).toList(),
        };
