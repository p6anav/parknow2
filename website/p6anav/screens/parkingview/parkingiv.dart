import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  // Simulating terminal input
  print('Enter parking spot statuses (1 for occupied, 0 for available).');
  print('Example: 1 0 0 1 (A1 occupied, B1 available, C1 available, D1 occupied):');

  String? input = stdin.readLineSync();
  List<String> statuses = input?.split(' ') ?? [];

  // Ensure there are exactly 4 inputs (A1, B1, C1, D1)
  if (statuses.length != 4) {
    print('Invalid input. Expected 4 values.');
    return;
  }

  // Parse input to boolean values
  bool isA1Occupied = statuses[0] == '1';
  bool isB1Occupied = statuses[1] == '1';
  bool isC1Occupied = statuses[2] == '1';
  bool isD1Occupied = statuses[3] == '1';

  runApp(MyApp(
    isA1Occupied: isA1Occupied,
    isB1Occupied: isB1Occupied,
    isC1Occupied: isC1Occupied,
    isD1Occupied: isD1Occupied,
  ));
}

class MyApp extends StatelessWidget {
  final bool isA1Occupied;
  final bool isB1Occupied;
  final bool isC1Occupied;
  final bool isD1Occupied;

  MyApp({
    required this.isA1Occupied,
    required this.isB1Occupied,
    required this.isC1Occupied,
    required this.isD1Occupied,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParkingInfoView(
        isA1Occupied: isA1Occupied,
        isB1Occupied: isB1Occupied,
        isC1Occupied: isC1Occupied,
        isD1Occupied: isD1Occupied,
      ),
    );
  }
}

class ParkingInfoView extends StatelessWidget {
  final bool isA1Occupied;
  final bool isB1Occupied;
  final bool isC1Occupied;
  final bool isD1Occupied;

  ParkingInfoView({
    required this.isA1Occupied,
    required this.isB1Occupied,
    required this.isC1Occupied,
    required this.isD1Occupied,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 141, 68, 68), // Set the background color
      child: Center(
        child: SizedBox(
         // Set the height you want
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/icons/ext1.svg',
                    width: 50,
                    height: 50,
                    color: isA1Occupied ? Colors.blue : null,
                  ),
                  SizedBox(width: 8),
                  Text('A1', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/icons/ext1.svg',
                    width: 50,
                    height: 50,
                    color: isB1Occupied ?const Color.fromARGB(255, 0, 30, 54) : null,
                  ),
                  SizedBox(width: 8),
                  Text('B1', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/icons/ext1.svg',
                    width: 50,
                    height: 50,
                    color: isC1Occupied ?Colors.blue  : null,
                  ),
                  SizedBox(width: 8),
                  Text('C1', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/icons/ext1.svg',
                    width: 50,
                    height: 50,
                    color: isD1Occupied ? Colors.blue : null,
                  ),
                  SizedBox(width: 8),
                  Text('D1', style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
