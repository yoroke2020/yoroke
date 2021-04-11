import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/TestPage.dart';
import 'LogIn.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text('info page'),

    // );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Trigger Login'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
            ),
            RaisedButton(
              child: Text('Trigger Signin'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
