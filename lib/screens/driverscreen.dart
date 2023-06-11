import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

bool isSharing = false;
var isSharingText = 'Share Location';
var realtimeValue = 'no data';


class DriverScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DriverScreen();
  }
}
class _DriverScreen extends State<DriverScreen>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.all(8),
          //     height: 500,
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          // ),

          Image(
            image: AssetImage('assets/images/location.jpg'),
          ),

          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  textStyle: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () async{
                  waitingPerson();
                  Position position = await _getCurrentPosition();
                  const snackBar = SnackBar(
                    content: Text('Location Shared with others ! ',style: TextStyle(fontSize: 18),),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.orange,
                    duration: Duration(seconds: 1),

                  );
                  if(position!=null){
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  setState(() {});
                },
                child: Text(isSharingText),
            ),
          ),

          Text(realtimeValue),

        ],
      ),
    );
  }
}

void waitingPerson(){
  if(isSharing){
    isSharing = false;
    isSharingText = 'Stop Sharing';
  }
  else{
    isSharing = true;
    isSharingText = 'Share Location';
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
  if(isSharing){

    DatabaseReference ref = FirebaseDatabase.instance.ref().child('users');

    Map<String,dynamic> currentLocationData = {
      "Bus Number": "04",
      "currentLocation": {
        "latitude": position.latitude,
        "longitude": position.longitude
      }
    };

    // ref.push().set(currentLocationData);
    // ref = FirebaseDatabase.instance.ref().child('users');
    // ref.onValue.listen((event) {
    //   setState(){
    //       realtimeValue = event.snapshot.value.toString();
    //   }
    // });



    var valueFromDb;
    ref.onValue.listen((event) {
          var snapshot = event.snapshot;
          valueFromDb = snapshot.value;
    });
    print(valueFromDb);
    print(position);
  }
  return position;
}
