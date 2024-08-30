import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SVG support

class LeftContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calculate font sizes relative to screen width
    final headingFontSize = screenWidth * 0.021; // 5% of screen width
    final textFontSize = screenWidth * 0.01; // 4% of screen width

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add space along the edges
      child: Column(
        children: [
          SizedBox(height: 20.0), // Space above the container
          Container(
            width: screenWidth * 0.5, // Container width with space on edges
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0), // Horizontal padding inside the container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Align content to the center
                children: [
                  Text(
                    'Central Office',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold, // Make heading bold
                    ),
                  ),
                  SizedBox(height: 18.0), // Space between heading and address
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0), // Add left padding to the icon
                        child: SvgPicture.asset(
                          'lib/assets/icons/location.svg',
                          color: Color.fromARGB(255, 235, 231, 11),// Path to your address icon
                          width: 18.0, // Adjusted icon width
                          height: 18.0, // Adjusted icon height
                        ),
                      ),
                      SizedBox(width: 10.0), // Space between icon and text
                      Expanded(
                        child: Text(
                          'G6F7+QRR, Swaraj Round N, Thekkinkadu Maidan, Thrissur, Kerala 680001',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: textFontSize,
                          ),
                          textAlign: TextAlign.left, // Align address text to the left
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0), // Space between address and phone number
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0), // Add left padding to the icon
                        child: SvgPicture.asset(
                          'lib/assets/icons/phone.svg', 
                           color: Color.fromARGB(255, 235, 231, 11),// Path to your phone icon
                          width: 18.0, // Adjusted icon width
                          height: 18.0, // Adjusted icon height
                        ),
                      ),
                      SizedBox(width: 10.0), // Space between icon and text
                      Expanded(
                        child: Text(
                          '+1 (555) 123-4567',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: textFontSize,
                          ),
                          textAlign: TextAlign.left, // Align phone number text to the left
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0), // Space between phone numbers
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0), // Add left padding to the icon
                        child: SvgPicture.asset(
                          'lib/assets/icons/phone.svg',
                           color: Color.fromARGB(255, 235, 231, 11), // Path to your phone icon
                          width: 18.0, // Adjusted icon width
                          height: 18.0, // Adjusted icon height
                        ),
                      ),
                      SizedBox(width: 10.0), // Space between icon and text
                      Expanded(
                        child: Text(
                          '+1 (555) 765-4321', // Different phone number
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: textFontSize,
                          ),
                          textAlign: TextAlign.left, // Align phone number text to the left
                        ),
                      ),
                    ],
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
