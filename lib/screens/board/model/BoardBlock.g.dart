// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardBlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardBlock _$BoardBlockFromJson(Map<String, dynamic> json) {
  return BoardBlock()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..title = json['title'] as String?
    ..blocks = json['blocks'] as List<dynamic>?
    ..items = json['items'] as List<dynamic>?;
}

Map<String, dynamic> _$BoardBlockToJson(BoardBlock instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'title': instance.title,
      'blocks': instance.blocks,
      'items': instance.items,
    };
