import 'dart:math';

DateTime tNow = new DateTime.now();
String timestamp =
    "${tNow.year.toString()}-${tNow.month.toString().padLeft(2, '0')}-${tNow.day.toString().padLeft(2, '0')}";

class TestPostData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "type": "Post",
    "title": "포스트",
    "body": [
      {
        "@type": "appbar",
        "blocks": [
          {
            "@type": "appbarnormal",
            "items": [
              {"@category": "community", "search": "true", "noti": "true"}
            ]
          },
        ]
      },
      {
        "@type": "post",
        "@category": "category",
        "title": "글",
        "items": [
          {
            "@type": "post",
            "@category": "job",
            "label": "요양",
            "title": "Wrap_title",
            "isBest": Random().nextBool(),
            "author": "Wrap_author",
            "timestamp": "2021.05.29T09:00",
            "likeCount": Random().nextInt(100) + 1,
            "dislikeCount": Random().nextInt(100) + 1,
            "commentCount": Random().nextInt(100) + 1,
            "rating":
                double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
          }
        ]
      },
      {
        "@type": "post",
        "@category": "category",
        "title": "글",
        "items": [
          {
            "@type": "post",
            "@category": "job",
            "label": "요양",
            "title": "이전 글 block 2",
            "isBest": Random().nextBool(),
            "author": "Wrap_author",
            "timestamp": "2021.05.29T09:00",
            "likeCount": Random().nextInt(100) + 1,
            "dislikeCount": Random().nextInt(100) + 1,
            "commentCount": Random().nextInt(100) + 1,
            "rating":
                double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
          },
          {
            "@type": "post",
            "@category": "job",
            "label": "요양",
            "title": "다음 글 block 2",
            "isBest": Random().nextBool(),
            "author": "Wrap_author",
            "timestamp": "2021.05.29T09:00",
            "likeCount": Random().nextInt(100) + 1,
            "dislikeCount": Random().nextInt(100) + 1,
            "commentCount": Random().nextInt(100) + 1,
            "rating":
                double.parse((5.0 * Random().nextDouble()).toStringAsFixed(2))
          }
        ]
      },
      {
        "@type": "comments",
        "@category": "comment",
        "title": "댓글",
        "items": [
          {
            "@type": "comment",
            "@category": "comment",
            "author": "Wrap_author",
            "description": "이것은 내용입니다",
            "timestamp": "2021.05.29T09:00",
            "likeCount": Random().nextInt(100) + 1,
            "dislikeCount": Random().nextInt(100) + 1,
          },
          {
            "@type": "comment",
            "@category": "comment",
            "author": "Wrap_author",
            "description": "이것은 내용입니다",
            "timestamp": "2021.05.29T09:00",
            "likeCount": Random().nextInt(100) + 1,
            "dislikeCount": Random().nextInt(100) + 1,
          },
          {
            "@type": "comment",
            "@category": "comment",
            "author": "Wrap_author",
            "description": "이것은 내용입니다",
            "timestamp": "2021.05.29T09:00",
            "likeCount": Random().nextInt(100) + 1,
            "dislikeCount": Random().nextInt(100) + 1,
          },
        ]
      }
    ]
  };
}
