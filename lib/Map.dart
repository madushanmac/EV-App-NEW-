import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer();

  static const _initialPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 14.5,
  );

  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(37.773972, -122.431297),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charging Locations'),
        backgroundColor: Colors.grey[800],
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('To the Station'),
        icon: Icon(Icons.bookmark_outlined),
      ),
    );
  }
}
