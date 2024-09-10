import 'package:flutter/material.dart';
import 'left.dart'; // Import the LeftContainer widget
import 'left2.dart'; // Import the LeftContainer2 widget
import 'right.dart'; // Import the RightContainer widget (Hello Right)

class JoinUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the Row/Column
          child: isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align the containers at the start
                  children: [
                    Container(
                      width: double.infinity, // Make the width full
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 87, 80, 80), // Adjust the color
                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                      ),
                      child: Column(
                        children: [
                          LeftContainer(), // First container
                          SizedBox(height: 20.0), // Space between the two containers
                          Flexible(
                            fit: FlexFit.loose,
                            child: SingleChildScrollView(
                              child: LeftContainer2(), // Second container positioned below the first
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0), // Space between the left and right containers
                    Container(
                      width: double.infinity, // Make the width full
                      padding: const EdgeInsets.all(16.0), // Padding inside the container
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0), // Background color
                        borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
                      ),
                      child: Align(
                        alignment: Alignment.topLeft, // Align the content to the top-left corner
                        child: RightContainer(), // Add the "Hello Right" widget here
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align the containers at the top
                  children: [
                    // Left Column with both containers
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2, // Adjust the width
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 87, 80, 80), // Adjust the color
                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                      ),
                      child: Column(
                        children: [
                          LeftContainer(), // First container
                          SizedBox(height: 20.0), // Space between the two containers
                          Flexible(
                            fit: FlexFit.loose,
                            child: SingleChildScrollView(
                              child: LeftContainer2(), // Second container positioned below the first
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0), // Space between the left and right containers
                    // Right Expanded Container
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16.0), // Padding inside the container
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0), // Background color
                          borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
                        ),
                        child: Align(
                          alignment: Alignment.topLeft, // Align the content to the top-left corner
                          child: RightContainer(), // Add the "Hello Right" widget here
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
