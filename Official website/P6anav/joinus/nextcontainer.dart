// lib/next_container.dart
import 'package:flutter/material.dart';
import 'footer.dart'; // Import the footer.dart file
import 'backend.dart'; // Import the backend file

class NextContainer extends StatelessWidget {
  final BackendService backendService = BackendService();

  // Controllers for form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final labelFontSize = screenWidth * 0.015;
    final textFontSize = screenWidth * 0.012;
    final textFieldHeight = screenHeight * 0.06;
    final buttonHeight = screenHeight * 0.05;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 85, 81, 81),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            screenWidth < 600
                ? _buildContactUsForm(screenWidth, labelFontSize, textFontSize, textFieldHeight, buttonHeight)
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildContactUsForm(screenWidth, labelFontSize, textFontSize, textFieldHeight, buttonHeight),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: _buildImageBackground(screenWidth),
                      ),
                    ],
                  ),
            SizedBox(height: 8.0),
            Footer(), // Use the Footer widget
          ],
        ),
      ),
    );
  }

  Widget _buildContactUsForm(double screenWidth, double labelFontSize, double textFontSize, double textFieldHeight, double buttonHeight) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 239, 241, 232),
          width: 1.0,
        ),
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: labelFontSize * 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name',
                          style: TextStyle(
                              color: Colors.white, fontSize: labelFontSize)),
                      SizedBox(height: 8.0),
                      Container(
                        height: textFieldHeight,
                        child: TextField(
                          controller: firstNameController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 12.0),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your first name',
                            hintStyle: TextStyle(
                                fontSize: textFontSize,
                                color: Colors.white.withOpacity(0.6)),
                            prefixIcon: Icon(Icons.person,
                                color: Color.fromARGB(255, 235, 231, 11)),
                          ),
                          style: TextStyle(
                              fontSize: textFontSize, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Last Name',
                          style: TextStyle(
                              color: Colors.white, fontSize: labelFontSize)),
                      SizedBox(height: 8.0),
                      Container(
                        height: textFieldHeight,
                        child: TextField(
                          controller: lastNameController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 12.0),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your last name',
                            hintStyle: TextStyle(
                                fontSize: textFontSize,
                                color: Colors.white.withOpacity(0.6)),
                            prefixIcon: Icon(Icons.person,
                                color: Color.fromARGB(255, 235, 231, 11)),
                          ),
                          style: TextStyle(
                              fontSize: textFontSize, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Text('Email',
                style: TextStyle(color: Colors.white, fontSize: labelFontSize)),
            SizedBox(height: 8.0),
            Container(
              height: textFieldHeight,
              child: TextField(
                controller: emailController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                      fontSize: textFontSize,
                      color: Colors.white.withOpacity(0.6)),
                  prefixIcon: Icon(Icons.email,
                      color: Color.fromARGB(255, 235, 231, 11)),
                ),
                style: TextStyle(fontSize: textFontSize, color: Colors.white),
              ),
            ),
            SizedBox(height: 5.0),
            Text('Description',
                style: TextStyle(color: Colors.white, fontSize: labelFontSize)),
            SizedBox(height: 5.0),
            Container(
              height: textFieldHeight * 4,
              child: TextField(
                controller: descriptionController,
                textAlign: TextAlign.center,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 60.0),
                  border: OutlineInputBorder(),
                  hintText: 'Describe your issue or request...',
                  hintStyle: TextStyle(
                      fontSize: textFontSize,
                      color: Colors.white.withOpacity(0.6)),
                  prefixIcon: Icon(Icons.description,
                      color: Color.fromARGB(255, 235, 231, 11)),
                ),
                style: TextStyle(fontSize: textFontSize, color: Colors.white),
              ),
            ),
            SizedBox(height: 2.0),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: textFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
             // Background color
                                  
                   backgroundColor: Color.fromARGB(255, 235, 231, 11),
                 foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  minimumSize: Size(double.infinity, buttonHeight),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageBackground(double screenWidth) {
    return Container(
      width: screenWidth < 600 ? screenWidth : screenWidth * 0.2,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 85, 81, 81),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Image.asset(
          'lib/assets/icons/man3.png',
           // Path to your PNG file
          fit: BoxFit.contain, // Adjust the fit as needed
        ),
      ),
    );
  }

  // Function to handle form submission
  void _submitForm() async {
    Map<String, String> formData = {
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'email': emailController.text,
      'description': descriptionController.text,
    };

    try {
      await backendService.submitContactForm(formData);
      // You can show a success message or navigate to another screen
      print('Form submitted successfully');
    } catch (error) {
      // Handle any errors that occur during form submission
      print('Error submitting form: $error');
    }
  }
}
