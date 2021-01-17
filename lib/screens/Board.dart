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
                          child: Image.asset("assets/icons/navigate_next_24_px.png")
                        ),
                      ),
                    ]))),
            Container(
                decoration: BoxDecoration(color: const Color(0xffffffff)),
                child: new AspectRatio(
                  aspectRatio: 360 / 120,
                )),
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
                          child: Image.asset("assets/icons/navigate_next_24_px.png")
                        ),
                      ),
                    ]))),
            Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
                child: new AspectRatio(
                    aspectRatio: 360 / 296,
                    child: Column(children: <Widget>[
                    ]
                    )
                )
            ),
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
                            child: Image.asset("assets/icons/navigate_next_24_px.png")
                        ),
                      ),
                    ]))),
            Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
                child: new AspectRatio(
                    aspectRatio: 360 / 296,
                    child: Column(children: <Widget>[
                    ]
                    )
                )
            ),
                      ],
        ));
  }
}
