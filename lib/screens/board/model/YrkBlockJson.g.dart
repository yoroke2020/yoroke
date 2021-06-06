// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YrkBlockJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YrkBlockJson _$YrkBlockJsonFromJson(Map<String, dynamic> json) {
  return YrkBlockJson()
    ..type = json['type'] as String
    ..blocks = (json['blocks'] as List<dynamic>?)
        ?.map((e) => YrkBlock.fromJson(e as Map<String, dynamic>))
        .toList()
    ..items = (json['items'] as List<dynamic>?)
        ?.map((e) => YrkModel.fromJson(e as Map<String, dynamic>))
        .toList()
    ..category = json['category'] as String
    ..title = json['title'] as String;
}

Map<String, dynamic> _$YrkBlockJsonToJson(YrkBlockJson instance) =>
    <String, dynamic>{
      'type': instance.type,
      'blocks': instance.blocks,
      'items': instance.items,
      'category': instance.category,
      'title': instance.title,
    };
