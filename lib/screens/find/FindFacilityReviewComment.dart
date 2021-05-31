import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class FindFacilityReviewComment extends StatelessWidget {
  FindFacilityReviewComment({required this.rating, required this.body});

  final double rating;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: const Color(0xffe5e5e5), width: 1))),
      padding: EdgeInsets.only(top: 14.0, bottom: 19.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 33.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "account_circle_default.svg",
                  width: 32.0,
                  height: 32.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 8.0),
                  child: Text("사용자ID",
                      style: const YrkTextStyle(
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Text("20.10.22 17:03",
                    style: const YrkTextStyle(
                        color: const Color(0x4d000000),
                        fontFamily: "OpenSans",
                        fontSize: 12.0))
              ],
            ),
          ),
          Container(
            height: 26.0,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 40.0),
            child: RatingBarIndicator(
              rating: rating,
              itemBuilder: (context, index) =>
                  SvgPicture.asset("icon_star_on.svg"),
              itemCount: 5,
              itemSize: 12.0,
              direction: Axis.horizontal,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 40.0, right: 47.0, top: 4.0),
              alignment: Alignment.topLeft,
              child: Text(
                body,
                style: const YrkTextStyle(),
                textAlign: TextAlign.left,
              )),
        ],
      ),
    );
  }
}
