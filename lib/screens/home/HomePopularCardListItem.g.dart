// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomePopularCardListItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePopularCardListItemModel _$HomePopularCardListItemModelFromJson(
    Map<String, dynamic> json) {
  return HomePopularCardListItemModel()
    ..facilityName = json['facilityName'] as String?
    ..address = json['address'] as String?
    ..imageUrl = json['imageUrl'] as String?
    ..bookmarkCount = (json['bookmarkCount'] as num?)?.toDouble()
    ..rating = (json['rating'] as num?)?.toDouble();
}

Map<String, dynamic> _$HomePopularCardListItemModelToJson(
        HomePopularCardListItemModel instance) =>
    <String, dynamic>{
      'facilityName': instance.facilityName,
      'address': instance.address,
      'imageUrl': instance.imageUrl,
      'bookmarkCount': instance.bookmarkCount,
      'rating': instance.rating,
    };
