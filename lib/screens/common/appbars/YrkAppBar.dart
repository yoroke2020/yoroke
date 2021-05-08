import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';

import '../YrkTextStyle.dart';

enum YrkAppBarType {
  accountCircleAll,
  arrowBackAll,
  arrowBackOnly,
  TextSearchNotification
}

class YrkAppBar extends StatelessWidget implements PreferredSizeWidget {
  YrkAppBar(
      {Key? key,
      this.onPushNavigator,
      this.label = "",
      this.type = YrkAppBarType.accountCircleAll,
      this.isStatusBar = true})
      : super(
          key: key,
        );

  final ValueChanged<YrkData>? onPushNavigator;
  final String? label;
  final YrkAppBarType type;
  final bool isStatusBar;

  Widget getLeading(BuildContext context) {
    switch (type) {
      case YrkAppBarType.accountCircleAll:
        return YrkIconButton(
          icon: "assets/icons/account_circle_default_36_px.svg",
          width: 32.0,
          height: 32.0,
          padding: EdgeInsets.all(0),
          onTap: Scaffold.of(context).openDrawer,
        );
      case YrkAppBarType.arrowBackAll:
      case YrkAppBarType.arrowBackOnly:
        return YrkIconButton(
          icon: "assets/icons/icon_arrow_back_24_px.svg",
          width: 24.0,
          height: 24.0,
          onTap: Navigator.of(context).pop,
        );
      default:
        return Container();
    }
  }

  get getTitle {
    if (label != "")
      return Text(label!,
          style:
              const YrkTextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
          textAlign: TextAlign.left);
    else
      return Spacer();
  }

  get getActions {
    bool searchButton = false;
    bool createButton = false;
    bool notificationButton = false;

    switch (type) {
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
      default:
        break;
    }

    List<Widget> ret = <Widget>[];
    if (searchButton)
      ret.add(
        YrkIconButton(
          icon: "assets/icons/icon_search_24_px.svg",
          onTap: () {
            onPushNavigator!(new YrkData(nextPageItem: SubPageItem.search));
          },
        ),
      );
    if (createButton)
      ret.add(YrkIconButton(
        icon: "assets/icons/icon_create_24_px.svg",
        onTap: () {
          onPushNavigator!(new YrkData(nextPageItem: SubPageItem.postCreate));
        },
        // color: Colors.yellow,
      ));
    if (notificationButton)
      ret.add(
        YrkIconButton(
          icon: "assets/icons/icon_notifications_none_24_px.svg",
          padding: EdgeInsets.only(left: 4.0),
          onTap: () {
            onPushNavigator!(new YrkData(nextPageItem: SubPageItem.notice));
          },
        ),
      );
    return Wrap(children: ret);
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
          height: isStatusBar ? 48.0 + statusBarHeight : 48.0,
          padding: isStatusBar
              ? EdgeInsets.only(top: statusBarHeight)
              : EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              getLeading(context),
              getTitle,
              Spacer(),
              getActions,
            ],
          )),
    );
  }
}
