// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardQnaBlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardQnaBlock _$BoardQnaBlockFromJson(Map<String, dynamic> json) {
  return BoardQnaBlock()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..blocks = json['blocks'] as List<dynamic>?
    ..items = json['items'] as List<dynamic>?
    ..title = json['title'] as String;
}

Map<String, dynamic> _$BoardQnaBlockToJson(BoardQnaBlock instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'blocks': instance.blocks,
      'items': instance.items,
      'title': instance.title,
    };
