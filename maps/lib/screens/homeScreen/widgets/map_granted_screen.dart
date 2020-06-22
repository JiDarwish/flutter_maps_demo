import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGrantedScreen extends StatelessWidget {
  final Completer<GoogleMapController> mapController;
  final LatLng position;

  const MapGrantedScreen({Key key, @required this.mapController, this.position})
      : super(key: key);

  void _onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

  GoogleMap _getGoogleMapWidget() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      mapType: MapType.normal,
      mapToolbarEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
        target: position,
        zoom: 11.0,
      ),
    );
  }

  Widget _getSearchBars() {
    // TODO this is only a ui mock and should become a showSearch with searchDelegate and link to the map
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'Destination',
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'What are you looking for',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _getGoogleMapWidget(),
          _getSearchBars(),
        ],
      ),
    );
  }
}
