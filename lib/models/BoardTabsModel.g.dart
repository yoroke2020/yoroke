// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardTabsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardTabsModel _$BoardTabsModelFromJson(Map<String, dynamic> json) {
  return BoardTabsModel()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..title = json['title'] as String?
    ..boards = (json['boards'] as List<dynamic>?)
        ?.map((e) => BoardTypeModel.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$BoardTabsModelToJson(BoardTabsModel instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'title': instance.title,
      'boards': instance.boards,
    };
