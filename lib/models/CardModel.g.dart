// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return CardModel()
    ..title = json['title'] as String?
    ..imagePath = json['imagePath'] as String?;
}

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'title': instance.title,
      'imagePath': instance.imagePath,
    };
