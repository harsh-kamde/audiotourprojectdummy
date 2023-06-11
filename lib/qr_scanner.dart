import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sightspeak/result_screen.dart';

//ashu and joshi work

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  var currentIndex = 0;
  bool isScanCompleted = false;
  MobileScannerController Controller = MobileScannerController();

  void closeScreen() {
    isScanCompleted = false;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              "Hi John,",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
                fontSize: 23.2837,
                height: 1.2188,
                color: Color(0xff39414B),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              "Explore around you!",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 41.3933,
                height: 1.3774,
                color: Color(0xff0A2753),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              "Scan Location QR",
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontWeight: FontWeight.w700,
                fontSize: 36,
                height: 1.3333,
                color: Color(0xff0079BD),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    width: 5,
                    color: Color(0xff0079BD),
                  ),
                ),
                child: MobileScanner(
                  allowDuplicates: true,
                  onDetect: (barcode, args) {
                    if (!isScanCompleted) {
                      String code = barcode.rawValue ?? '---';
                      isScanCompleted = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            closeScreen: closeScreen,
                            code: code,
                          ),
                        ),
                      );
                    }
                  },
                ),
                width: size.width * 0.75,
                height: size.width * 0.75,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Color(0xff0079BD),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Color(0xff0079BD),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == currentIndex ? size.width * .014 : 0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  listOfIcons[index],
                  size: size.width * .076,
                  color: index == currentIndex ? Colors.white : Colors.white,
                ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
}