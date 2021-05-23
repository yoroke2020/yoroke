import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class FindFacilityNaverMap extends StatefulWidget {
  @override
  _FindFacilityNaverMap createState() => _FindFacilityNaverMap();
}

class _FindFacilityNaverMap extends State<FindFacilityNaverMap> {
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
    return NaverMap(
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
    );
  }

  void _onMapCreated(NaverMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraIdle() {
    print('카메라 움직임 멈춤');
  }
}
