import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/home/HomePopularCardListItem.dart';

part 'HomeApiResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeApiResponse extends YrkApiResponse {
  HomeApiResponse();

  late List<YrkListItemV2Model> popularPost;
  late List<HomePopularCardListItemModel> popularFacility;

  factory HomeApiResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeApiResponseToJson(this);
}

// (example) data from API
class TestHomeData {
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
    ],
    "popularFacility": [
      {
        "facilityName": "조문기의 요양 병원",
        "imageUrl":
            "https://cdn.monews.co.kr/news/photo/202002/208006_59509_2352.png",
        "address": "서울시 용산구",
        "bookmarkCount": 123,
        "rating": 4.8
      },
      {
        "facilityName": "진호의 요양 병원",
        "imageUrl":
            "https://cdn.monews.co.kr/news/photo/202002/208006_59509_2352.png",
        "address": "서울시 용산구",
        "bookmarkCount": 321,
        "rating": 3.0
      },
      {
        "facilityName": "승규의 요양 병원",
        "imageUrl":
            "https://cdn.monews.co.kr/news/photo/202002/208006_59509_2352.png",
        "address": "서울시 용산구",
        "bookmarkCount": 221,
        "rating": 4.2
      },
      {
        "facilityName": "홍의 요양 병원",
        "imageUrl":
            "https://cdn.monews.co.kr/news/photo/202002/208006_59509_2352.png",
        "address": "서울시 용산구",
        "bookmarkCount": 123,
        "rating": 1.1
      },
      {
        "facilityName": "조문기의 요양 병원",
        "imageUrl":
            "https://cdn.monews.co.kr/news/photo/202002/208006_59509_2352.png",
        "address": "서울시 용산구",
        "bookmarkCount": 11,
        "rating": 4.8
      },
      {
        "facilityName": "조문기의 요양 병원",
        "imageUrl":
            "https://cdn.monews.co.kr/news/photo/202002/208006_59509_2352.png",
        "address": "서울시 용산구",
        "bookmarkCount": 0,
        "rating": 4.8
      },
      {
        "facilityName": "조문기의 요양 병원",
        "imageUrl":
            "https://cdn.monews.co.kr/news/photo/202002/208006_59509_2352.png",
        "address": "서울시 용산구",
        "bookmarkCount": 1,
        "rating": 4.8
      },
    ]
  };
}
