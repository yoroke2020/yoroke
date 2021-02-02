import 'package:flutter/cupertino.dart';
import 'package:helloflutter/screens/board/BoardReview.dart';
import 'package:helloflutter/screens/board/Sample.dart';
import 'package:helloflutter/tools/Data.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.rootIndex, this.data, this.onPushNavigator});

  final int rootIndex;
  final Data data;
  final ValueChanged<Data> onPushNavigator;

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
