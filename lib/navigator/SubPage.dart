import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/post/Post.dart';

class SubPage extends StatelessWidget {
  SubPage({this.rootIndex, this.data, this.onPushNavigator});

  final int? rootIndex;
  final YrkData? data;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  Widget build(BuildContext context) {
    final List<List<Widget>> pages = [
      [
        Post(data: data),
        Post(data: data),
        Post(data: data),
      ],
      [
        Post(data: data),
        Post(data: data),
        BoardReview(data: data, onPushNavigator: onPushNavigator),
        Post(data: data),
        Post(data: data),
      ],
      [],
      []
    ];

    return pages[rootIndex!][data!.nextPageItem!.index];
  }
}
