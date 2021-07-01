// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeBlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBlock _$HomeBlockFromJson(Map<String, dynamic> json) {
  return HomeBlock()
    ..type = json['type'] as String
    ..blocks = (json['blocks'] as List<dynamic>?)
        ?.map((e) => YrkBlock.fromJson(e as Map<String, dynamic>))
        .toList()
    ..items = (json['items'] as List<dynamic>?)
        ?.map((e) => YrkModel.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$HomeBlockToJson(HomeBlock instance) => <String, dynamic>{
      'type': instance.type,
      'blocks': instance.blocks?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
