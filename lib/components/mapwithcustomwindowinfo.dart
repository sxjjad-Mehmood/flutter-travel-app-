import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'customicon.dart';

class MapWithCustomInfoWindow extends StatefulWidget {
  const MapWithCustomInfoWindow({super.key});

  @override
  State<MapWithCustomInfoWindow> createState() =>
      _MapWithCustomInfoWindowState();
}

class _MapWithCustomInfoWindowState extends State<MapWithCustomInfoWindow> {
  final LatLng myCurrentLocation = LatLng(37.0902, -95.7129);
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  final CollectionReference placeReference =
      FirebaseFirestore.instance.collection("myappcollection");
  final CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadMarker();
    });
  }

  Future<void> loadMarker() async {
    final Size size = MediaQuery.of(context).size;

    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(30, 30)),
      "assets/images/mappin.png",
    );

    placeReference.snapshots().listen((QuerySnapshot snapshot) {
      if (snapshot.docs.isNotEmpty) {
        Set<Marker> newMarkers = {};

        for (var doc in snapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;

          final LatLng position = LatLng(data["latitude"], data["longitude"]);

          newMarkers.add(
            Marker(
              markerId: MarkerId(data["address"]),
              position: position,
              icon: customIcon,
              onTap: () {
                customInfoWindowController.addInfoWindow!(
                  Container(
                    height: size.height * 0.32,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: size.height * 0.203,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                                child: AnotherCarousel(
                                  images: data["imageUrls"]
                                      .map<NetworkImage>(
                                          (url) => NetworkImage(url))
                                      .toList(),
                                  dotSize: 5,
                                  indicatorBgPadding: 5,
                                  dotBgColor: Colors.transparent,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 25,
                              left: 20,
                              right: 10,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      "Guest Favourite",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  customicons(
                                    radius: 15,
                                    icon: Icons.favorite_border_outlined,
                                    color: Colors.white,
                                    iconcolor: Colors.black45,
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      customInfoWindowController
                                          .hideInfoWindow!();
                                    },
                                    child: customicons(
                                        radius: 15, icon: Icons.close),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    data["address"],
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Icon(Icons.star),
                                  SizedBox(width: 5),
                                  Text(data["rating"].toString()),
                                ],
                              ),
                              Text(
                                data["date"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black45),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "\$${data["price"]}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                          text: "night",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal))
                                    ]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  position,
                );
              },
            ),
          );
        }

        setState(() {
          markers = newMarkers;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return FloatingActionButton.extended(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Container(
              color: Colors.white,
              height: size.height * 0.77,
              width: size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.77,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: myCurrentLocation,
                        zoom: 14,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        googleMapController = controller;
                        customInfoWindowController.googleMapController =
                            controller;
                      },
                      onTap: (_) {
                        customInfoWindowController.hideInfoWindow!();
                      },
                      onCameraMove: (_) {
                        customInfoWindowController.onCameraMove!();
                      },
                      markers: markers,
                    ),
                  ),
                  CustomInfoWindow(
                    controller: customInfoWindowController,
                    height: size.height * 0.34,
                    width: size.width * 0.85,
                    offset: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 170, vertical: 10),
                      child: Container(
                        height: 5,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      label: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: const [
            SizedBox(width: 5),
            Text(
              "Map",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.map_outlined, color: Colors.white),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
