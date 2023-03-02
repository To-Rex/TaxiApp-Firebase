import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  _SampesPageState createState() => _SampesPageState();
}

class _SampesPageState extends State<SamplePage> with SingleTickerProviderStateMixin {

  late GoogleMapController mapController;
  late LocationData _locationData;

  var lang = 0.0;
  var lat = 0.0;
  var Melang = 0.0;
  var Melat = 0.0;
  var zoom = 19.0;
  var distance = 0.0;


  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    debugPrint('Location: ${_locationData.latitude}, ${_locationData.longitude}');
    if (_locationData != null) {
      Melang = _locationData.longitude!;
      Melat = _locationData.latitude!;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(_locationData.latitude!, _locationData.longitude!),
            zoom: zoom,
          ),
        ),
      );
    }
    setState(() {
      lang = _locationData.longitude!;
      lat = _locationData.latitude!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              _getCurrentLocation();
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(41.3111, 69.2797), // Default location for the map
              zoom: 19,
            ),
            onTap: (LatLng location) {
              setState(() {
                lang = location.longitude;
                lat = location.latitude;
              });
              debugPrint('Location: $lat, $lang');
            },
            markers: {
              Marker(
                markerId: const MarkerId('1'),
                position: LatLng(lat, lang),
                infoWindow: const InfoWindow(
                  title: 'Qayerlardur',
                  snippet: 'Qayerlardurda aylanib yuribsiz',
                ),
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId('1'),
                visible: true,
                points: [
                  LatLng(37.78581538706099, -122.40640070289375),
                  LatLng(lat, lang),
                ],
                width: 5,
                color: Colors.red,
              ),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          //zoom buttons on the map
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      mapController.animateCamera(
                          CameraUpdate.zoomIn()
                      );
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.add, size: 36.0),
                  ),
                  const SizedBox(height: 16.0),
                  FloatingActionButton(
                    onPressed: () {
                      mapController.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.remove, size: 36.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}