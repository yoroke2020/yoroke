import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloflutter/screens/Home.dart';
import 'package:helloflutter/screens/Info.dart';
import 'package:helloflutter/screens/Board.dart';
import 'package:helloflutter/screens/Find.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Board(), Find(), Info()];
  Map _iconMap;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // 하단 네비게이션 아이콘 세팅
  // TODO svg image 사용 고려
  Image _getIcon(String tabName) {
    if (_iconMap == null) {
      loadAsset('assets/icons/icons.json').then((value) {
        _iconMap = json.decode(value);
      });
    }
    return _currentIndex == _iconMap[tabName]['currentIndex']
        ? Image.asset(_iconMap[tabName]['selectedImage'])
        : Image.asset(_iconMap[tabName]['image']);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
        _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: _getIcon('home'),
            label: '홈',
          ),
          new BottomNavigationBarItem(
            icon: _getIcon('board'),
            label: '자유게시판',
          ),
          new BottomNavigationBarItem(
            icon: _getIcon('find'),
            label: '시설찾기',
          ),
          new BottomNavigationBarItem(
            icon: _getIcon('info'),
            label: '정보공유',
          ),
        ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<String> loadAsset(String target) async {
    return await rootBundle.loadString(target);
  }
}
