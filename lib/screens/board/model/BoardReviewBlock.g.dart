// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardReviewBlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardReviewBlock _$BoardReviewBlockFromJson(Map<String, dynamic> json) {
  return BoardReviewBlock()
    ..type = json['@type'] as String
    ..category = json['@category'] as String
    ..blocks = json['blocks'] as List<dynamic>?
    ..items = json['items'] as List<dynamic>?
    ..title = json['title'] as String;
}

Map<String, dynamic> _$BoardReviewBlockToJson(BoardReviewBlock instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'blocks': instance.blocks,
      'items': instance.items,
      'title': instance.title,
    };
