import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

var tiles = [
  {"text": "프로필 편집", "icon": "assets/icons/icon_naver.png"},
  {"text": "북마크", "icon": "assets/icons/icon_kakao.png"},
  {"text": "히스토리", "icon": "assets/icons/icon_apple.png"},
  {"text": "임시보관함", "icon": "assets/icons/icon_apple.png"},
];

var textlist = [
  "프로필 편집",
  "북마크",
  "히스토리",
  "임시보관함",
];

var imagelist = [
  "assets/icons/icon_naver.png",
  "assets/icons/icon_kakao.png",
  "assets/icons/icon_apple.png",
  "assets/icons/icon_apple.png",
];

ListView getList() {
  return ListView.separated(
      itemCount: textlist.length + 1,
      separatorBuilder: (_, __) => const Divider(
            color: Color(0xffe5e5e5),
            thickness: 1,
            indent: 60,
            height: 1,
          ),
      itemBuilder: (context, index) {
        if (index == 0) {
          // return the header
          return DrawerHeader(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.zero,
                          width: 44,
                          height: 44,
                          child: Image.asset(
                              "assets/icons/account_circle_default_24_px.png"),
                        )),
                  ),
                  Text(
                    "비회원",
                    style: YrkTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.white)),
          );
        }
        index -= 1;
        // final data = groceryListNames[index];
        return ListTile(
          leading: Container(
            padding: EdgeInsets.zero,
            child: Image.asset(
              imagelist[index],
              width: 22,
              height: 22,
            ),
          ),
          title: Container(
            padding: EdgeInsets.zero,
            child: Text(
              // tiles[index]['text']!,
              textlist[index],
              style: YrkTextStyle(fontSize: 16, height: 1),
              textAlign: TextAlign.left,
            ),
          ),
        );
      });
}

class YrkDrawer extends Drawer {
  YrkDrawer({Key? key}) : super(key: key, child: getList());
}
