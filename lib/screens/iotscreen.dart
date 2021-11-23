//import 'dart:js';

//import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IotScreen extends StatefulWidget {
  const IotScreen({Key? key}) : super(key: key);

  @override
  _IotScreenState createState() => _IotScreenState();
}

class _IotScreenState extends State<IotScreen> {
  @override
  bool value = false;
  final dbRef=FirebaseDatabase.instance.reference();

  onUpDate() {
    setState(() {
      value =! value;
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.clear_all,
                  color: Colors.white,
                ),
                Text(
                  "MY FIELD",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.settings)
              ],
            ),
          ),

          //data temperature
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: Text("Temperature",  //type of data
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: Text("20", //data
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),

          //data humidity
          SizedBox(height: 20),
          Column(
                children: [
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: Text("Hymidité", //type of data
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: Text("80%", //data
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80,),
              FloatingActionButton.extended(
                onPressed: () {
                  onUpDate();

                  writeData();
                }, 
                label:value? Text("OPEN") : Text("CLOSE"),
                elevation: 20,
                backgroundColor:value? Colors.yellow:Colors.blue,
                icon: value ? Icon(Icons.closed_caption) : Icon(Icons.closed_caption_off),
                )
        ],
      ),
    );
  }

   Future <void> writeData() async {
    dbRef.child("Data").set({"aHymidity:": 0, "aTemperature:": 0});
    dbRef.child("ValveState").set({"switch": !value});
  } 
}
