import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/common/YrkListView.dart';
import 'package:yoroke/screens/common/YrkTabBarView.dart';
import 'package:yoroke/screens/info/InfoShareCardListItem.dart';

class Info extends StatefulWidget {
  Info({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;
  bool isGrid = false;

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  List<Widget> _infoShareCardListItem(int pageIndex) {
    double _expandWidth = MediaQuery.of(context).size.width - 32 - 16;

    List<Widget> list = <Widget>[];
    if (widget.isGrid) {
      for (int i = 0; i < 10; i++) {
        list.add(InfoShareCardListItem(
          width: _expandWidth,
          height: 104,
          index: i,
          onPushNavigator: widget.onPushNavigator,
        ));
      }
    } else {
      for (int i = 0; i < 10; i += 2) {
        list.add(Container(
            width: _expandWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InfoShareCardListItem(
                  width: (_expandWidth - 24) / 2,
                  height: 172,
                  index: i,
                  onPushNavigator: widget.onPushNavigator,
                ),
                InfoShareCardListItem(
                  width: (_expandWidth - 24) / 2,
                  height: 172,
                  index: i + 1,
                  onPushNavigator: widget.onPushNavigator,
                ),
              ],
            )));
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YrkTabBarView(
        length: 3,
        tabWidth: 99,
        tabBarViewHeight:
            MediaQuery.of(context).size.height - kToolbarHeight - 40.0 - 48.0,
        tabTextList: ["의료시설", "복지시설", "돌봄서비스"],
        tabViewList: [
          YrkListView(
            height: MediaQuery.of(context).size.height,
            pageIndex: 0,
            itemCount: 4,
            scrollable: true,
            item: _infoShareCardListItem(0),
            itemPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          YrkListView(
            height: MediaQuery.of(context).size.height,
            pageIndex: 1,
            itemCount: 4,
            item: _infoShareCardListItem(1),
            scrollable: true,
            itemPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          YrkListView(
            height: MediaQuery.of(context).size.height,
            pageIndex: 2,
            itemCount: 4,
            item: _infoShareCardListItem(2),
            scrollable: true,
            itemPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
        ],
        following: Center(
          child: IconButton(
            splashColor: Colors.transparent,
            icon: widget.isGrid
                ? Image.asset("assets/icons/icon_widgets_24_px.png",
                    width: 19, height: 19, color: Color(0xff939597))
                : Image.asset("assets/icons/icon_view_agenda_24_px.png",
                    width: 19, height: 19, color: Color(0xff939597)),
            onPressed: () {
              setState(() {
                widget.isGrid = !widget.isGrid;
              });
            },
          ),
        ),
      ),
    );
  }
}
