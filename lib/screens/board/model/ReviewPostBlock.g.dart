// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReviewPostBlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewPostBlock _$ReviewPostBlockFromJson(Map<String, dynamic> json) {
  return ReviewPostBlock()
    ..type = json['type'] as String
    ..blocks = (json['blocks'] as List<dynamic>?)
        ?.map((e) => YrkBlock.fromJson(e as Map<String, dynamic>))
        .toList()
    ..items = (json['items'] as List<dynamic>?)
        ?.map((e) => YrkModel.fromJson(e as Map<String, dynamic>))
        .toList()
    ..title = json['title'] as String;
}

Map<String, dynamic> _$ReviewPostBlockToJson(ReviewPostBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'blocks': instance.blocks?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'title': instance.title,
    };
