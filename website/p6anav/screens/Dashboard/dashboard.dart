import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cards.dart'; // Import the custom card widget
import 'table.dart'; // Import the table container widget

class DashboardScreen extends StatelessWidget {
  // Mock data for the demonstration with colors
  final List<Map<String, dynamic>> cardData = [
    {
      'number': '12',
      'title': 'Available Parking Spaces',
      'date': '06/10/2024',
      'percentageChange': '+18%',
      'color': Color.fromARGB(237, 24, 0, 181), // Card color
      'numberColor': Colors.green,
      'titleColor': Colors.white,
      'dateColor': Colors.white,
      'percentageColor': Colors.green,
    },
    {
      'number': '34',
      'title': 'Occupied Space',
      'date': '07/10/2024',
      'percentageChange': '-5%',
      'color': Color.fromARGB(237, 24, 0, 181), // Different card color
      'numberColor': Colors.red,
      'titleColor': Colors.white,
      'dateColor': Colors.white,
      'percentageColor': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Grid
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Display three cards per row
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.5,
              ),
              itemCount: cardData.length,
              shrinkWrap: true, // Ensure GridView only takes the necessary space
              physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
              itemBuilder: (context, index) {
                var data = cardData[index];
                return DashboardCard(
                  number: data['number'],
                  title: data['title'],
                  date: data['date'],
                  percentageChange: data['percentageChange'],
                  color: data['color'],
                  numberColor: data['numberColor'],
                  titleColor: data['titleColor'],
                  dateColor: data['dateColor'],
                  percentageColor: data['percentageColor'],
                );
              },
            ),

            SizedBox(height: 70), // Add some space between the grid and table

            // Header with SVG icon and "BOOKING" text
            Row(
              children: [
                SvgPicture.asset(
                  'lib/assets/icons/alarm.svg', // Path to your local SVG asset
                  width: 24, // Set the size of the icon
                  height: 30,
                ),
                SizedBox(width: 8), // Space between the icon and the text
                Text(
                  'Latest Booking',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 31, 204), // Text color
                  ),
                ),
              ],
            ),
            SizedBox(height: 40), // Add space between the header and the table

            // Table Container
            TableContainer(
              width: double.infinity, // Full width for the container
              height: 500, // Set specific height
              backgroundColor: Color.fromARGB(255, 115, 104, 189).withOpacity(0.2), // Set background color with opacity
            ),

            // Add more content here if needed
          ],
        ),
      ),
    );
  }
}
