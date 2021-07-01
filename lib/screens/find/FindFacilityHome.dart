import 'package:flutter/cupertino.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/screen/Screen.dart';
import 'package:yoroke/models/FacilityModel.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class FindFacilityHome extends StatelessWidget with ScreenState<YrkBlock2> {
  FindFacilityHome({required this.model});

  final FacilityModel model;


  @override
  void initBlock() {
    // Map<String, dynamic> jsonResponse = TestFindData().jsonResponse;
    // YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    // String title = apiResponse.title ?? "";
    // List<YrkBlock2> blocks = apiResponse.body!;
    // this.block = YrkBlock2()..blocks = blocks;
    // this.block.title = title;
  }

  @override
  void updateBlockOn(String action) {
    // TODO: implement updateBlockOn
  }

  @override
  Widget build(BuildContext context) {
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
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(this.model.title ?? "",
                                  style: const YrkTextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0)),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(this.model.address ?? "",
                                      style:
                                          const YrkTextStyle(fontSize: 16.0))),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Row(children: [
                                    YrkIconButton(
                                      icon: "icon_star_on.svg",
                                      width: 12.0,
                                      height: 12.0,
                                      padding: EdgeInsets.only(right: 2.0),
                                      clickable: false,
                                    ),
                                    Text("${this.model.rating ?? -1}",
                                        style: const YrkTextStyle(
                                            color: const Color(0x99000000))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: // 2km
                                            Text("${this.model.distance ?? -1} km",
                                                style: const YrkTextStyle(
                                                    color: const Color(
                                                        0x99000000))))
                                  ])),
                              Padding(
                                padding: EdgeInsets.only(top: 14.0),
                                child: Text("영업시간",
                                    style: const YrkTextStyle(
                                        fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: // 08:00 ~ 22:00
                                      Text("hours",
                                          style: const YrkTextStyle(
                                            color: const Color(0x99000000),
                                          ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 16.0),
                                  child: Text("시설소개",
                                      style: const YrkTextStyle(
                                        fontWeight: FontWeight.w500,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text("introduction",
                                      style: const YrkTextStyle(
                                          color: const Color(0x99000000),
                                          fontSize: 14.0)))
                            ])),
                    childCount: 1))
          ]);
        }));
  }
}
