import 'package:flutter/cupertino.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/components/YrkListView.dart';

class BoardCardList extends YrkListItem {
  BoardCardList(width, height, {Key key, @required this.data})
      : super(width, height);

  final YrkData data;

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: width,
        height: height,
        child: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(16)),
              image: new DecorationImage(
                image: new AssetImage(
                    testCardImage.elementAt(index)),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(16)),
                  gradient: LinearGradient(
                      begin: Alignment(
                          0.5, -0.0739222913980484),
                      end: Alignment(0.5, 1),
                      colors: [
                        const Color(0x00ffffff),
                        const Color(0x4d000000)
                      ]))),
          Container(
              padding:
              EdgeInsets.only(left: 12, bottom: 8),
              alignment: Alignment.bottomLeft,
              child: Text(
                testShortString.elementAt(index),
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
              )),
        ]));
  }

  @override
  clone() {
    return BoardCardList(width, height);
  }

}