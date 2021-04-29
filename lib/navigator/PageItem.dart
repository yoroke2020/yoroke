import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/home/HomeHistory.dart';
import 'package:yoroke/screens/info/InfoShareDetail.dart';
import 'package:yoroke/screens/notice/Notice.dart';
import 'package:yoroke/screens/post/Post.dart';
import 'package:yoroke/screens/search/Search.dart';

enum RootPageItem { home, board, find, info }

enum SubPageItem {
  search,
  notice,
  homePopular,
  homeHistory,
  boardReview,
  boardReviewFeed,
  boardQna,
  boardJobFinding,
  infoShareDetail,
  postCreate,
  testPage,
}

const Map<RootPageItem, String> rootPageTabIconInfo = {
  RootPageItem.home: 'home',
  RootPageItem.board: 'board',
  RootPageItem.find: 'find',
  RootPageItem.info: 'info',
};

const Map<RootPageItem, String> rootPageTabLabelInfo = {
  RootPageItem.home: '홈',
  RootPageItem.board: '자유게시판',
  RootPageItem.find: '시설찾기',
  RootPageItem.info: '정보공유',
};

extension SubPageItemExt on SubPageItem {
  Widget widget(YrkData? data, ValueChanged<YrkData>? onPushNavigator) {
    switch (this) {
      case SubPageItem.search:
        return Search(data: data);
      case SubPageItem.notice:
        return Notice(data: data);
      case SubPageItem.homePopular:
        return Post(data: data);
      case SubPageItem.homeHistory:
        return HomeHistory(data: data);
      case SubPageItem.boardReview:
        return BoardReview(data: data, onPushNavigator: onPushNavigator);
      case SubPageItem.boardQna:
        return Post(data: data);
      case SubPageItem.boardJobFinding:
        return Post(data: data);
      case SubPageItem.boardReviewFeed:
        return Post(data: data);
      case SubPageItem.infoShareDetail:
        return InfoShareDetail(data: data, onPushNavigator: onPushNavigator);
      case SubPageItem.postCreate:
        return PostCreate(data: data);
      case SubPageItem.testPage:
        return TestPage();
    }
  }
}
