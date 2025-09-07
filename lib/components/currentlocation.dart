import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class currentlocation extends StatefulWidget {
  final DocumentSnapshot<Object?> place;
  const currentlocation({super.key, required this.place});

  @override
  State<currentlocation> createState() => _currentlocationState();
}

class _currentlocationState extends State<currentlocation> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.satellite,
        myLocationButtonEnabled: false,
        markers: {
          Marker(
              markerId: MarkerId(widget.place["address"]),
              position: LatLng(
                  double.parse(widget.place["latitude"].toString()),
                  double.parse(widget.place["longitude"].toString()))),
        },
        initialCameraPosition: CameraPosition(
            target: LatLng(double.parse(widget.place["latitude"].toString()),
                double.parse(widget.place["longitude"].toString())),
            zoom: 14));
  }
}
