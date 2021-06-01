import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/board/BoardReview.dart';

class HomeCardListItem extends StatelessWidget {
  HomeCardListItem({
    required this.width,
    required this.height,
    required this.index,
  });

  final double width;
  final double height;
  final int index;

  void _onCardItemClicked(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BoardReview(data: new YrkData())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _onCardItemClicked(context),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: new Container(
                width: width,
                height: height,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: new DecorationImage(
                        image: new AssetImage(testCardImage.elementAt(index)),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(
                              begin: Alignment(0.5, -0.0739222913980484),
                              end: Alignment(0.5, 1),
                              colors: [
                                const Color(0x00ffffff),
                                const Color(0x4d000000)
                              ]))),
                  Container(
                      padding: EdgeInsets.only(left: 16, bottom: 16),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(testHomeTitleString.elementAt(index),
                                style: const TextStyle(
                                    color: const Color(0xe6000000),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "NotoSansCJKKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                            Text(testHomeDescString.elementAt(index),
                                style: const TextStyle(
                                    color: const Color(0xe6000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left),
                          ])),
                ]))));
  }
}
