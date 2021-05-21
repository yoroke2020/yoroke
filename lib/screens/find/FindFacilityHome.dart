import 'package:flutter/cupertino.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class FindFacilityHome extends StatelessWidget {
  FindFacilityHome({
    required this.name,
    required this.location,
    required this.rating,
    required this.distance,
    required this.hours,
    required this.introduction,
  });

  final String name;
  final String location;
  final String rating;
  final double distance;
  final String hours;
  final String introduction;

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
                              Text(name,
                                  style: const YrkTextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0)),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(location,
                                      style:
                                          const YrkTextStyle(fontSize: 16.0))),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Row(children: [
                                    YrkIconButton(
                                      icon:
                                          "assets/icons/icon_review_star_on_24_px.svg",
                                      width: 12.0,
                                      height: 12.0,
                                      padding: EdgeInsets.only(right: 2.0),
                                      clickable: false,
                                    ),
                                    Text(rating,
                                        style: const YrkTextStyle(
                                            color: const Color(0x99000000))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: // 2km
                                            Text("$distance km",
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
                                      Text(hours,
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
                                  child: Text(introduction,
                                      style: const YrkTextStyle(
                                          color: const Color(0x99000000),
                                          fontSize: 14.0)))
                            ])),
                    childCount: 1))
          ]);
        }));
  }
}
