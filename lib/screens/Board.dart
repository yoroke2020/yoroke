import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: new AspectRatio(
                aspectRatio: 360 / 40,
                child: Stack(children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 16,
                    child: Text("후기",
                        style: const TextStyle(
                            color: const Color(0xe6000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                  Positioned(
                    top: 8,
                    right: 16,
                    child: Container(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                            "assets/icons/navigate_next_24_px.png")),
                  ),
                ]))),
        Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: new AspectRatio(
                aspectRatio: 360 / 120,
                child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal, 
                    children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: new AspectRatio(
                          aspectRatio: 136 / 120,
                          child: Opacity(
                              opacity: 0.15000000596046448,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      color: const Color(0xe6000000)),
                                  child: Image.asset(
                                      "assets/icons/navigate_next_24_px.png"))))),
                  Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: new AspectRatio(
                          aspectRatio: 136 / 120,
                          child: Opacity(
                              opacity: 0.15000000596046448,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      color: const Color(0xe6000000)),
                                  child: Image.asset(
                                      "assets/icons/navigate_next_24_px.png"))))),
                  Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: new AspectRatio(
                          aspectRatio: 136 / 120,
                          child: Opacity(
                              opacity: 0.15000000596046448,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      color: const Color(0xe6000000)),
                                  child: Image.asset(
                                      "assets/icons/navigate_next_24_px.png"))))),
                  Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: new AspectRatio(
                          aspectRatio: 136 / 120,
                          child: Opacity(
                              opacity: 0.15000000596046448,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      color: const Color(0xe6000000)),
                                  child: Image.asset(
                                      "assets/icons/navigate_next_24_px.png"))))),
                ]))),
        Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: new AspectRatio(
                aspectRatio: 360 / 40,
                child: Stack(children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 16,
                    child: Text("고민/질문",
                        style: const TextStyle(
                            color: const Color(0xe6000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                  Positioned(
                    top: 8,
                    right: 16,
                    child: Container(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                            "assets/icons/navigate_next_24_px.png")),
                  ),
                ]))),
        Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
            child: new AspectRatio(
              aspectRatio: 360 / 296,
              child: PageView(
                children: [
                  Column(
                    children: <Widget> [
                   AspectRatio(
                       aspectRatio: 360/65,
                     child: Container(
                       decoration: BoxDecoration(
                         color: const Color(0xfff5df4d),
                         border: Border(top: BorderSide(width: 1, color: const Color(0x14000000)))
                       ),
                     )
                   ),
                  AspectRatio(
                      aspectRatio: 360/66,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0x14000000),
                            border: Border(top: BorderSide(width: 1, color: const Color(0x14000000)))
                        ),
                      )
                  ),
                  ])
                ]
              )
            )),
        Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: new AspectRatio(
                aspectRatio: 360 / 40,
                child: Stack(children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 16,
                    child: Text("구인구직",
                        style: const TextStyle(
                            color: const Color(0xe6000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                  Positioned(
                    top: 8,
                    right: 16,
                    child: Container(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                            "assets/icons/navigate_next_24_px.png")),
                  ),
                ]))),
        Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
            child: new AspectRatio(
                aspectRatio: 360 / 296, child: Column(children: <Widget>[]))),
      ],
    ));
  }
}
