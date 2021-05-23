import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/find/FindFacilityMap.dart';

class FindFacilityBottomBar extends StatefulWidget
    implements PreferredSizeWidget {
  @override
  _FindFacilityBottomBarState createState() => _FindFacilityBottomBarState();

  @override
  Size get preferredSize => Size.fromHeight(72.0);
}

class _FindFacilityBottomBarState extends State<FindFacilityBottomBar> {
  static final List<String> _bottomButtonTextList = ["북마크", "위치", "전화", "공유"];
  static final List<String> _bottomButtonImageList = [
    "assets/icons/icon_bookmark_on.svg",
    "assets/icons/icon_location.svg",
    "assets/icons/icon_phone.svg",
    "assets/icons/icon_share_color.svg"
  ];

  bool _isBookmarked = false;

  get getBottomBarButtonList {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(Expanded(
        child: InkWell(
          onTap: () => _onTapBottomBarButton(i),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              YrkIconButton(
                icon: _isBookmarked
                    ? _bottomButtonImageList[i]
                    : i == 0
                        ? "assets/icons/icon_bookmark_off.svg"
                        : _bottomButtonImageList[i],
                width: 24.0,
                height: 24.0,
                padding: EdgeInsets.all(2.0),
                clickable: false,
                color: const Color(0xfff5df4d),
              ),
              Text(
                _bottomButtonTextList[i],
                style: const YrkTextStyle(),
              )
            ],
          ),
        ),
      ));
      if (i < 3) {
        list.add(Container(
            width: 1,
            height: 24,
            decoration: BoxDecoration(color: const Color(0xffe5e5e5))));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: getBottomBarButtonList,
        ));
  }

  void _onTapBottomBarButton(int index) {
    switch (index) {
      case 0:
        _onBookmark();
        break;
      case 1:
        _onMap(context);
        break;
      case 2:
        _onPhone("01025276198");
        break;
      case 3:
        _onShare(context);
        break;
      default:
        return;
    }
  }

  void _onBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  void _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share("URL");
  }

  void _onPhone(String digits) {
    launch("tel://$digits");
  }

  void _onMap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FindFacilityMap()));
  }
}
