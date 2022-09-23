import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:app/Recipt.dart';
import './QRScan.dart';

class Charging extends StatefulWidget {
  @override
  State<Charging> createState() => _ChargingState();
}

class _ChargingState extends State<Charging> {
  int Number1 = 60;
  int ChargingPrecentageEstimated = 1;
  int Price = 800;
  int Kwh = 11;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Charging',
            style: TextStyle(fontSize: 20),
          ),
          elevation: 40.0,
          foregroundColor: Color.fromARGB(255, 239, 233, 232),
          shadowColor: Colors.red,
          backgroundColor: Colors.grey[600]),
      body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.electric_car,
                    color: Color.fromARGB(255, 255, 241, 241),
                    size: 60.0,
                  ),
                  radius: 50.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 350.00,
                height: 200.00,
                color: Color.fromARGB(255, 100, 102, 108),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'CHARGING',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.battery_charging_full_outlined,
                          color: Color.fromARGB(255, 233, 41, 16),
                          size: 150,
                        ),
                        Text(
                          '$ChargingPrecentageEstimated %',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Estimated Time to Full Charge : ',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$Number1 min',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                        backgroundColor: Colors.grey[900],
                        letterSpacing: 2,
                        decorationColor: Colors.red),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              //Estimeted Kwh for Charging
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Estimated Kwh Usage : ',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    '$Kwh KWH',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                        backgroundColor: Colors.grey[900],
                        letterSpacing: 2,
                        decorationColor: Colors.red),
                  ),
                ],
              ),

              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Currently Charging Cost  : ',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$Price LKR',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                        backgroundColor: Colors.grey[900],
                        letterSpacing: 2,
                        decorationColor: Colors.red),
                  ),
                ],
              ),
              //QR code showing
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Scanned Charge point : ',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '8',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                        backgroundColor: Colors.grey[900],
                        letterSpacing: 2,
                        decorationColor: Colors.red),
                  ),
                ],
              ),
              Divider(
                height: 30.0,
                color: Colors.black,
              ),
              SizedBox(height: 30.0),
              Center(
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Recipt(
                                ChargingPrecentageEstimated:
                                ChargingPrecentageEstimated.toInt(),
                                Price: Price.toInt(),
                                Kwh: Kwh.toInt(),
                              )));
                      print('Stop Button Clicked');
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Charging()));
                    },
                    label: Text(
                      'STOP',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    icon: Icon(
                      Icons.stop_circle_sharp,
                      size: 50.0,
                    ),
                    color: Colors.red,
                  )),
            ]),
          )),

      //Floating Action button addded for a testing purpose
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          setState(() {
            ChargingPrecentageEstimated = ChargingPrecentageEstimated + 1;
          });
          setState(() {
            Number1 = Number1 - 1;
          });
          setState(() {
            Price = Price + 2;
          });
          setState(() {
            Kwh = Kwh + 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        foregroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey[600],
    );
  }
}
