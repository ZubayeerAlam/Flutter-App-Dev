import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final LatLng _center= const LatLng(23.810331, 90.412521);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gas Station Finder"),
      ),
      body: GoogleMap(initialCameraPosition: CameraPosition(target: _center,zoom: 11.0)),
    );
  }
}
