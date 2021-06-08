// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardJobFindingBlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardJobFindingBlock _$BoardJobFindingBlockFromJson(Map<String, dynamic> json) {
  return BoardJobFindingBlock()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..blocks = json['blocks'] as List<dynamic>?
    ..items = json['items'] as List<dynamic>?
    ..title = json['title'] as String;
}

Map<String, dynamic> _$BoardJobFindingBlockToJson(
        BoardJobFindingBlock instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'blocks': instance.blocks,
      'items': instance.items,
      'title': instance.title,
    };
