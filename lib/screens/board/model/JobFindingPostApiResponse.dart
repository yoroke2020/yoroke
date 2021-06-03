import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';

part 'JobFindingPostApiResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class JobFindingPostApiResponse extends YrkApiResponse {
  JobFindingPostApiResponse();

  late List<YrkListItemV2Model> jobFindingPosts;

  factory JobFindingPostApiResponse.fromJson(Map<String, dynamic> json) =>
      _$JobFindingPostApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JobFindingPostApiResponseToJson(this);
}

class TestJobFindingPostData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "jobFindingPosts": [
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인중",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인완료",
        "title": "조문기를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인완료",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인중",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인중",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인완료",
        "title": "조문기를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인완료",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인중",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인중",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인완료",
        "title": "조문기를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인완료",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인중",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인중",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인완료",
        "title": "조문기를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인완료",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      },
      {
        "pageType": "jobFindingPost",
        "facilityType": "구인중",
        "title": "정홍규를 돌봐줄 요양사",
        "author": "유저1",
        "timestamp": "2021.05.30",
        "likeCount": 1,
        "commentCount": 1,
      }
    ]
  };
}
