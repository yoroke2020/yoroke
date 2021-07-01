// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YrkApiResponse2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YrkApiResponse2<T>
    _$YrkApiResponse2FromJson<T extends YrkBlock2<dynamic, dynamic>>(
        Map<String, dynamic> json) {
  return YrkApiResponse2<T>()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..type = json['type'] as String?
    ..title = json['title'] as String?
    ..body = (json['body'] as List<dynamic>?)
        ?.map((e) => _BlockConverter<T>().fromJson(e as Object))
        .toList();
}

Map<String, dynamic>
    _$YrkApiResponse2ToJson<T extends YrkBlock2<dynamic, dynamic>>(
            YrkApiResponse2<T> instance) =>
        <String, dynamic>{
          'status': instance.status,
          'message': instance.message,
          'type': instance.type,
          'title': instance.title,
          'body': instance.body?.map(_BlockConverter<T>().toJson).toList(),
        };
