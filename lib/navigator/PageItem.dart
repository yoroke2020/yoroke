import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum RootPageItem { home, board, find, info }

enum SubItem { boardReview, boardQna, boardJobFinding }

enum AppBarType { normal, yellow, arrowBack, disable }

enum BottomNavigationType { normal, comments, disable }

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