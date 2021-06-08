// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YrkModel2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YrkModel2 _$YrkModel2FromJson(Map<String, dynamic> json) {
  return YrkModel2()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?;
}

Map<String, dynamic> _$YrkModel2ToJson(YrkModel2 instance) => <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
    };
