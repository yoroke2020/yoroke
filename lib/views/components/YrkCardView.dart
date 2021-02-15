import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/board/BoardCardList.dart';
import 'package:yoroke/views/components/YrkListView.dart';

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
  YrkCardView({
    this.itemCount = 1,
    this.onPushNavigator,
    this.clickable = true,
    this.width = double.maxFinite,
    this.height = 120.0,
    this.borderRadius = 16,
    this.onTapPageIndex,
    @required this.item,
    this.index = 0,
  });

  final int itemCount;
  final ValueChanged<YrkData> onPushNavigator;
  final bool clickable;
  final double height;
  final double width;
  final double borderRadius;
  final int onTapPageIndex;
  final TextType textType;

  YrkListItem item;
  int index;

  Widget _widget(int index) {
    YrkListItem item = this.item.clone();
    item.parentIndex = this.index;
    item.index = index;
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        child: new Container(
            width: double.maxFinite,
            height: height,
            child: Align(
                alignment: Alignment.center,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  physics: new AlwaysScrollableScrollPhysics(),
                  itemCount: itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(borderRadius)),
                        margin: const EdgeInsets.only(right: 8),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(borderRadius),
                            onTap: () => onPushNavigator(new YrkData(
                                SubItem.values[onTapPageIndex],
                                "조문기의 리뷰 카드 번호 " + index.toString() + "번",
                                appBarType: AppBarType.disable,
                                cardIndex: index)),
                            child: _widget(index)));
                  },
                ))));
  }
}
