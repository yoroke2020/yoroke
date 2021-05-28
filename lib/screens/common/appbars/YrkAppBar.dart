import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/main.dart';
import 'package:yoroke/models/TestData.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/notice/Notice.dart';
import 'package:yoroke/screens/post/PostCreate.dart';
import 'package:yoroke/screens/search/Search.dart';

import '../YrkTextStyle.dart';

enum YrkAppBarType {
  accountCircleAll,
  arrowBackAll,
  arrowBackOnly,
  arrowBackMidTitle,
  TextSearch,
  TextSearchNotification
}

class YrkAppBar extends StatefulWidget implements PreferredSizeWidget {
  YrkAppBar(
      {Key? key,
      this.onPushNavigator,
      this.curPageItem,
      this.label = "",
      required this.type,
      this.isStatusBar = true})
      : super(
          key: key,
        );

  final ValueChanged<YrkData>? onPushNavigator;
  final curPageItem;
  final String? label;
  final YrkAppBarType type;
  final bool isStatusBar;

  @override
  _YrkAppBarState createState() => _YrkAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}

class _YrkAppBarState extends State<YrkAppBar> {
  @override
  initState() {
    super.initState();
    profileController.addListener(() {
      if (profileController.isImageChanging) setState(() {});
    });
  }

  @override
  void dispose() {
    profileController.removeListener(() {
      if (profileController.isImageChanging) setState(() {});
    });
    super.dispose();
  }

  Widget getLeading(BuildContext context) {
    switch (widget.type) {
      case YrkAppBarType.accountCircleAll:
        return GestureDetector(
          onTap: Scaffold.of(context).openDrawer,
          child: CircleAvatar(
            radius: 16.0,
            backgroundImage: profileController.accountImage,
            backgroundColor: const Color(0xffffffff),
          ),
        );
      case YrkAppBarType.arrowBackAll:
      case YrkAppBarType.arrowBackOnly:
      case YrkAppBarType.arrowBackMidTitle:
        return YrkIconButton(
          icon: "icon_arrow_back.svg",
          iconSize: 24.0,
          onTap: Navigator.of(context).pop,
        );
      default:
        return Container();
    }
  }

  get getTitle {
    if (widget.label != "") if (widget.type == YrkAppBarType.arrowBackMidTitle)
      return Text(widget.label!,
          style: const YrkTextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.left);
    else
      return Text(widget.label!,
          style:
              const YrkTextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
          textAlign: TextAlign.left);
    else
      return Spacer();
  }

  Widget getActions(BuildContext context) {
    bool searchButton = false;
    bool createButton = false;
    bool notificationButton = false;

    switch (widget.type) {
      case YrkAppBarType.accountCircleAll:
      case YrkAppBarType.arrowBackAll:
        searchButton = true;
        createButton = true;
        notificationButton = true;
        break;
      case YrkAppBarType.TextSearchNotification:
        searchButton = true;
        notificationButton = true;
        break;
      case YrkAppBarType.TextSearch:
        searchButton = true;
        break;
      default:
        break;
    }

    List<Widget> ret = <Widget>[];
    if (searchButton)
      ret.add(
        YrkIconButton(
          icon: "icon_search.svg",
          onTap: () => _onSearchClicked(context),
        ),
      );
    if (createButton)
      ret.add(YrkIconButton(
        icon: "icon_create.svg",
        onTap: () => _onCreateClicked(context),
      ));
    if (notificationButton)
      ret.add(
        YrkIconButton(
          icon: "icon_notifications_none.svg",
          padding: EdgeInsets.only(left: 4.0),
          onTap: () => _onNoticeClicked(context),
        ),
      );
    if (ret.length == 0) {
      ret.add(SizedBox(width: 32));
    }
    return Wrap(children: ret);
  }

  void _onSearchClicked(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Search(
                  data: new YrkData(prevPageItem: widget.curPageItem),
                  onPushNavigator: widget.onPushNavigator)));
    });
  }

  void _onCreateClicked(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostCreate(
                  data: new YrkData(prevPageItem: widget.curPageItem))));
    });
  }

  void _onNoticeClicked(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Notice(data: new YrkData(prevPageItem: widget.curPageItem))));
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
          color: Colors.transparent,
          height: widget.isStatusBar ? 48.0 + statusBarHeight : 48.0,
          padding: widget.isStatusBar
              ? EdgeInsets.only(top: statusBarHeight)
              : EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              getLeading(context),
              if (widget.type == YrkAppBarType.arrowBackMidTitle) Spacer(),
              getTitle,
              Spacer(),
              getActions(context),
            ],
          )),
    );
  }

  _onTapAccountImage(BuildContext context) async {}
}
