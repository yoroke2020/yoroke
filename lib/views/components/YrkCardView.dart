import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/board/BoardCardList.dart';
import 'package:yoroke/views/components/YrkListView.dart';

class YrkCardView extends StatelessWidget {
  YrkCardView(
      {@required this.onPushNavigator,
      @required this.item,
      this.width = double.maxFinite,
      this.height = 120.0,
      this.onTapPageIndex,
      this.index = 0,
      this.clickable = true,
      this.itemCount = 1});

  final ValueChanged<YrkData> onPushNavigator;
  final double height;
  final double width;
  final int onTapPageIndex;
  final bool clickable;
  final int itemCount;

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
                            borderRadius: BorderRadius.circular(16)),
                        margin: const EdgeInsets.only(right: 8),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(16),
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
