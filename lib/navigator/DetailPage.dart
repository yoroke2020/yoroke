import 'package:flutter/cupertino.dart';
import 'package:helloflutter/screens/BoardReview.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.rootIndex, this.currentIndex});

  final int rootIndex;
  final int currentIndex;


  @override
  Widget build(BuildContext context) {
    final List<List<Widget>> detailPage = [[], [BoardReview(), BoardReview()], [], []];

    return detailPage[rootIndex][currentIndex];
  }
}