import 'package:flutter/material.dart';
import 'TomTomGeocodingService.dart';
import 'tomtom_map.dart';
import 'tomtom_routing_service.dart';

// Class to manage the location popup with the map
class LocationPopup {
  // Function to show the location popup with the map
  static void show(BuildContext context, {String title = 'Location', double height = 400}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title), // Set the title of the popup
          content: Container(
            width: double.maxFinite, // Make the content take up the available width
            height: height, // Set the height of the map container
            child: TomTomMapWithRoute(), // Display your map widget
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: Text('Close'), // Close button
            ),
          ],
        );
      },
    );
  }
}
