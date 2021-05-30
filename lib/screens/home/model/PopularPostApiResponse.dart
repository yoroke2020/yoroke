import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';

part 'PopularPostApiResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class PopularPostApiResponse extends YrkApiResponse {
  PopularPostApiResponse();

  late List<YrkListItemV2Model> popularPost;

  factory PopularPostApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularPostApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PopularPostApiResponseToJson(this);
}

// (example) data from API
class TestPopularPostData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "popularPost": [
      {
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
        "facilityType": "요양",
        "title": "인기 요양원",
        "isBest": true,
        "author": "유저1",
        "timestamp": "2021.05.29",
        "likeCount": 2,
        "commentCount": 2,
        "rating": 3.5
      }
    ]
  };
}
