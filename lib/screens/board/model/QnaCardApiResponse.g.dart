// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QnaCardApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QnaCardApiResponse _$QnaCardApiResponseFromJson(Map<String, dynamic> json) {
  return QnaCardApiResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..qnaCards = (json['qnaCards'] as List<dynamic>)
        .map((e) => BoardQnaCardModel.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$QnaCardApiResponseToJson(QnaCardApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'qnaCards': instance.qnaCards.map((e) => e.toJson()).toList(),
    };
