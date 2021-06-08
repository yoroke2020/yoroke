import 'package:flutter/material.dart';
import 'package:yoroke/temp/TestData.dart';
import 'package:yoroke/temp/YrkData.dart';
import 'package:yoroke/navigator/TabNavigator.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/post/PostCreate.dart';

class TempPostList extends StatefulWidget {
  @override
  _TempPostListState createState() => _TempPostListState();
}

class _TempPostListState extends State<TempPostList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YrkAppBar(
        type: YrkAppBarType.arrowBackMidTitle,
        label: "임시보관함",
      ),
      body: ListView.builder(
          itemCount: tempPostData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostCreate(
                          data: YrkData(prevPageItem: RootPageItem.home),
                          postData: tempPostData[index]))),
              child: Container(
                  height: 65.0,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: const Color(0xffe5e5e5))),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  tempPostData[index].title == ""
                                      ? "제목없음"
                                      : tempPostData[index].title,
                                  style: const TextStyle(
                                      color: const Color(0xe6000000),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKKR",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.left),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text("2020.10.21",
                                      style: const TextStyle(
                                          color: const Color(0x4d000000),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "OpenSans",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left))
                            ]),
                        Spacer(),
                        YrkIconButton(
                            icon: "icon_delete.svg",
                            color: const Color(0x4d000000),
                            width: 24.0,
                            height: 24.0,
                            onTap: () => _onTapDelete(index))
                      ])),
            );
          }),
    );
  }

  void _onTapDelete(int index) {
    setState(() {
      tempPostData.remove(tempPostData[index]);
    });
  }
}
