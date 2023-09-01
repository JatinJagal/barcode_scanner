import 'package:barcode_scanner/screens/third_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List companyName = ["companyOne","companySecond","companyThird"];
  List rounds = ["FirstRound","SecondRound","ThirdRound"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Center(
                    child: DropdownButtonFormField(
                      // elevation: 0,
                      decoration: InputDecoration(
                        hintText: "Select the Items",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 4,color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Colors.black),
                        ),
                      ),
                      items: companyName.map((name){
                        return DropdownMenuItem(
                          child: Text(name),
                          value: name,
                        );
                      }).toList(), onChanged: (Object? value) { print(value); },
                    ),
                  ),
                  SizedBox(height: 20,),
              //------------
                  Center(
                    child: DropdownButtonFormField(
                      // elevation: 0,
                      decoration: InputDecoration(
                        hintText: "Select the Items",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 4,color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Colors.black),
                        ),
                      ),
                      items: rounds.map((name){
                        return DropdownMenuItem(
                          child: Text(name),
                          value: name,
                        );
                      }).toList(), onChanged: (Object? value) { print(value); },
                    ),
                  ),
              //----------------
                ],
              ),
              SizedBox(height: 60,),
              SizedBox(
                width: 540,
                height: 60,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdScreen()));
                    },
                    child: Text("Next"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
