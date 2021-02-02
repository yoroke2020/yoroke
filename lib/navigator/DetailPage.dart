import 'package:flutter/cupertino.dart';
import 'package:helloflutter/screens/board/BoardReview.dart';
import 'package:helloflutter/screens/board/Sample.dart';
import 'package:helloflutter/models/YrkData.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.rootIndex, this.data, this.onPushNavigator});

  final int rootIndex;
  final YrkData data;
  final ValueChanged<YrkData> onPushNavigator;

  @override
  Widget build(BuildContext context) {
    final List<List<Widget>> detailPage = [
      [],
      [BoardReview(data, onPushNavigator), Sample(data)],
      [],
      []
    ];
    return detailPage[rootIndex][data.currentIndex.index];
  }
}
