// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YrkBlock2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YrkBlock2<B, M> _$YrkBlock2FromJson<B, M>(Map<String, dynamic> json) {
  return YrkBlock2<B, M>()
    ..type = json['@type'] as String
    ..category = json['@category'] as String
    ..title = json['title'] as String
    ..blocks = (json['blocks'] as List<dynamic>?)
        ?.map((e) => _BlockConverter<B>().fromJson(e as Object))
        .toList()
    ..items = (json['items'] as List<dynamic>?)
        ?.map((e) => _ModelConverter<M>().fromJson(e as Object))
        .toList();
}

Map<String, dynamic> _$YrkBlock2ToJson<B, M>(YrkBlock2<B, M> instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'title': instance.title,
      'blocks': instance.blocks?.map(_BlockConverter<B>().toJson).toList(),
      'items': instance.items?.map(_ModelConverter<M>().toJson).toList(),
    };
