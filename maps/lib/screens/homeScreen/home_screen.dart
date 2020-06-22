import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/screens/homeScreen/widgets/map_granted_screen.dart';
import 'package:maps/screens/homeScreen/widgets/open_settings_for_map_permission.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool locationGranted = false;
  Position _position;
  Completer<GoogleMapController> _controller = Completer();

  _getCurrentLocation() async {
    Geolocator geoLocator = Geolocator()..forceAndroidLocationManager = true;
    // final locationOptions =
    //     LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    //  geoLocator
    //     .getPositionStream(locationOptions)
    //     .listen((Position newPos) {
    //   if (newPos != null) {
    //     setState(() {
    //       _position = newPos;
    //     });
    //   }
    // });

    try {
      final Position position = await geoLocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        locationGranted = true;
        _position = position;
      });
    } catch (_) {
      setState(() {
        locationGranted = false;
        _position = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();

    if (locationGranted) {
      return MapGrantedScreen(
        mapController: _controller,
        position: LatLng(_position.latitude, _position.longitude),
      );
    } else {
      return OpenSettingsForMapPermission();
    }
  }
}
