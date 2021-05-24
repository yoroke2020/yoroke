import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

class FindFacilityMap extends StatefulWidget {
  @override
  _FindFacilityMapState createState() => _FindFacilityMapState();
}

class _FindFacilityMapState extends State<FindFacilityMap> {
  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
      position: LatLng(37.55438, 126.90926),
      markerId: '',
      anchor: AnchorPoint(0.5, 1),
      width: 36,
      height: 48,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(height: MediaQuery.of(context).padding.top),
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Container(
              height: 510 / 640 * MediaQuery.of(context).size.height,
              width: double.maxFinite,
              child: NaverMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.55438, 126.90926),
                  zoom: 17,
                ),
                onMapCreated: _onMapCreated,
                initLocationTrackingMode: LocationTrackingMode.NoFollow,
                locationButtonEnable: true,
                indoorEnable: true,
                onCameraIdle: _onCameraIdle,
                markers: _markers,
              )),
          YrkAppBar(type: YrkAppBarType.arrowBackOnly),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.maxFinite,
                  height: 144 / 640 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 0),
                            blurRadius: 6,
                            spreadRadius: 0)
                      ],
                      color: const Color(0xffffffff)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: SvgPicture.asset(
                                  "assets/icons/icon_location.svg",
                                  width: 24.0,
                                  height: 24.0),
                            ),
                            Text("서울 마포구 동교동 159-5",
                                style: const YrkTextStyle())
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 32.0, top: 4.0),
                            child: Text("양화로 161 패스트파이브 ",
                                style: const YrkTextStyle(
                                    color: const Color(0x99000000),
                                    fontSize: 12.0)))
                      ])))
        ],
      ),
    );
  }

  void _onMapCreated(NaverMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraIdle() {
    print('카메라 움직임 멈춤');
  }
}
