// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeApiResponse _$HomeApiResponseFromJson(Map<String, dynamic> json) {
  return HomeApiResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..popularPost = (json['popularPost'] as List<dynamic>)
        .map((e) => YrkListItemV2Model.fromJson(e as Map<String, dynamic>))
        .toList()
    ..popularFacility = (json['popularFacility'] as List<dynamic>)
        .map((e) =>
            HomePopularCardListItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$HomeApiResponseToJson(HomeApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'popularPost': instance.popularPost.map((e) => e.toJson()).toList(),
      'popularFacility':
          instance.popularFacility.map((e) => e.toJson()).toList(),
    };
