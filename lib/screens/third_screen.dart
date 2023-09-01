import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {


  var _scanBarcodeResult;
  List<String>? listOfNum = [];

  List<String> duplicate = [];

  //------------

  Future<void> scanBarcod() async{
    String barcodeScanRes;
    try{
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666',
          'Cancel',
          true,
          ScanMode.BARCODE);
      debugPrint(barcodeScanRes);

      showFlushbar(
          context: context,
          flushbar: Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            forwardAnimationCurve: Curves.decelerate,
            reverseAnimationCurve: Curves.easeInOut,
            // icon: Icon(Icons.error,color: Colors.white,),
            margin: EdgeInsets.all(30),
            message: "Scanned Successfully",
            messageColor: Colors.black,
            // textDirection: ,
            // title: 'Error',
            backgroundColor: Colors.white,
            positionOffset: 20,
            duration: Duration(seconds: 5),
            borderRadius: BorderRadius.circular(10),
          )..show(context),
      );
    }on PlatformException{
      barcodeScanRes = "Failed to get Platform version";
    }

    if(!mounted)
      return;
      setState(() {
        _scanBarcodeResult = barcodeScanRes;
      });
    listOfNum?.add(_scanBarcodeResult);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: (){
                  scanBarcod();
                },
                icon: Icon(Icons.qr_code_scanner,size: 36,)
            ),
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Selected Company:-",style: TextStyle(fontSize: 20),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Selected Company:-",style: TextStyle(fontSize: 20),)
              ],
            ),
            SizedBox(height: 20,),
            Text("Enroll Student List:"),
            SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
                itemCount: listOfNum?.length,
                itemBuilder: (BuildContext context,int index){
                  return Text(listOfNum![index]);
                }),
            Column()
          ],
        ),
      ),
    );
  }
}
