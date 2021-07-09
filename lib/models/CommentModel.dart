import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel2.dart';

part 'CommentModel.g.dart';

@JsonSerializable()
class CommentModel extends YrkModel2 {
  int? commentId;
  String? author;
  int? accountId;
  String? timestamp;
  int? likeCount;
  int? dislikeCount;
  String? description;

  CommentModel({
    this.commentId,
    this.author,
    this.accountId,
    this.timestamp,
    this.likeCount,
    this.dislikeCount,
    this.description,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}

class CommentModelExample {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "body": {
      "@type": "comments",
      "@category": "comment",
      "title": "댓글",
      "items": [
        {
          "@type": "comment",
          "author": "Wrap_author",
          "description": "댓글 1",
          "timestamp": "2021.05.29T09:00",
          "likeCount": Random().nextInt(100) + 1,
          "dislikeCount": Random().nextInt(100) + 1,
        },
      ]
    }
  };
}
