import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTest extends StatefulWidget {
  const MapTest({super.key});

  @override
  State<MapTest> createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  late GoogleMapController mapController;
  final LatLng mycurrentlocation = LatLng(33.7380, 73.0844);
  Set<Marker> markery = {};

  @override
  void initState() {
    super.initState();
    markery.add(
      Marker(
        markerId: MarkerId("test"),
        position: mycurrentlocation,
        infoWindow: InfoWindow(title: "Test Marker"),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: mycurrentlocation,
          zoom: 14,
        ),
        markers: markery,
        onMapCreated: (controller) {
          mapController = controller;
        },
      ),
    );
  }
}
