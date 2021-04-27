import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';

// ignore: must_be_immutable
class AppBarNormal extends AppBar {
  final ValueChanged<YrkData>? onPushNavigator;
  final String? label;
  Function()? onLeadingPressed;

  AppBarNormal({
    Key? key,
    this.onPushNavigator,
    this.label,
    this.onLeadingPressed,
  }) : super(
            key: key,
            backgroundColor: const Color(0xffffffff),
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Image.asset(
                      "assets/icons/account_circle_default_24_px.png"),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  // tooltip:
                  //     MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 8),
                width: 32,
                height: 32,
                child: Image.asset("assets/icons/search_24_px.png"),
              ),
              Container(
                padding: const EdgeInsets.only(right: 8),
                width: 32,
                height: 32,
                child: Image.asset("assets/icons/create_24_px.png"),
              ),
              InkWell(
                  onTap: () {
                    onPushNavigator!(new YrkData(SubPageItem.notice));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 18),
                    width: 42,
                    height: 42,
                    child: Image.asset(
                        "assets/icons/notifications_none_24_px.png"),
                  )),
            ],
            title: Text(label ?? ""));
}
