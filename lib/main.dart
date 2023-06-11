import 'package:flutter/material.dart';
import 'package:sightspeak/musicplayer.dart';
import 'package:sightspeak/qr_scanner.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sightspeak/usermap.dart';

void main()
{

  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          )
      ),
      // home: QRScanner(),
      // home: UserCurrentLocation(),
      home: AudiomapWidget(),

      debugShowCheckedModeBanner: false,
      title: 'QR Scanner',
    );
  }

}





