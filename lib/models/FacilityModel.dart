import 'dart:math';

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

class FacilityDataExample {
  Map<String, dynamic> jsonResponse = {
    "@type": "tabs",
    "@category": "find",
    "title": "추천시설",
    "blocks": [
      {
        "@type": "list",
        "@category": "find",
        "title": "요양원",
        "items": [
          {
            "@type": "facility",
            "@category": "find",
            "title": "조문기네 요양원",
            "address": "서울시 마포구",
            "distance":
                double.parse((10.0 * Random().nextDouble()).toStringAsFixed(1)),
            "rating":
                double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2)),
            "commentCount": Random().nextInt(100) + 1,
            "grade": "A",
            "imagePaths": [
              "assets/images/sample_image.png",
              "assets/images/sample_image.png",
              "assets/images/sample_image.png",
              "assets/images/sample_image.png",
              "assets/images/sample_image.png"
            ]
          }
        ]
      }
    ]
  };
}
