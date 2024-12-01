import 'dart:io';

void main() {
  print("Enter the status for A1 (1 for occupied, 0 for available): ");
  String? a1Input = stdin.readLineSync();

  print("Enter the status for B1 (1 for occupied, 0 for available): ");
  String? b1Input = stdin.readLineSync();

  print("Enter the status for C1 (1 for occupied, 0 for available): ");
  String? c1Input = stdin.readLineSync();

  print("Enter the status for D1 (1 for occupied, 0 for available): ");
  String? d1Input = stdin.readLineSync();

  // Start the Flutter app and pass the values
  runParkingApp(
    a1: a1Input == '1',
    b1: b1Input == '1',
    c1: c1Input == '1',
    d1: d1Input == '1',
  );
}

// Function to run the Flutter app with the captured input
void runParkingApp({
  required bool a1,
  required bool b1,
  required bool c1,
  required bool d1,
}) {
  // You can call the Flutter app from here
(
    isA1Occupied: a1,
    isB1Occupied: b1,
    isC1Occupied: c1,
    isD1Occupied: d1,
  );
}
