import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';

part 'ReviewPostApiResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewPostApiResponse extends YrkApiResponse {
  ReviewPostApiResponse();

  late String title;
  late List<YrkListItemV2Model> reviewPosts;

  factory ReviewPostApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewPostApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewPostApiResponseToJson(this);
}

class TestReviewPostData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "title": "고민/질문",
    "reviewPosts": [
      {
        "pageType": "qnaPost",
        "facilityType": "요양병원",
        "title": "첫번째 요양병원 질문",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양병원",
        "title": "요양병원 질문",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양병원",
        "title": "요양병원 질문",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양병원",
        "title": "요양병원 질문",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "마지막 인기 요양원",
        "isBest": Random().nextBool(),
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": Random().nextInt(100) + 1,
        "dislikeCount": Random().nextInt(100) + 1,
        "commentCount": Random().nextInt(100) + 1,
        "rating": double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
      },
    ]
  };
}