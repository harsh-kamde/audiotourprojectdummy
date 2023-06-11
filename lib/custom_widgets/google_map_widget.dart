import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _GoogleMapWidgetState();
  }
}
class _GoogleMapWidgetState extends State<GoogleMapWidget>{
  
  final Completer<GoogleMapController> _controller = Completer();
  
  static const CameraPosition initialPosition = CameraPosition(target: LatLng(23.1814693,77.2990704),zoom: 14);
  static const CameraPosition targetPosition = CameraPosition(target: LatLng(23.1814693, 77.2990704),);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 450,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
        },
        zoomControlsEnabled: false,
      ),
    );
  }
}