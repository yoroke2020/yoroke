import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/Post.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/TestPage.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/appbars/AppBarEmpty.dart';
import 'package:yoroke/views/appbars/AppBarArrowBack.dart';
import 'package:yoroke/views/appbars/AppBarNormal.dart';
import 'package:yoroke/views/appbars/AppBarYellow.dart';
import 'package:yoroke/views/bottombars/BottomBarComment.dart';
import 'package:yoroke/views/bottombars/BottomBarNavigation.dart';

import 'PageItem.dart';

class SubPage extends StatelessWidget {
  SubPage({this.rootIndex, this.data, this.onPushNavigator});

  final int rootIndex;
  final YrkData data;
  final ValueChanged<YrkData> onPushNavigator;

  @override
  Widget build(BuildContext context) {
    final List<List<Widget>> pages = [
      [
        Post(data: data),
        Post(data: data),
        Post(data: data),
      ],
      [
        BoardReview(data: data, onPushNavigator: onPushNavigator),
        Post(data: data),
        Post(data: data),
      ],
      [],
      []
    ];

    return pages[rootIndex][data.nextPageItem.index];
  }
}
