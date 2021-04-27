import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

// ignore: must_be_immutable
class AppBarArrowBack extends StatefulWidget implements PreferredSizeWidget {
  String? label;
  AppBarArrowBack({
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  _AppBarArrowBackState createState() => _AppBarArrowBackState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarArrowBackState extends State<AppBarArrowBack> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            "assets/icons/icon_arrow_back_24_px.png",
            width: 24.0,
            height: 24.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.label ?? "",
          // style: YrkTextStyle(),
        ));
  }
}
