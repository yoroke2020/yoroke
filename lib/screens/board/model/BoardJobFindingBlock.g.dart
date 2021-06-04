// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardJobFindingBlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardJobFindingBlock _$BoardJobFindingBlockFromJson(Map<String, dynamic> json) {
  return BoardJobFindingBlock()
    ..type = json['type'] as String
    ..blocks = (json['blocks'] as List<dynamic>?)
        ?.map((e) => YrkBlock.fromJson(e as Map<String, dynamic>))
        .toList()
    ..items = (json['items'] as List<dynamic>?)
        ?.map((e) => YrkModel.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$BoardJobFindingBlockToJson(
        BoardJobFindingBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'blocks': instance.blocks?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
