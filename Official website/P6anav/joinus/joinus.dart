import 'package:flutter/material.dart';
import 'right.dart'; // Import the RightContainer widget
import 'nextcontainer.dart'; // Import the NextContainer widget

class JoinUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 1, 1), // Set the background color to grey
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 343; // Define small screen width

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity, // Ensure full width
                  padding: const EdgeInsets.all(16.0),
                  child: RightContainer(),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: NextContainer(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
