// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FacilityModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityModel _$FacilityModelFromJson(Map<String, dynamic> json) {
  return FacilityModel()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..title = json['title'] as String?
    ..address = json['address'] as String?
    ..distance = (json['distance'] as num?)?.toDouble()
    ..rating = (json['rating'] as num?)?.toDouble()
    ..commentCount = json['commentCount'] as int?
    ..grade = json['grade'] as String?
    ..facilityId = json['facilityId'] as int?
    ..imagePaths = (json['imagePaths'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
}

Map<String, dynamic> _$FacilityModelToJson(FacilityModel instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'title': instance.title,
      'address': instance.address,
      'distance': instance.distance,
      'rating': instance.rating,
      'commentCount': instance.commentCount,
      'grade': instance.grade,
      'facilityId': instance.facilityId,
      'imagePaths': instance.imagePaths,
    };
