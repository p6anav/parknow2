import 'package:flutter/material.dart';
import 'parkingiv.dart'; // Import the ParkingInfoView screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParkingScreen(),
    );
  }
}

class ParkingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ParkingInfoView(
      isA1Occupied: true, // Replace with the desired status
      isB1Occupied: false,
      isC1Occupied: true,
      isD1Occupied: true,
    );
  }
}
