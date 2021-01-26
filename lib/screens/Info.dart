import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

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
              // Login page
              child: Text('Trigger Login'),
              onPressed: () {
                // _updatePageHistory('Trigger Login');
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
