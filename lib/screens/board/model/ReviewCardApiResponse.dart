import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/screens/board/BoardReviewCard.dart';

part 'ReviewCardApiResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewCardApiResponse extends YrkApiResponse {
  ReviewCardApiResponse();

  late List<BoardReviewCardModel> reviewCards;

  factory ReviewCardApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewCardApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewCardApiResponseToJson(this);
}

class TestReviewCardData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "reviewCards": [
      {"imagePath": "assets/images/sample_image.png", "title": "요양병원"},
      {"imagePath": "assets/images/sample_image.png", "title": "요양원"},
      {"imagePath": "assets/images/sample_image.png", "title": "복지관"},
      {"imagePath": "assets/images/sample_image.png", "title": "경로당"},
      {"imagePath": "assets/images/sample_image.png", "title": "요양시설"},
      {"imagePath": "assets/images/sample_image.png", "title": "요양병원"},
      {"imagePath": "assets/images/sample_image.png", "title": "요양원"},
      {"imagePath": "assets/images/sample_image.png", "title": "복지관"},
      {"imagePath": "assets/images/sample_image.png", "title": "경로당"},
      {"imagePath": "assets/images/sample_image.png", "title": "요양시설"},
    ]
  };
}
