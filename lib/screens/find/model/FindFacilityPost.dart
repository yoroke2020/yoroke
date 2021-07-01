import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/FacilityModel.dart';
import 'package:yoroke/temp/YrkData.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/find/FindFacility.dart';

class FindFacilityPost extends StatelessWidget {
  FindFacilityPost({
    required this.model
  });

  final FacilityModel model;

  void _onFindFacilityClicked(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FindFacility(
                    data: model,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _widthRatio =
        (MediaQuery.of(context).size.width - 32.0) / 328.0;
    final double _heightRatio = MediaQuery.of(context).size.width / 360.0;
    return InkWell(
      onTap: () => _onFindFacilityClicked(context),
      child: Container(
          width: double.maxFinite,
          height: 160.0 * _heightRatio + 104.0,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 160.0 * _heightRatio,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(model.imagePaths![0],
                        width: 244.0 * _widthRatio,
                        height: 160.0 * _heightRatio,
                        fit: BoxFit.fill),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0 * _widthRatio),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(model.imagePaths![1],
                              width: 80.0 * _widthRatio,
                              height: 78.0 * _heightRatio,
                              fit: BoxFit.fill),
                          Padding(
                            padding: EdgeInsets.only(top: 4.0 * _heightRatio),
                            child: Image.asset(model.imagePaths![2],
                                width: 80.0 * _widthRatio,
                                height: 78.0 * _heightRatio,
                                fit: BoxFit.fill),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 35.0,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    model.title ?? "",
                    style: const YrkTextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18.0),
                  )),
              Container(
                height: 24.0,
                alignment: Alignment.bottomLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        model.address ?? "",
                        style: const YrkTextStyle(
                          color: const Color(0x99000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                          width: 1,
                          height: 14,
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          decoration:
                              BoxDecoration(color: const Color(0x4d000000))),
                      Text("${model.distance ?? ""} km",
                          style: const YrkTextStyle(
                              color: const Color(0x4d000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                              fontSize: 16.0),
                          textAlign: TextAlign.left)
                    ]),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      YrkIconButton(
                        icon: "icon_review_star_on.svg",
                        width: 16.0,
                        height: 16.0,
                        padding: EdgeInsets.only(right: 2.0),
                        clickable: false,
                      ),
                      Text("${model.rating ?? ""} (${model.commentCount ?? ""})",
                          style: const YrkTextStyle(
                              color: const Color(0x99000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                              fontSize: 16.0)),
                      Container(
                          width: 1,
                          height: 14,
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          decoration:
                              BoxDecoration(color: const Color(0x4d000000))),
                      Text("시설등급",
                          style:
                              const TextStyle(color: const Color(0x4d000000))),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(model.grade ?? "",
                            style: const TextStyle(
                                color: const Color(0x4d000000),
                                fontWeight: FontWeight.w600,
                                fontFamily: "OpenSans",
                                fontSize: 16.0)),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
