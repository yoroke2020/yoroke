// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardTypeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardTypeModel _$BoardTypeModelFromJson(Map<String, dynamic> json) {
  return BoardTypeModel()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..title = json['title'] as String?
    ..boardType = json['boardType'] as String?
    ..boardLabel = json['boardLabel'] as String?;
}

Map<String, dynamic> _$BoardTypeModelToJson(BoardTypeModel instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'title': instance.title,
      'boardType': instance.boardType,
      'boardLabel': instance.boardLabel,
    };
