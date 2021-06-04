import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/screens/board/BoardQnaCard.dart';

part 'QnaCardApiResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class QnaCardApiResponse extends YrkApiResponse {
  QnaCardApiResponse();

  late List<BoardQnaCardModel> qnaCards;

  factory QnaCardApiResponse.fromJson(Map<String, dynamic> json) =>
      _$QnaCardApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QnaCardApiResponseToJson(this);
}

class TestQnaCardData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "qnaCards": [
      {
        "pageType": "qnaPost",
        "type": "요양병원",
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
        "type": "요양",
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
        "type": "요양",
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
        "type": "요양",
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
        "type": "요양병원",
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
        "type": "요양",
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
        "type": "요양",
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
        "type": "요양",
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
        "type": "요양병원",
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
        "type": "요양",
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
        "type": "요양",
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
        "type": "요양",
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
        "type": "요양병원",
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
        "type": "요양",
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
        "type": "요양",
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
        "type": "요양",
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
