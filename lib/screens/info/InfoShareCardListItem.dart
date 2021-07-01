import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/temp/TestData.dart';
import 'package:yoroke/temp/YrkData.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/info/InfoShareDetail.dart';

class InfoShareCardListItem extends StatefulWidget {
  InfoShareCardListItem({
    required this.width,
    required this.height,
    required this.index,
    this.tabIndex,
  });

  final double? width;
  final double? height;
  final int index;
  final int? tabIndex;

  @override
  _InfoShareCardListItemState createState() => _InfoShareCardListItemState();
}

class _InfoShareCardListItemState extends State<InfoShareCardListItem> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _onDetailClicked(context),
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
                              fit: BoxFit.fill))),
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
                                padding: EdgeInsets.all(4),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      YrkIconButton(
                                          icon: _isBookmarked
                                              ? "icon_bookmark_on.svg"
                                              : "icon_bookmark_off.svg",
                                          iconSize: 24,
                                          color: Colors.white,
                                          onTap: () {
                                            setState(() {
                                              _isBookmarked = !_isBookmarked;
                                            });
                                          })
                                    ])),
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                  infoShareHospitalTitle
                                      .elementAt(widget.index),
                                  style: const TextStyle(
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "NotoSansCJKKR",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 22.0),
                                  textAlign: TextAlign.left),
                            )
                          ]))
                ]))),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent);
  }

  void _onDetailClicked(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InfoShareDetail(
                  data: new YrkData(
                      str0: infoShareHospitalTitle.elementAt(widget.index),
                      str1: testDate.elementAt(widget.index)))));
    });
  }
}
