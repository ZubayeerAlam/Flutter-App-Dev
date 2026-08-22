import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  LatLng _center = const LatLng(45.033333, 31.233334);

  Future<Position> _getCurrentLocation() async{
    return await Geolocator.getCurrentPosition();
  }

  Future<bool> _checkLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gas Station Finder"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        onMapCreated: (controller) {
          mapController = controller;
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        markers:{
          Marker(markerId: MarkerId("me"), position: _center)
        }

      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     bool permissionGranted = await _checkLocationPermission();
      //     if (permissionGranted) {
      //       Position position = await _getCurrentLocation();
      //       setState(() {
      //         _center = LatLng(position.latitude, position.longitude);
      //       });
      //
      //       mapController?.animateCamera(CameraUpdate.newLatLngZoom(_center, 11.0));
      //
      //     }
      //     else{
      //       print("Location permission denied");
      //     }
      //   },
      //   child: Icon(Icons.location_on),
      // ),
    );
  }
}
