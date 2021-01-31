import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum TabItem { home, board, find, info }

enum DetailItem { review, qna, jobFinding }

const Map<TabItem, int> tabIndex = {
  TabItem.home: 0,
  TabItem.board: 1,
  TabItem.find: 2,
  TabItem.info: 3,
};

const Map<TabItem, String> tabIconInfo = {
  TabItem.home: 'home',
  TabItem.board: 'board',
  TabItem.find: 'find',
  TabItem.info: 'info',
};

const Map<TabItem, String> tabLabelInfo = {
  TabItem.home: '홈',
  TabItem.board: '자유게시판',
  TabItem.find: '시설찾기',
  TabItem.info: '정보공유',
};
