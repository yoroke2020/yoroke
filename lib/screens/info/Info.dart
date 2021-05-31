import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';

import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/info/InfoShareCardListItem.dart';

class Info extends StatefulWidget {
  Info({required this.onPushNavigator});

  final ValueChanged<YrkData>? onPushNavigator;

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> with TickerProviderStateMixin {
  static final int tabLength = 3;

  bool _isTwo = false;

  late TabController _tabController;
  late List<Tuple2<String, int>> _tabs = [
    Tuple2("의료시설", 0),
    Tuple2("복지시설", 1),
    Tuple2("돌봄서비스", 2)
  ];

  late List<Widget> _cardGrids;
  get _getCardGrids {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < _tabs.length; i++) {
      list.add(
        GridView.count(
            crossAxisCount: _isTwo ? 2 : 1,
            padding: EdgeInsets.all(16.0),
            crossAxisSpacing: _isTwo ? 12.0 : 16.0,
            mainAxisSpacing: _isTwo ? 12.0 : 16.0,
            childAspectRatio: _isTwo ? 158.0 / 172.0 : 328.0 / 104.0,
            children: _infoShareCards(i)),
      );
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: tabLength, vsync: this);
    _cardGrids = _getCardGrids;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> _infoShareCards(int tabIndex) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 8; i++) {
      list.add(AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: InfoShareCardListItem(
            width: _isTwo ? 158.0 : 328.0,
            height: _isTwo ? 172.0 : 104.0,
            index: i,
            tabIndex: tabIndex,
          )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(96.0),
          child: Column(children: <Widget>[
            YrkAppBar(
              type: YrkAppBarType.TextSearchNotification,
              label: "정보공유",
            ),
            Container(
                height: 48.0,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 8.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTapBar(tabs: _tabs, controller: _tabController),
                    Spacer(),
                    YrkIconButton(
                        icon: _isTwo
                            ? "icon_widgets.svg"
                            : "icon_view_agenda.svg",
                        iconSize: 19,
                        color: Color(0xff939597),
                        onTap: () {
                          setState(() {
                            _isTwo = !_isTwo;
                            _cardGrids = _getCardGrids;
                          });
                        }),
                  ],
                ))
          ])),
      body: TabBarView(controller: _tabController, children: _cardGrids),
      bottomNavigationBar: BottomBarNavigation.getInstance(RootPageItem.info),
    );
  }
}
