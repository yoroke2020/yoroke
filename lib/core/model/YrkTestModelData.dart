import 'dart:math';

class TestBoardData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "body": [
      {
        "@type": "cards",
        "@category": "review",
        "title": "후기",
        "items": [
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "요양병원"
          },
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "요양원"
          },
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "복지관"
          },
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "경로당"
          },
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "요양시설"
          },
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "요양병원"
          },
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "요양원"
          },
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "복지관"
          },
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "경로당"
          },
          {
            "@type": "card",
            "@category": "review",
            "imagePath": "assets/images/sample_image.png",
            "title": "요양시설"
          },
        ]
      },
      {
        "@type": "posts",
        "@category": "qna",
        "title": "고민/질문",
        "items": [
          {
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
            "@type": "post",
            "@category": "qna",
            "label": "요양",
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
      },
      {
        "@type": "posts",
        "@category": "job",
        "title": "구인구직",
        "items": [
          {
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
            "@type": "post",
            "@category": "job",
            "label": "요양",
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
      },
      {
        "@type": "testType",
        "@category": "testCategory",
        "blocks": [
          {
            "@type": "cards",
            "@category": "review",
            "title": "후기",
            "items": [
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "요양병원"
              },
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "요양원"
              },
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "복지관"
              },
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "경로당"
              },
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "요양시설"
              },
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "요양병원"
              },
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "요양원"
              },
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "복지관"
              },
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "경로당"
              },
              {
                "@type": "card",
                "imagePath": "assets/images/sample_image.png",
                "title": "요양시설"
              },
            ]
          },
          {
            "@type": "posts",
            "@category": "qna",
            "title": "고민/질문",
            "items": [
              {
                "@type": "post",
                "category": "요양병원",
                "title": "첫번째 요양병원 질문",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.30",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양병원",
                "title": "요양병원 질문",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.30",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양병원",
                "title": "요양병원 질문",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.30",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양병원",
                "title": "요양병원 질문",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.30",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
              {
                "@type": "post",
                "category": "요양",
                "title": "마지막 인기 요양원",
                "isBest": Random().nextBool(),
                "author": "유저1",
                "timestamp": "2021.05.29",
                "likeCount": Random().nextInt(100) + 1,
                "dislikeCount": Random().nextInt(100) + 1,
                "commentCount": Random().nextInt(100) + 1,
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
            ]
          }
        ]
      },
    ]
  };
}