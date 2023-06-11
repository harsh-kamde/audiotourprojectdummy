import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LiveLocation extends StatefulWidget {
  const LiveLocation({Key? key}) : super(key: key);

  @override
  State<LiveLocation> createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {

  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(77.2990704, 23.1814693));
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
          Position position = await _getCurrentPosition();
          googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(position.latitude,position.longitude),
                      zoom: 14
                  )
              )
          );//MapController

          markers.clear();
          markers.add(
              Marker(
                  markerId: MarkerId('Your Location'),
                  position: LatLng(position.latitude,position.longitude),
              )
          );

          setState(() {

          });


        },
        icon: Icon(Icons.location_history),
         label: Text('My Location'),
      ),

    );
  }
}

Future<Position> _getCurrentPosition() async{
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if(!serviceEnabled){
    return Future.error('Location service is disabled');
  }

  permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      return Future.error('Location permission denied');
    }
  }

  if(permission == LocationPermission.deniedForever){
    return Future.error('Location permission are permanetly denied');
  }

  Position position = await Geolocator.getCurrentPosition();
  return position;
}
