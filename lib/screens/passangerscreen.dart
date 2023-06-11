import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:notify/custom_widgets/google_map_widget.dart';


bool? isWaiting;
var isWaitingText = 'I am Waiting';

class PassangerScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PassangerScreen();
  }
}
class _PassangerScreen extends State<PassangerScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Column(
        children: [
          //image or google map

          setWidget(),

          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.all(5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                textStyle: TextStyle(
                  fontSize: 24,
                ),
              ),
              onPressed: (){
                waitingPerson();
                setState(() {
                });

                const snackBar = SnackBar(
                  content: Text('We will inform You ! \nWhen bus be within 5 KM',style: TextStyle(fontSize: 18),),
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.orange,
                  duration: Duration(seconds: 1),

                );
                if(isWaiting??false){
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text(isWaitingText),
            ),
          ),

        ],
      ),
    );
  }
}

void waitingPerson(){
  if(isWaiting??false){
    isWaiting = false;
    isWaitingText = 'I am Waiting';
  }
  else{
    isWaiting = true;
    isWaitingText = 'Stop Waiting';

  }

}

Widget setWidget(){
  if(isWaiting??false){
   return GoogleMapWidget();
  }
  else{
   return Image(image: AssetImage('assets/images/waiting.jpg'),);
}
}