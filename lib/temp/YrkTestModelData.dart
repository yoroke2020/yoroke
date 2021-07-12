import 'dart:math';

class TestBoardData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "type": "BoardMain",
    "title": "게시판",
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

class TestBoardReviewData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "type": "BoardReview",
    "title": "후기",
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
        "@type": "tabs",
        "@category": "review",
        "title": "구인구직",
        "blocks": [
          {
            "@type": "posts",
            "@category": "review",
            "title": "최신글",
            "items": [
              {
                "@type": "post",
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
          },
          {
            "@type": "posts",
            "@category": "review",
            "title": "인기글",
            "items": [
              {
                "@type": "post",
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
                "@category": "review",
                "label": "요양",
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
          },
        ]
      }
    ]
  };
}

class TestBoardQnaData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "type": "BoardQna",
    "title": "후기",
    "body": [
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
      }
    ]
  };
}

class TestBoardJobData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "type": "BoardJob",
    "title": "구인구직",
    "body": [
      {
        "@type": "tabs",
        "@category": "job",
        "title": "구인구직",
        "blocks": [
          {
            "@type": "posts",
            "@category": "job",
            "title": "최신글",
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
            ]
          },
          {
            "@type": "posts",
            "@category": "job",
            "title": "인기글",
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
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
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2))
              },
            ]
          }
        ]
      }
    ]
  };
}

class TestFindData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "type": "FindMain",
    "title": "시설찾기",
    "body": [
      {
        "@type": "sorts",
        "@category": "find",
        "items": [
          {"@type": "sort", "@category": "rating", "title": "별점 높은 순"},
          {"@type": "sort", "@category": "grade", "title": "시설 등급 순"},
          {"@type": "sort", "@category": "distance", "title": "가까운 순"},
          {"@type": "sort", "@category": "commentCount", "title": "후기 많은 순"},
        ]
      },
      {
        "@type": "tabs",
        "@category": "find",
        "title": "추천시설",
        "blocks": [
          {
            "@type": "list",
            "@category": "find",
            "title": "요양원",
            "items": [
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
            ]
          },
          {
            "@type": "list",
            "@category": "find",
            "title": "요양원",
            "items": [
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
            ]
          },
          {
            "@type": "list",
            "@category": "find",
            "title": "요양원",
            "items": [
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
            ]
          },
          {
            "@type": "list",
            "@category": "find",
            "title": "요양원",
            "items": [
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
            ]
          },
          {
            "@type": "list",
            "@category": "find",
            "title": "요양원",
            "items": [
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
              {
                "@type": "facility",
                "@category": "find",
                "title": "조문기네 요양원",
                "address": "서울시 마포구",
                "distance": double.parse(
                    (10.0 * Random().nextDouble()).toStringAsFixed(1)),
                "rating": double.parse(
                    (5.0 * Random().nextDouble()).toStringAsFixed(2)),
                "commentCount": Random().nextInt(100) + 1,
                "grade": "A",
                "imagePaths": [
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png",
                  "assets/images/sample_image.png"
                ]
              },
            ]
          },
        ]
      }
    ]
  };
}

class TestFindFacilityData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "type": "FindFacility",
    "title": "시설찾기",
    "body": [
      {
        "@type": "tabs",
        "@category": "FindFacility",
        "title": "시설찾기",
        "blocks": [
          {"@type": "tab", "@category": "FindFacilityHome", "title": "홈"},
          {"@type": "tab", "@category": "FindFacilityInfo", "title": "정보"},
          {"@type": "tab", "@category": "FindFacilityReview", "title": "후기"},
        ]
      }
    ]
  };
}

class TestFindFacilityInfoData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "type": "FindFacilityInfo",
    "title": "시설",
    "body": [
      {
        "@type": "normal",
        "@category": "findFacilityInfoRating",
        "title": "시설등급",
        "items": [
          {
            "@type": "content",
            "@category": "findFacilityInfoRating",
            "title": "국가요양정보원 기준",
            "content": "A"
          }
        ]
      },
      {
        "@type": "normal",
        "@category": "findFacilityInfoHr",
        "title": "인력현황",
        "items": [
          {
            "@type": "count",
            "@category": "findFacilityInfoHrMedicalStaff",
            "title": "의료진",
            "imagePath": "assets/icons/icon_medic.svg",
            "count": Random().nextInt(100) + 1,
            "unit": "명"
          },
          {
            "@type": "count",
            "@category": "findFacilityInfoHrMedicalStaff",
            "title": "의료진",
            "imagePath": "assets/icons/icon_medic.svg",
            "count": Random().nextInt(100) + 1,
            "unit": "명"
          },
          {
            "@type": "count",
            "@category": "findFacilityInfoHrMedicalStaff",
            "title": "의료진",
            "imagePath": "assets/icons/icon_medic.svg",
            "count": Random().nextInt(100) + 1,
            "unit": "명"
          },
          {
            "@type": "count",
            "@category": "findFacilityInfoHrMedicalStaff",
            "title": "의료진",
            "imagePath": "assets/icons/icon_medic.svg",
            "count": Random().nextInt(100) + 1,
            "unit": "명"
          },
        ]
      },
      {
        "@type": "normal",
        "@category": "findFacilityInfoCost",
        "title": "월 평균 금액 (만원)",
        "items": [
          {
            "@type": "content",
            "@category": "findFacilityInfoMinCost",
            "content": "100"
          },
          {
            "@type": "content",
            "@category": "findFacilityInfoMaxCost",
            "content": "200"
          }
        ]
      },
    ]
  };
}

class TestCommunityData {
  Map<String, dynamic> jsonResponse = {
    "status": "200",
    "message": "success",
    "type": "CommunityMain",
    "title": "커뮤니티",
    "body": [
      {
        "@type": "appBarNormal",
        "items": [
          {
            "@category": "community",
            "title": "커뮤니티",
            "search": "true",
            "noti": "true"
          }
        ]
      },
      {
        "@type": "tabs",
        "items": [
          {
            "@category": "tabList",
            "boards": [
              {
                "boardType": "popular",
                "boardLabel": "인기",
              },
              {
                "boardType": "general",
                "boardLabel": "자유",
              },
              {
                "boardType": "qna",
                "boardLabel": "Q&A",
              },
              {
                "boardType": "review",
                "boardLabel": "후기",
              },
              {
                "boardType": "share",
                "boardLabel": "나눔",
              },
              {
                "boardType": "info",
                "boardLabel": "정보",
              },
            ]
          },
        ],
        "blocks": [
          {
            "@type": "tabItem",
            "blocks": [
              {
                "@type": "boardType",
                "items": [
                  {
                    "@category": "boardType",
                    "boardType": "popular",
                    "boardLabel": "인기",
                  }
                ]
              },
              {
                "@type": "boardSection",
                "itemCount": 6,
                "items": [
                  {
                    "@category": "postPreview",
                    "boardType": "review",
                    "boardLabel": "후기",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "share",
                    "boardLabel": "나눔",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "info",
                    "boardLabel": "정보",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "review",
                    "boardLabel": "후기",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "qna",
                    "boardLabel": "Q&A",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "general",
                    "boardLabel": "자유",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ]
              },
            ],
          },
          {
            "@type": "tabItem",
            "blocks": [
              {
                "@type": "boardType",
                "items": [
                  {
                    "@category": "boardType",
                    "boardType": "general",
                    "boardLabel": "자유",
                  }
                ]
              },
              {
                "@type": "boardSection",
                "title": "인기글",
                "itemCount": 3,
                "items": [
                  {
                    "@category": "postPreview",
                    "boardType": "general",
                    "boardLabel": "BEST",
                    "title": "인기글 제목",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "general",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "general",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              },
              {
                "@type": "boardSection",
                "title": "전체글",
                "itemCount": "5",
                "items": [
                  {
                    "@category": "postPreview",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 커피",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 음료",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 에어컨",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 모니터",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              }
            ]
          },
          {
            "@type": "tabItem",
            "blocks": [
              {
                "@type": "boardType",
                "items": [
                  {
                    "@category": "boardType",
                    "boardType": "qna",
                    "boardLabel": "Q&A",
                  }
                ]
              },
              {
                "@type": "boardSection",
                "title": "인기글",
                "itemCount": "3",
                "items": [
                  {
                    "@category": "postPreview",
                    "boardType": "qna",
                    "boardLabel": "BEST",
                    "title": "인기글 제목",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "qna",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "qna",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              },
              {
                "@type": "boardSection",
                "title": "전체글",
                "itemCount": 5,
                "items": [
                  {
                    "@category": "postPreview",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 커피",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 음료",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 에어컨",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 모니터",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              }
            ]
          },
          {
            "@type": "tabItem",
            "blocks": [
              {
                "@type": "boardType",
                "items": [
                  {
                    "@category": "boardType",
                    "boardType": "review",
                    "boardLabel": "후기",
                  }
                ]
              },
              {
                "@type": "boardSection",
                "title": "인기글",
                "itemCount": "3",
                "blocks": [
                  {
                    "@type": "sectionMeta",
                    "items": [
                      {
                        "@category": "boardSectionMeta",
                      }
                    ],
                  },
                ],
                "items": [
                  {
                    "@category": "postPreview",
                    "boardType": "review",
                    "boardLabel": "BEST",
                    "title": "인기글 제목",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "review",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "review",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              },
              {
                "@type": "boardSection",
                "title": "전체글",
                "itemCount": "5",
                "items": [
                  {
                    "@category": "postPreview",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 커피",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 음료",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 에어컨",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 모니터",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              }
            ]
          },
          {
            "@type": "tabItem",
            "boardType": "share",
            "boardLabel": "나눔",
            "blocks": [
              {
                "@type": "boardType",
                "items": [
                  {
                    "@category": "boardType",
                    "boardType": "share",
                    "boardLabel": "나눔",
                  }
                ]
              },
              {
                "@type": "boardSection",
                "title": "인기글",
                "itemCount": "3",
                "items": [
                  {
                    "@category": "postPreview",
                    "boardType": "share",
                    "boardLabel": "BEST",
                    "title": "인기글 제목",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "share",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "share",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              },
              {
                "@type": "boardSection",
                "title": "전체글",
                "itemCount": "5",
                "items": [
                  {
                    "@category": "postPreview",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 커피",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 음료",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 에어컨",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 모니터",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              }
            ]
          },
          {
            "@type": "tabItem",
            "blocks": [
              {
                "@type": "boardType",
                "items": [
                  {
                    "@category": "boardType",
                    "boardType": "info",
                    "boardLabel": "정보",
                  }
                ]
              },
              {
                "@type": "boardSection",
                "title": "인기글",
                "itemCount": "3",
                "items": [
                  {
                    "@category": "postPreview",
                    "boardType": "info",
                    "boardLabel": "BEST",
                    "title": "인기글 제목",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "info",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "boardType": "info",
                    "boardLabel": "BEST",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글 요양병원의 핫한 인기글",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              },
              {
                "@type": "boardSection",
                "title": "전체글",
                "itemCount": "5",
                "items": [
                  {
                    "@category": "postPreview",
                    "title": "요양병원 질문",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 커피",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 음료",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 에어컨",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                  {
                    "@category": "postPreview",
                    "title": "요양병원 모니터",
                    "content":
                        "요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문 요양병원의 가나다라마바사 질문",
                    "profileImage": "account_circle_default.svg",
                    "author": "사용자 ID",
                    "likeCount": Random().nextInt(100) + 1,
                    "viewCount": Random().nextInt(100) + 1,
                    "commentCount": Random().nextInt(100) + 1,
                  },
                ],
              }
            ]
          }
        ]
      }
    ]
  };
}
