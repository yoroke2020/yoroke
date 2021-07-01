// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountModel _$CountModelFromJson(Map<String, dynamic> json) {
  return CountModel()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..title = json['title'] as String?
    ..imagePath = json['imagePath'] as String?
    ..count = json['count'] as int?
    ..unit = json['unit'] as String?;
}

Map<String, dynamic> _$CountModelToJson(CountModel instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'title': instance.title,
      'imagePath': instance.imagePath,
      'count': instance.count,
      'unit': instance.unit,
    };
