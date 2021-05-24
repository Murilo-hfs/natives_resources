import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recursos_nativos/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadyOnly;

  MapScreen({
    this.initialLocation = const PlaceLocation(
      latitude: 0.0,
      longitude: 0.0,
    ),
    this.isReadyOnly = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> markers = Set();
  LatLng _pickedPosition;

  void _selectedPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

    _newMarker() {
    Marker resultMarker = Marker(
  markerId: MarkerId('p1'),
  infoWindow: InfoWindow(
  snippet: "Position 1"),
  position: LatLng(widget.initialLocation.latitude,
  widget.initialLocation.longitude),
);
setState(() {
markers.add(resultMarker);
  
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        onTap: _newMarker(),
        markers: markers,
      ),
    );
  }
}
