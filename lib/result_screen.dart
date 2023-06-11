import"package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:sightspeak/qr_scanner.dart";
import "package:qr_flutter/qr_flutter.dart";
import "package:sightspeak/usermap.dart";

class ResultScreen extends StatelessWidget{
  final String code;
  final Function() closeScreen;


  const ResultScreen({super.key,required this.closeScreen,required this.code});
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: bgColor,
      appBar:AppBar(
        leading: IconButton(
          onPressed:()
          {
            closeScreen();
            Navigator.pop(context);
          },
          icon: Icon
            (Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
        ),
        centerTitle:true,
        title:const Text("QR Scanner",
          style:TextStyle(
            color:Colors.black87,
            fontSize:18,
            fontWeight:FontWeight.bold,
            letterSpacing: 1,

          ),
        ),

      ),
      body:Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserCurrentLocation(),
          ],
        ),
      ),
    );
  }
}
