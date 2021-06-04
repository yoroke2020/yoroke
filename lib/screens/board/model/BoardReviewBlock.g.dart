// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardReviewBlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardReviewBlock _$BoardReviewBlockFromJson(Map<String, dynamic> json) {
  return BoardReviewBlock()
    ..type = json['type'] as String
    ..blocks = (json['blocks'] as List<dynamic>?)
        ?.map((e) => YrkBlock.fromJson(e as Map<String, dynamic>))
        .toList()
    ..items = (json['items'] as List<dynamic>?)
        ?.map((e) => YrkModel.fromJson(e as Map<String, dynamic>))
        .toList()
    ..title = json['title'] as String;
}

Map<String, dynamic> _$BoardReviewBlockToJson(BoardReviewBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'blocks': instance.blocks?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'title': instance.title,
    };
