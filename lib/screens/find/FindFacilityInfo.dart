import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/ContentModel.dart';
import 'package:yoroke/models/CountModel.dart';
import 'package:yoroke/models/FacilityModel.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/core/model/YrkApiResponse2.dart';
import 'package:yoroke/temp/YrkTestModelData.dart';

class FindFacilityInfo extends StatelessWidget with ScreenState<YrkBlock2> {
  FindFacilityInfo({required this.model});

  final FacilityModel model;

  @override
  void initBlock() {
    Map<String, dynamic> jsonResponse = TestFindFacilityInfoData().jsonResponse;
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    List<YrkBlock2> blocks = apiResponse.body!;
    this.block = YrkBlock2()..blocks = blocks;
  }

  @override
  void updateBlockOn(String action) {}

  @override
  Widget build(BuildContext context) {
    initBlock();

    List<Widget> getWidgetList() {
      List<Widget> list = <Widget>[];
      YrkBlock2 hrBlock = this.block.blocks![1] as YrkBlock2;
      list.add(
          Text(hrBlock.title ?? "", style: const YrkTextStyle(fontWeight: FontWeight.w500)));
      list.add(Spacer());
      for (int i = 0; i < 4; i++) {
        list.add(Container(
            height: 32.0,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    (hrBlock.items![i] as CountModel).imagePath!,
                    width: 16.0,
                    height: 16.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Text((hrBlock.items![i] as CountModel).title!,
                          style: const YrkTextStyle(
                              color: const Color(0x99000000), fontSize: 12.0))),
                  Spacer(),
                  Text('${(hrBlock.items![i] as CountModel).count}',
                      style: const YrkTextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans",
                          fontSize: 12.0,
                          height: 1.5)),
                  Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: // 명
                          Text((hrBlock.items![i] as CountModel).unit!,
                              style: const YrkTextStyle(
                                  color: const Color(0x99000000),
                                  fontSize: 12.0)))
                ])));
      }

      return list;
    }

    return SafeArea(
        top: false,
        bottom: false,
        child: Builder(builder: (BuildContext context) {
          return CustomScrollView(slivers: <Widget>[
            SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverFixedExtentList(
                itemExtent: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom -
                    164.0,
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: double.maxFinite,
                                  height: 68.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: const Color(0xffe5e5e5),
                                              width: 1)),
                                      color: const Color(0xffffffff)),
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                      (this.block.blocks![0]
                                                                  as YrkBlock2)
                                                              .title ??
                                                          "",
                                                      style: const YrkTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 4.0),
                                                      child: Text(
                                                          ((this.block.blocks![0]
                                                                              as YrkBlock2)
                                                                          .items![0]
                                                                      as ContentModel)
                                                                  .title ??
                                                              "",
                                                          style: const YrkTextStyle(
                                                              color: const Color(
                                                                  0x99000000),
                                                              fontSize: 10.0)))
                                                ]),
                                            Spacer(),
                                            Text(this.model.grade ?? "",
                                                style: const YrkTextStyle(
                                                    color:
                                                        const Color(0xfff5df4d),
                                                    fontSize: 40.0,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.5))
                                          ]))),
                              Container(
                                  width: double.maxFinite,
                                  height: 177.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: const Color(0xffe5e5e5),
                                              width: 1)),
                                      color: const Color(0xffffffff)),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: getWidgetList(),
                                      ))),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 8.0),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text("월 평균 금액",
                                            style: const YrkTextStyle(
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Spacer(),
                                        Text("0.0 ~ 1.0",
                                            style: const YrkTextStyle(
                                                color: const Color(0xfff5df4d),
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "OpenSans",
                                                fontSize: 20.0)),
                                        Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text("만원",
                                                style: const YrkTextStyle(
                                                    color:
                                                        const Color(0x99000000),
                                                    fontSize: 12.0)))
                                      ]))
                            ])),
                    childCount: 1))
          ]);
        }));
  }
}
