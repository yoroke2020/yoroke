// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FacilityDetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityDetailModel _$FacilityDetailModelFromJson(Map<String, dynamic> json) {
  return FacilityDetailModel()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..title = json['title'] as String?
    ..hours = json['hours'] as String?
    ..intro = json['intro'] as String?
    ..medicalStaffNum = json['medicalStaffNum'] as int?
    ..nursingStaffNum = json['nursingStaffNum'] as int?
    ..cookingStaffNum = json['cookingStaffNum'] as int?
    ..facilityUserNum = json['facilityUserNum'] as int?
    ..minMonthlyCost = json['minMonthlyCost'] as int?
    ..maxMonthlyCost = json['maxMonthlyCost'] as int?
    ..facilityId = json['facilityId'] as int?;
}

Map<String, dynamic> _$FacilityDetailModelToJson(
        FacilityDetailModel instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'title': instance.title,
      'hours': instance.hours,
      'intro': instance.intro,
      'medicalStaffNum': instance.medicalStaffNum,
      'nursingStaffNum': instance.nursingStaffNum,
      'cookingStaffNum': instance.cookingStaffNum,
      'facilityUserNum': instance.facilityUserNum,
      'minMonthlyCost': instance.minMonthlyCost,
      'maxMonthlyCost': instance.maxMonthlyCost,
      'facilityId': instance.facilityId,
    };
