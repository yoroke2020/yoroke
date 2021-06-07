import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'PostModel.g.dart';

@JsonSerializable()
class PostModel extends YrkModel2{
  int? postId;
  String? category;
  String? title;
  String? author;
  String? time;
  int? likeCount;
  int? dislikeCount;
  int? commentCount;
  double? rating;
  bool? isBest;

  PostModel();

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

class TestPostData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "body": {
      "type": "post",
      "category": "category",
      "title": "글",
      "items": [
        {
          "category": "요양병원",
          "title": "첫번째 요양병원 질문",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.30",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양병원",
          "title": "요양병원 질문",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.30",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양병원",
          "title": "요양병원 질문",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.30",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양병원",
          "title": "요양병원 질문",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.30",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
        {
          "category": "요양",
          "title": "마지막 인기 요양원",
          "isBest": Random().nextBool(),
          "author": "유저1",
          "timestamp": "2021.05.29",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
          "commentCount": Random().nextInt(100) + 1,
          "rating":
              double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
        },
      ]
    }
  };
}
