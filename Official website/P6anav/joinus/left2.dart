import 'package:flutter/material.dart';

class LeftContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate font sizes and field heights based on screen width
    final labelFontSize = screenWidth * 0.01; // 1% of screen width
    final textFontSize = screenWidth * 0.012; // 1.2% of screen width
    final textFieldHeight = screenHeight * 0.05; // Height for text fields
    final buttonHeight = screenHeight * 0.06; // Adjust button height as needed

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          SizedBox(height: 10.0), // Space above the container
          Container(
            width: screenWidth * 0.5, // Container width
            height: screenHeight * 0.48, // Container height
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    'First Name',
                    style: TextStyle(color: Colors.white, fontSize: labelFontSize),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    height: textFieldHeight,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your first name',
                        hintStyle: TextStyle(
                          fontSize: textFontSize,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      style: TextStyle(fontSize: textFontSize, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Email',
                    style: TextStyle(color: Colors.white, fontSize: labelFontSize),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    height: textFieldHeight,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          fontSize: textFontSize,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      style: TextStyle(fontSize: textFontSize, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'What can I help you with?',
                    style: TextStyle(color: Colors.white, fontSize: labelFontSize),
                  ),
                  SizedBox(height: 2.0),
                  Container(
                    height: textFieldHeight * 2.3, // Multi-line text area
                    child: TextField(
                      maxLines: null, // Allow multi-line input
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Describe your issue or request...',
                        hintStyle: TextStyle(
                          fontSize: textFontSize,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      style: TextStyle(fontSize: textFontSize, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit action here
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: textFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary:  Color.fromARGB(255, 235, 231, 11), // Background color
                        onPrimary: const Color.fromARGB(255, 0, 0, 0), // Text color
                        minimumSize: Size(double.infinity, buttonHeight), // Set button height
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Corner radius
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
