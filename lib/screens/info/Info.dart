import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/CardModel.dart';
import 'package:yoroke/models/PostModel.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/common/YrkListItemV2.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTabBar.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/info/InfoShareCardListItem.dart';
import 'package:yoroke/temp/YrkTestModelData.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info>
    with TickerProviderStateMixin, ScreenState<YrkBlock2> {
  late int _tabLength = 3;

  bool _isTwo = false;

  @override
  YrkRequestContext get reqCtx => YrkRequestContext();

  @override
  void initBlock() {
    Map<String, dynamic> jsonResponse = TestInfoData().jsonResponse;
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    List<YrkBlock2> blocks = apiResponse.body!;

    this.block = YrkBlock2()..blocks = blocks;
    this.block.title = apiResponse.title!;
    this.block.blocks = apiResponse.body![0].blocks;
    _tabLength = this.block.blocks!.length;
  }

  @override
  void updateBlockOn(String action) {
    // TODO: implement updateBlockOn
  }

  late TabController _tabController;
  List<Tuple2<String, int>> _tabs = [];
  List<List<Widget>> _tabBlockItems = [];

  late List<Widget> _cardGrids;
  get _getCardGrids {
    List<Widget> list = <Widget>[];
    for (int tabIndex = 0; tabIndex < _tabLength; tabIndex++) {
      list.add(
        GridView.count(
          crossAxisCount: _isTwo ? 2 : 1,
          padding: EdgeInsets.all(16.0),
          crossAxisSpacing: _isTwo ? 12.0 : 16.0,
          mainAxisSpacing: _isTwo ? 12.0 : 16.0,
          childAspectRatio: _isTwo ? 158.0 / 172.0 : 328.0 / 104.0,
          children: _tabBlockItems[tabIndex],
        ),
      );
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    initBlock();

    for (int i = 0; i < _tabLength; i++) {
      YrkBlock2 tabBlock = this.block.blocks![i] as YrkBlock2;
      List<Widget> items = _buildPosts(tabBlock, i);
      _tabs.add(Tuple2(tabBlock.title!, i));
      _tabBlockItems.add(items);
    }

    _tabController = new TabController(length: _tabLength, vsync: this);
    _cardGrids = _getCardGrids;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(96.0),
          child: Column(children: <Widget>[
            YrkAppBar(
                type: YrkAppBarType.TextSearchNotification,
                label: this.block.title),
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

  List<Widget> _buildPosts(YrkBlock2 block, int tabIndex) {
    List items = block.items!.cast<CardModel>();
    print("-----------");
    print(items);
    print("-----------");

    return items.map((model) {
      return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: InfoShareCardListItem(
            width: _isTwo ? 158.0 : 328.0,
            height: _isTwo ? 172.0 : 104.0,
            index: tabIndex,
            model: model,
            // tabIndex: tabIndex,
          ));
    }).toList();
  }

  // bool _onScrollNotification(ScrollNotification notification, int index) {
  //   if (notification is! ScrollEndNotification) return false;

  //   if (notification.metrics.extentBefore ==
  //       notification.metrics.maxScrollExtent) {
  //     updateBlockOn("$index");
  //   }
  //   return true;
  // }
}
