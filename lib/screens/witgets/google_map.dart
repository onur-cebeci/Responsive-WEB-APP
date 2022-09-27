import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(38.423733, 27.142826), zoom: 11.5);

  @override
  Widget build(BuildContext context) {
    late GoogleMapController googleMapController;
    return Container(
      height: 300,
      width: 1000,
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
    );
  }
}
