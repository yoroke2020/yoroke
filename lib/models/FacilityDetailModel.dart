import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'FacilityDetailModel.g.dart';

@JsonSerializable()
class FacilityDetailModel extends YrkModel2 {
  String? hours;
  String? intro;
  int? medicalStaffNum;
  int? nursingStaffNum;
  int? cookingStaffNum;
  int? facilityUserNum;
  int? minMonthlyCost;
  int? maxMonthlyCost;
  int? facilityId;

  FacilityDetailModel();

  factory FacilityDetailModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityDetailModelToJson(this);
}