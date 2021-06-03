import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';

part 'QnaPostApiResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class QnaPostApiResponse extends YrkApiResponse {
  QnaPostApiResponse();

  late List<YrkListItemV2Model> qnaPosts;

  factory QnaPostApiResponse.fromJson(Map<String, dynamic> json) =>
      _$QnaPostApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QnaPostApiResponseToJson(this);
}

class TestQnaPostData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "qnaPosts": [
      {
        "pageType": "qnaPost",
        "facilityType": "요양병원",
        "title": "첫번째 요양병원 질문",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
        "rating": 4.8
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양병원",
        "title": "요양병원 질문",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
        "rating": 4.8
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },      {
        "pageType": "qnaPost",
        "facilityType": "요양병원",
        "title": "요양병원 질문",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
        "rating": 4.8
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },      {
        "pageType": "qnaPost",
        "facilityType": "요양병원",
        "title": "요양병원 질문",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
        "rating": 4.8
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
      {
        "pageType": "qnaPost",
        "facilityType": "요양",
        "title": "마지막 인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      },
    ]
  };
}

