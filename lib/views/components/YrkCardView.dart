import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/models/YrkData.dart';

enum TextType { title, title_desc }

extension TextTypeExtension on TextType {
  Container getTextContainer(cardNameList, cardDescList, index) {
    switch (this) {
      case TextType.title:
        return Container(
            padding: EdgeInsets.only(left: 12, bottom: 8),
            alignment: Alignment.bottomLeft,
            child: Text(
              cardNameList.elementAt(index),
              style: const TextStyle(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
            ));
      case TextType.title_desc:
        return Container(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  cardNameList.elementAt(index),
                  style: const TextStyle(
                      color: const Color(0xe6000000),
                      fontWeight: FontWeight.w700,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                ),
                Text(
                  (cardDescList == null ||
                          cardDescList.elementAt(index) == null)
                      ? ""
                      : cardDescList.elementAt(index),
                  style: const TextStyle(
                      color: const Color(0xe6000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                ),
              ],
            ));
      default:
        return Container();
    }
  }
}

class YrkCardView extends StatelessWidget {
  YrkCardView(
      {@required this.onPushNavigator,
      @required this.cardImageList,
      @required this.cardNameList,
      this.cardDescList,
      this.viewWidth = double.maxFinite,
      this.viewHeight = 120.0,
      this.cardWidth = 100.0,
      this.cardHeight = 100.0,
      this.onTapPageIndex,
      this.textType = TextType.title});

  final ValueChanged<YrkData> onPushNavigator;
  final List<String> cardImageList;
  final List<String> cardNameList;
  final List<String> cardDescList;
  final double viewHeight;
  final double viewWidth;
  final double cardWidth;
  final double cardHeight;
  final int onTapPageIndex;
  final TextType textType;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        child: new Container(
            width: double.maxFinite,
            height: viewHeight,
            child: Align(
                alignment: Alignment.center,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  physics: new AlwaysScrollableScrollPhysics(),
                  itemCount: cardImageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        margin: const EdgeInsets.only(right: 8),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => onPushNavigator(new YrkData(
                                SubItem.values[onTapPageIndex],
                                "조문기의 리뷰 카드 번호 " + index.toString() + "번",
                                appBarType: AppBarType.disable,
                                cardIndex: index)),
                            child: new Container(
                                width: cardWidth,
                                height: cardHeight,
                                child: Stack(children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            cardImageList.elementAt(index)),
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
                                  textType.getTextContainer(
                                      cardNameList, cardDescList, index),
                                ]))));
                  },
                ))));
  }
}
