// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReviewCardApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewCardApiResponse _$ReviewCardApiResponseFromJson(
    Map<String, dynamic> json) {
  return ReviewCardApiResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..reviewCards = (json['reviewCards'] as List<dynamic>)
        .map((e) => BoardReviewCardModel.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$ReviewCardApiResponseToJson(
        ReviewCardApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'reviewCards': instance.reviewCards.map((e) => e.toJson()).toList(),
    };
