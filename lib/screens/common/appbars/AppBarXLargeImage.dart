import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkButton.dart';

import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class AppBarXLargeImage extends StatefulWidget implements PreferredSizeWidget {
  AppBarXLargeImage({
    required this.titleText,
    required this.date,
    this.height,
  });

  final String titleText;
  final String date;
  final double? height;

  bool _isBookmarked = false;

  @override
  _AppBarXLargeImageState createState() => _AppBarXLargeImageState();

  double trimHeight(double? _h) {
    _h ??= 0;
    double _maxH = 480, _minH = 48, ret = _maxH - _h;

    if (ret < _minH)
      return 48;
    else if (ret > _maxH)
      return _maxH;
    else
      return ret;
  }

  @override
  Size get preferredSize => Size.fromHeight(trimHeight(this.height));
}

class _AppBarXLargeImageState extends State<AppBarXLargeImage> {
  double _bottomHeight() =>
      widget.preferredSize.height < 100 ? 0 : widget.preferredSize.height - 100;
  double _opacity() => widget.preferredSize.height > 250 ? 1.0 : 0.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            icon: Image.asset(
              widget._isBookmarked
                  ? "assets/icons/icon_bookmarked_24_px.png"
                  : "assets/icons/icon_bookmark_24_px.png",
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                widget._isBookmarked = !widget._isBookmarked;
              });
            },
          ),
        ],
        flexibleSpace: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: _opacity(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(testInfoShareImage.elementAt(0)),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: widget.preferredSize,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: _opacity(),
              child: Container(
                width: double.infinity,
                height: _bottomHeight(),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: new YrkButton(
                        buttonType: ButtonType.chip,
                        clickable: true,
                        onPressed: () {},
                        label: "복지시설",
                        fontSize: 14.0,
                        width: 88,
                        height: 24,
                      ),
                    ),
                    Container(
                        // height: 24,
                        child: Text(widget.titleText,
                            style: YrkTextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                                fontSize: 32.0),
                            textAlign: TextAlign.left)),
                    Container(
                      // height: 20,
                      child: Text(widget.date,
                          style: YrkTextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
            )));
  }
}
