import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

class PostCreateImageUpload extends StatefulWidget {
  @override
  _PostCreateImageUploadState createState() => _PostCreateImageUploadState();
}

class _PostCreateImageUploadState extends State<PostCreateImageUpload> {
  List<Widget> _assetWidgets = [];
  List<File> _assetFiles = [];
  List<bool> _assetSelects = [];
  List<File> _assetSelectedFiles = [];

  int currentPage = 0;
  late int lastPage;

  @override
  void initState() {
    super.initState();
    _loadNewAssets();
  }

  _onScroll(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33 &&
        currentPage != lastPage) {
      _loadNewAssets();
    }
  }

  _loadNewAssets() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      List<AssetPathEntity> assetPathEntities =
      await PhotoManager.getAssetPathList(
          onlyAll: true, type: RequestType.image);
      List<AssetEntity> assetEntities =
      await assetPathEntities[0].getAssetListPaged(currentPage, 60);
      List<Widget> assetWidgets = [];
      List<File> assetFiles = [];
      for (var asset in assetEntities) {
        assetFiles.add(await asset.loadFile() as File);
        assetWidgets.add(FutureBuilder(
            future: asset.thumbDataWithSize(200, 200),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.memory(snapshot.data as Uint8List,
                        fit: BoxFit.cover));
              return Center(
                  child: SizedBox.fromSize(
                      size: Size.square(30),
                      child: (Platform.isIOS || Platform.isMacOS)
                          ? CupertinoActivityIndicator()
                          : CircularProgressIndicator()));
            }));
      }
      setState(() {
        _assetWidgets.addAll(assetWidgets);
        _assetFiles.addAll(assetFiles);
        _assetSelects.addAll(List<bool>.filled(assetFiles.length, false));
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
            Size.fromHeight(48.0 + MediaQuery.of(context).padding.top),
            child: Container(
                height: 48.0,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 16.0,
                    right: 16.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      YrkIconButton(
                          icon: "assets/icons/icon_clear.svg",
                          padding: EdgeInsets.zero,
                          width: 24.0,
                          height: 24.0),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('${_assetSelectedFiles.length}',
                            style: const YrkTextStyle(
                                color: const Color(0xfff4d425),
                                fontWeight: FontWeight.w600,
                                fontFamily: "OpenSans",
                                fontSize: 16.0)),
                      ),
                      YrkButton(
                          onPressed: () => _onSelectedAssets(),
                          label: "첨부",
                          textStyle:
                          const YrkTextStyle(fontWeight: FontWeight.w500),
                          buttonType: ButtonType.text)
                    ]))),
        body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scroll) {
              _onScroll(scroll);
              return true;
            },
            child: GridView.builder(
                itemCount: _assetWidgets.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () => _onTap(index),
                      child: Stack(alignment: Alignment.topRight, children: [
                        _assetWidgets[index],
                        _getSelects(index)
                      ]));
                })));
  }

  void _onTap(int index) {
    setState(() {
      if (_assetSelects[index]) {
        _assetSelects[index] = !_assetSelects[index];
        _assetSelectedFiles.remove(_assetFiles[index]);
      } else {
        if (_assetSelectedFiles.length < 10) {
          _assetSelects[index] = !_assetSelects[index];
          _assetSelectedFiles.add(_assetFiles[index]);
        } else {
          Fluttertoast.showToast(
            msg: "더 이상 사진을 첨부할 수 없습니다.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xff616161),
            textColor: const Color(0xe6ffffff),
            fontSize: 14.0,
          );
        }
      }
    });
  }

  Widget _getSelects(int index) {
    print(_assetSelects[index]);
    if (_assetSelects[index]) {
      return Container(
        margin: EdgeInsets.all(8.0),
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
            color: const Color(0xfff4d425), shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Text('${_assetSelectedFiles.indexOf(_assetFiles[index]) + 1}'),
      );
    } else {
      return Container(
          margin: EdgeInsets.all(8.0),
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffffffff), width: 1),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x1f000000),
                    offset: Offset(0, 0),
                    blurRadius: 6,
                    spreadRadius: 0)
              ],
              shape: BoxShape.circle,
              color: Colors.transparent));
    }
  }

  void _onSelectedAssets() {
    Navigator.pop(context, _assetSelectedFiles[0]);
  }
}
