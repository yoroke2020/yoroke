import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'FacilityModel.g.dart';

@JsonSerializable()
class FacilityModel extends YrkModel2 {
  String? address;
  double? distance;
  double? rating;
  int? commentCount;
  String? grade;
  int? facilityId;
  List<String>? imagePaths;

  FacilityModel();

  factory FacilityModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityModelToJson(this);
}