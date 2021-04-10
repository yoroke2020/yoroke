import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/views/components/YrkListView.dart';

import 'YrkModalBottomSheetListItem.dart';

class YrkModelBottomSheet extends StatelessWidget {
  const YrkModelBottomSheet(
      {Key key, this.listItem, this.listHeight = 120, this.listItemCount = 0})
      : super(key: key);

  final List<Widget> listItem;
  final int listItemCount;
  final double listHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.0,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                height: 44.0,
                width: double.maxFinite,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/icon_clear_24_px.png",
                          width: 14.0, height: 14.0),
                    ))),
            YrkListView(
              item: listItem,
              height: listHeight,
              itemCount: listItemCount,
            ),
            // YrkModalBottomSheetListItem(
            //   imageAsset: "assets/icons/icon_clear_24_px.png",
            //   title: "공유하기",
            // ),
            // YrkModalBottomSheetListItem(
            //   imageAsset: "assets/icons/icon_clear_24_px.png",
            //   title: "공유하기",
            // ),
            // YrkModalBottomSheetListItem(
            //   imageAsset: "assets/icons/icon_clear_24_px.png",
            //   title: "공유하기",
            // ),
            // YrkModalBottomSheetListItem(
            //   imageAsset: "assets/icons/icon_clear_24_px.png",
            //   title: "공유하기",
            // ),
            // YrkModalBottomSheetListItem(
            //   imageAsset: "assets/icons/icon_clear_24_px.png",
            //   title: "공유하기",
            // ),
            // YrkModalBottomSheetListItem(
            //   imageAsset: "assets/icons/icon_clear_24_px.png",
            //   title: "공유하기",
            // )
          ],
        ));
  }
}
