import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  List<String> _pageHistory = new List<String>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _updatePageHistory(String title) {
    setState(() {
      _pageHistory.add(title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(bottom: 8),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: const Color(0xffffffff)
                ),
                child: new AspectRatio(
                  aspectRatio: 360 / 120,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 360,
                          height: 120,
                          child: Card(
                            child: Text("#FF0000"),
                            margin: EdgeInsets.all(10),
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          width: 360,
                          height: 120,
                          child: Card(
                            child: Text("#FF0000"),
                            margin: EdgeInsets.all(10),
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          width: 360,
                          height: 120,
                          child: Card(
                            child: Text("#FF0000"),
                            margin: EdgeInsets.all(10),
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          width: 360,
                          height: 120,
                          child: Card(
                            child: Text("#FF0000"),
                            margin: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                        ),
                      ]
                  ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 8),
                width: double.maxFinite,
                height: 48,
                decoration: BoxDecoration(
                    color: const Color(0xffffffff)
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child:
                          Container( // search icon
                            padding: const EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            width: 32,
                            height: 32,
                            child: Text("인기 게시글",
                                style: const TextStyle(
                                    color: const Color(0xe6000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                          ),
                        ),
                        Expanded(
                          child:
                          Container( // search icon
                            width: 32,
                            height: 32,
                            child: Image.asset("assets/icons/create_24_px.png"),
                          ),
                        ),
                        Expanded(
                          child: Text("글 작성",
                            style: const TextStyle(
                              color: const Color(0xe6000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                              textAlign: TextAlign.left),
                        ),
                      ],
                    )
                )
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: const Color(0xffffffff)
              ),
              child: new AspectRatio(
                aspectRatio: 360 / 56,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          width: 62,
                          height: 32,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(32)
                              ),
                              color: const Color(0xfff5df4d)
                          ),
                          child: Text('PICK',
                              style: const TextStyle(
                                  color: const Color(0xe6000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 93,
                          height: 32,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(32)
                              ),
                              color: const Color(0xfff5df4d)
                          ),
                          child: Text('고민/질문',
                              style: const TextStyle(
                                  color: const Color(0xe6000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 62,
                          height: 32,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(32)
                              ),
                              color: const Color(0xfff5df4d)
                          ),
                          child: Text('후기',
                              style: const TextStyle(
                                  color: const Color(0xe6000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 62,
                          height: 32,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(32)
                              ),
                              color: const Color(0xfff5df4d)
                          ),
                          child: Text('구인',
                              style: const TextStyle(
                                  color: const Color(0xe6000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 62,
                          height: 32,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(32)
                              ),
                              color: const Color(0xfff5df4d)
                          ),
                          child: Text('구직',
                              style: const TextStyle(
                                  color: const Color(0xe6000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 62,
                          height: 32,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(32)
                              ),
                              color: const Color(0xfff5df4d)
                          ),
                          child: Text('키워드',
                              style: const TextStyle(
                                  color: const Color(0xe6000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                      ),
                    ]
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: const Color(0xffffffff)
              ),
              child: new AspectRatio(
                aspectRatio: 360 / 256,
                child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        width: double.maxFinite,
                        height: 64,
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 0),
                          color: Colors.red,
                          child: Text("#FF0000"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        width: double.maxFinite,
                        height: 64,
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 0),
                          color: Colors.blue,
                          child: Text("#FF0000"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        width: double.maxFinite,
                        height: 64,
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 0),
                          color: Colors.black,
                          child: Text("#FF0000"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        width: double.maxFinite,
                        height: 64,
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 0),
                          color: Colors.green,
                          child: Text("#FF0000"),
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ],
        ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page A'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go Home'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page B'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go Home'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}