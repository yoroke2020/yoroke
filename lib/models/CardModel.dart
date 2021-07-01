import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'CardModel.g.dart';

@JsonSerializable()
class CardModel extends YrkModel2 {
  String? imagePath;

  CardModel();

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}

class CardDataExample {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "body": {
      "@type": "post",
      "@category": "category",
      "title": "글",
      "items": [
        {
          "@type": "card",
          "@category": "review",
          "imagePath": "assets/images/sample_image.png",
          "title": "요양시설"
        },
      ]
    }
  };
}