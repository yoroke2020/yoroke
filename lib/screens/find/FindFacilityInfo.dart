import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class FindFacilityInfo extends StatelessWidget {
  FindFacilityInfo(
      {required this.grade,
      required this.medicalStaffNum,
      required this.nursingStaffNum,
      required this.cookNum,
      required this.userNum,
      required this.minMonthlyCost,
      required this.maxMonthlyCost});

  final String grade;
  final int medicalStaffNum;
  final int nursingStaffNum;
  final int cookNum;
  final int userNum;
  final int minMonthlyCost;
  final int maxMonthlyCost;

  static final List<String> titleList = [
    "의료진",
    "요양사",
    "조리사",
    "시설 이용자",
  ];

  static final List<String> imageList = [
    "icon_medical_services_16_px.svg",
    "icon_medical_services_16_px.svg",
    "icon_dining_16_px.svg",
    "icon_medical_services_16_px.svg",
  ];

  @override
  Widget build(BuildContext context) {
    List<String> countList = [
      "$medicalStaffNum",
      "$nursingStaffNum",
      "$cookNum",
      "$userNum"
    ];

    List<Widget> getWidgetList() {
      List<Widget> list = <Widget>[];
      list.add(
          Text("인력현황", style: const YrkTextStyle(fontWeight: FontWeight.w500)));
      list.add(Spacer());
      for (int i = 0; i < 4; i++) {
        list.add(Container(
            height: 32.0,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    imageList[i],
                    width: 16.0,
                    height: 16.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Text(titleList[i],
                          style: const YrkTextStyle(
                              color: const Color(0x99000000), fontSize: 12.0))),
                  Spacer(),
                  Text(countList[i],
                      style: const YrkTextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans",
                          fontSize: 12.0,
                          height: 1.5)),
                  Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: // 명
                          Text("명",
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
                                                  Text("시설등급",
                                                      style: const YrkTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 4.0),
                                                      child: Text("국가요양정보원 기준",
                                                          style: const YrkTextStyle(
                                                              color: const Color(
                                                                  0x99000000),
                                                              fontSize: 10.0)))
                                                ]),
                                            Spacer(),
                                            Text(grade,
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
                                        Text(
                                            "$minMonthlyCost ~ $maxMonthlyCost",
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
