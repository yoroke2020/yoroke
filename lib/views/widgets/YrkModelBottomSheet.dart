import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/views/components/YrkListView.dart';

import 'YrkModalBottomSheetListItem.dart';

class YrkModelBottomSheet extends StatelessWidget {
  const YrkModelBottomSheet(
      {required this.listItem, this.listHeight = 120, this.listItemCount = 0});

  final List<Widget> listItem;
  final int listItemCount;
  final double listHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: listHeight + 44.0,
        width: double.maxFinite,
        color: const Color(0xFF737373),
        child: new Container(
            decoration: new BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)
                    )),
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
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Image.asset("assets/icons/icon_clear_24_px.png",
                              width: 14.0, height: 14.0),
                        ))),
                YrkListView(
                  item: listItem,
                  height: listHeight,
                  itemCount: listItemCount,
                ),
              ],
            )));
  }
}
