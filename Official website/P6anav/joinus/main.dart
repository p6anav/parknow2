import 'package:flutter/material.dart';
import 'tomtom_map.dart';
import 'location_popup.dart'; // Import your map widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Map Example',
      home: TomTomMapWithRoute(), // Use your map widget here
    );
  }
}
