import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class BoardQnaCardListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 328.0,
        height: 192.0,
        margin: EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x99939597),
                  offset: Offset(0, 2),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
            color: const Color(0xffffffff)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 328.0,
                height: 66.0,
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: SvgPicture.asset("account_circle_default.svg",
                          width: 32.0, height: 32.0),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("정홍규",
                            style: const YrkTextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12.0)),
                        Row(
                          children: <Widget>[
                            Text("후기/리뷰",
                                style: const YrkTextStyle(
                                    color: const Color(0x99000000))),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Icon(
                                Icons.brightness_1,
                                size: 4.0,
                                color: const Color(0x4d000000),
                              ),
                            ),
                            Text("3일전",
                                style: const YrkTextStyle(
                                    color: const Color(0x99000000)))
                          ],
                        )
                      ],
                    )
                  ],
                )),
            Container(
                width: 328.0,
                height: 72.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                    "요양병원 후기 요양병원 후기 요양병원 후기"
                    " 요양병원 후기 요양병원 후기 요양병원 후기"
                    "요양후기 요양병원 후기 요양병원 후기 요양병원…",
                    style: const YrkTextStyle(fontSize: 16.0))),
            Container(
                width: 328.0,
                height: 54.0,
                padding: EdgeInsets.only(left: 21.0, right: 31.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SvgPicture.asset(
                        "icon_tumbs_up_60.svg",
                        width: 14.0,
                        height: 12.0,
                        color: const Color(0x4d000000),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 9.0),
                      child: Text(
                        "15k",
                        style: const YrkTextStyle(
                            color: const Color(0x4d000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "OpenSans",
                            fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SvgPicture.asset(
                        "icon_thumbs_down_60.svg",
                        width: 14.0,
                        height: 12.0,
                        color: const Color(0x4d000000),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 9.0),
                      child: Text(
                        "112",
                        style: const YrkTextStyle(
                            color: const Color(0x4d000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "OpenSans",
                            fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SvgPicture.asset(
                        "icon_mode_comment.svg",
                        width: 12.0,
                        height: 12.0,
                        color: const Color(0x4d000000),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 9.0),
                      child: Text(
                        "152",
                        style: const YrkTextStyle(
                            color: const Color(0x4d000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "OpenSans",
                            fontSize: 12.0),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () => {},
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                "icon_share.svg",
                                width: 24.0,
                                height: 24.0,
                                color: const Color(0x4d000000),
                              ),
                              Text("공유하기",
                                  style: const YrkTextStyle(
                                      color: const Color(0x4d000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0))
                            ]))
                  ],
                ))
          ],
        ));
  }
}
