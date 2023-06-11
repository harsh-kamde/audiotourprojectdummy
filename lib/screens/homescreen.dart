import 'package:flutter/material.dart';
import 'package:notify/custom_widgets/live_location.dart';
import 'package:notify/screens/driverscreen.dart';
import 'package:notify/screens/passangerscreen.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'HomePage',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Notify"),
            leading: Icon(Icons.bus_alert_outlined),
          ),
          body: Column(
            children: [

              SizedBox(height: 15,),

              Image(
                  image: AssetImage('assets/images/bus2.jpg'),
              ),

              SizedBox(height: 55,),

              Text('My Role is: ',style: TextStyle(fontSize: 20),),

              SizedBox(height: 10,),

              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      textStyle: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveLocation(),)
                      );
                      },
                    child: Text('Passanger'),
                ),
              ),

              SizedBox(
                height: 12,
              ),

              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      textStyle: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DriverScreen(),
                          ),
                      );
                    },
                    child: Text('Driver'),

                ),
              ),



            ],
          ),
        ),
      );
  }
}