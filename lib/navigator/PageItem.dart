import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/Post.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/home/HomeHistory.dart';

enum RootPageItem { home, board, find, info }

enum SubPageItem {
  homePopular,
  homeHistory,
  boardReview,
  boardQna,
  boardJobFinding
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
    }
  }
}
