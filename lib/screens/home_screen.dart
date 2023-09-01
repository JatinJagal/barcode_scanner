import 'package:barcode_scanner/screens/second_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
                    },
                    icon: Icon(Icons.calendar_today,size: 36,)
                )
            )
          ],
        ),
        body: Container(
          child: Center(
            child: Text("Body"),
          ),
        ),
      ),
    );
  }
}
