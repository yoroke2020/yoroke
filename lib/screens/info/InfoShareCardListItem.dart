import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';

class InfoShareCardListItem extends StatefulWidget {
  InfoShareCardListItem(
      {required this.width,
      required this.height,
      required this.index,
      this.onPushNavigator});

  final double? width;
  final double? height;
  final int index;
  final ValueChanged<YrkData>? onPushNavigator;

  bool _isBookmarked = false;

  @override
  _InfoShareCardListItemState createState() => _InfoShareCardListItemState();
}

class _InfoShareCardListItemState extends State<InfoShareCardListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPushNavigator!(new YrkData(
        SubPageItem.infoShareDetail,
        str0: infoShareHospitalTitle.elementAt(widget.index),
        str1: testDate.elementAt(widget.index),
      )),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: new Container(
              width: widget.width ?? 328,
              height: widget.height ?? 014,
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: new DecorationImage(
                      image: new AssetImage(
                          testInfoShareImage.elementAt(widget.index)),
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
                    alignment: Alignment.bottomLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // padding: EdgeInsets.only(left: 16, bottom: 16),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    splashColor: Colors.transparent,
                                    icon: Image.asset(
                                      widget._isBookmarked
                                          ? "assets/icons/icon_bookmarked_24_px.png"
                                          : "assets/icons/icon_bookmark_24_px.png",
                                      width: 24,
                                      height: 24,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        widget._isBookmarked =
                                            !widget._isBookmarked;
                                      });
                                    },
                                  ),
                                ]),
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            child: Text(
                                infoShareHospitalTitle.elementAt(widget.index),
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "NotoSansCJKKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22.0),
                                textAlign: TextAlign.left),
                          ),
                        ])),
              ]))),
    );
  }
}