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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
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
                          child: Image.asset(
                              "assets/icons/account_circle_default_24_px.png"),
                        ),
                      ),
                      Expanded(
                        child:
                        Container( // search icon
                          width: 32,
                          height: 32,
                          child: Image.asset("assets/icons/search_24_px.png"),
                        ),
                      ),
                      Expanded(
                        child:
                        Container( // search icon
                          padding: const EdgeInsets.only(right: 20),
                          width: 32,
                          height: 32,
                          child: Image.asset("assets/icons/notifications_none_24_px.png"),
                        ),
                      ),
                    ],
                  )
                )
            ),
            RaisedButton(
              child: Text('Go Page A'),
              onPressed: () {
                _updatePageHistory('Page A');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageA()));
              },
            ),
            SizedBox(height: 50), // padding
            RaisedButton(
              child: Text('Go Page B'),
              onPressed: () {
                _updatePageHistory('Page B');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageB()));
              },
            ),
            SizedBox(height: 50), // padding
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 150), // padding
            Text(
              'Page access history:' + '$_pageHistory',
            ),
          ],
        ),
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