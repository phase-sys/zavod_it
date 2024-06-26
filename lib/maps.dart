import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapsPage extends StatefulWidget {
  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-23.5557714, -46.6395571);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(-23.5557714, -46.6395571),
      infoWindow: InfoWindow(
        title: "Random Point 1",
        snippet: "Random Point in Sao Paulo",
      ),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(-23.5557714 + 0.05, -46.6395571 + 0.05),
      infoWindow: InfoWindow(
        title: "Random Point 2",
        snippet: "Random Point in Sao Paulo",
      ),
    ),
    Marker(
      markerId: MarkerId("3"),
      position: LatLng(-23.5557714 + 0.1, -46.6395571 + 0.1),
      infoWindow: InfoWindow(
        title: "Random Point 3",
        snippet: "Random Point in Sao Paulo",
      ),
    ),
    Marker(
      markerId: MarkerId("4"),
      position: LatLng(-23.5557714 + 0.15, -46.6395571 + 0.15),
      infoWindow: InfoWindow(
        title: "Random Point 4",
        snippet: "Random Point in Sao Paulo",
      ),
      ),
    Marker(
      markerId: MarkerId("5"),
      position: LatLng(-23.5557714 + 0.2, -46.6395571 + 0.2),
      infoWindow: InfoWindow(
        title: "Random Point 5",
        snippet: "Random Point in Sao Paulo",
      ),
    ),
    Marker(
      markerId: MarkerId("6"),
      position: LatLng(-23.5557714 - 0.05, -46.6395571 - 0.05),
      infoWindow: InfoWindow(
        title: "Random Point 6",
        snippet: "Random Point in Sao Paulo",
      ),
      ),
    Marker(
      markerId: MarkerId("7"),
      position: LatLng(-23.5557714 - 0.1, -46.6395571 - 0.1),
      infoWindow: InfoWindow(
        title: "Random Point 7",
        snippet: "Random Point in Sao Paulo",
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 10,
        ),
        markers: _markers,
      ),
    );
  }
}