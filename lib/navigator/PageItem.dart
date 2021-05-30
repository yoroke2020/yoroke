import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/TestPage.dart';
import 'package:yoroke/screens/board/BoardJobFinding.dart';
import 'package:yoroke/screens/board/BoardQna.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/post/Post.dart';

enum RootPageItem { home, board, find, info }

enum SubPageItem {
  boardReview,
  boardQna,
  boardJobFinding,
  post,
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
      case SubPageItem.boardReview:
        return BoardReview(data: data, onPushNavigator: onPushNavigator);
      case SubPageItem.boardQna:
        return BoardQna(onPushNavigator: onPushNavigator);
      case SubPageItem.boardJobFinding:
        return BoardJobFinding(onPushNavigator: onPushNavigator);
      // case SubPageItem.infoShareDetail:
      //   return InfoShareDetail(data: data, onPushNavigator: onPushNavigator);
      // case SubPageItem.postCreate:
      //   return PostCreate(data: data);
      case SubPageItem.testPage:
        return TestPage();
      case SubPageItem.post:
        return Post(data: data);
      // case SubPageItem.findFacility:
      //   return FindFacility(data: data, onPushNavigator: onPushNavigator);
    }
  }
}
