import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RightContainer extends StatefulWidget {
  @override
  _RightContainerState createState() => _RightContainerState();
}

class _RightContainerState extends State<RightContainer> {
  // Define controllers for each input field
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final adminNameController = TextEditingController();
  final rolesController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final paymentController = TextEditingController();
  final propertyNameController = TextEditingController();
  final propertyLocationController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when the widget is destroyed
    nameController.dispose();
    phoneController.dispose();
    adminNameController.dispose();
    rolesController.dispose();
    emailController.dispose();
    passwordController.dispose();
    paymentController.dispose();
    propertyNameController.dispose();
    propertyLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isSmallScreen = constraints.maxWidth < 600;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Let's ",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "Talk",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 235, 231, 11),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  "We're here to assist you with anything you need.",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 24.0),
                // Dynamic fields with controllers
                _buildLabeledTextFieldsRow(
                  'Name',
                  'Enter your name',
                  'Phone',
                  'Enter your phone number',
                  'lib/assets/icons/person.svg',
                  'lib/assets/icons/phone.svg',
                  nameController,
                  phoneController,
                  isSmallScreen,
                ),
                _buildLabeledTextFieldsRow(
                  'Admin Name',
                  'Enter your admin name',
                  'Roles',
                  'Enter roles',
                  'lib/assets/icons/person.svg',
                  'lib/assets/icons/role.svg',
                  adminNameController,
                  rolesController,
                  isSmallScreen,
                ),
                _buildLabeledTextFieldsRow(
                  'Email*',
                  'Enter your email',
                  'Password',
                  'Enter your password',
                  'lib/assets/icons/email.svg',
                  'lib/assets/icons/lock.svg',
                  emailController,
                  passwordController,
                  isSmallScreen,
                ),
                _buildLabeledTextFieldsRow(
                  'Payment/Hour',
                  'Enter payment',
                  'Property Name',
                  'Enter your Property Name',
                  'lib/assets/icons/rupee.svg',
                  'lib/assets/icons/property.svg',
                  paymentController,
                  propertyNameController,
                  isSmallScreen,
                ),
                _buildLabeledTextFieldsWithSeparateButtons(
                  'Property Location',
                  'Enter property location',
                  'Location',
                  'Upload',
                  'lib/assets/icons/location.svg',
                  'lib/assets/icons/attachment.svg',
                  propertyLocationController,
                  isSmallScreen,
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle form submission
                      print('Name: ${nameController.text}');
                      print('Phone: ${phoneController.text}');
                      print('Admin Name: ${adminNameController.text}');
                      print('Roles: ${rolesController.text}');
                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
                      print('Payment: ${paymentController.text}');
                      print('Property Name: ${propertyNameController.text}');
                      print(
                          'Property Location: ${propertyLocationController.text}');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 100.0 : 200.0, // Adjust padding based on screen size
                        vertical: 15.0,
                      ),
                      primary: Color.fromARGB(255, 235, 231, 11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Text Field Row with TextEditingControllers
  Widget _buildLabeledTextFieldsRow(
    String leftLabel,
    String leftHint,
    String rightLabel,
    String rightHint,
    String leftIconPath,
    String rightIconPath,
    TextEditingController leftController,
    TextEditingController rightController,
    bool isSmallScreen,
  ) {
    if (isSmallScreen) {
      return Column(
        children: [
          _buildLabeledTextField(
              leftLabel, leftHint, leftIconPath, leftController),
          SizedBox(height: 12.0),
          _buildLabeledTextField(
              rightLabel, rightHint, rightIconPath, rightController),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildLabeledTextField(
                leftLabel, leftHint, leftIconPath, leftController),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: _buildLabeledTextField(
                rightLabel, rightHint, rightIconPath, rightController),
          ),
        ],
      );
    }
  }

  // Text Field with Separate Buttons and TextEditingController
  Widget _buildLabeledTextFieldsWithSeparateButtons(
    String label,
    String hint,
    String leftButtonLabel,
    String rightButtonLabel,
    String leftIconPath,
    String rightIconPath,
    TextEditingController controller,
    bool isSmallScreen,
  ) {
    if (isSmallScreen) {
      return Column(
        children: [
          _buildLabeledTextFieldWithSeparateButtons(
              label, hint, leftIconPath, controller, leftButtonLabel),
          SizedBox(height: 12.0),
          _buildLabeledTextFieldWithSeparateButtons(
              'Upload', '', rightIconPath, controller, rightButtonLabel),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildLabeledTextFieldWithSeparateButtons(
                label, hint, leftIconPath, controller, leftButtonLabel),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: _buildLabeledTextFieldWithSeparateButtons(
                'Upload', '', rightIconPath, controller, rightButtonLabel),
          ),
        ],
      );
    }
  }

  // Common function to build Text Field with Controller
  Widget _buildLabeledTextField(String label, String hint, String iconPath,
      TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16.0, color: Colors.white)),
        SizedBox(height: 8.0),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                iconPath,
                color: Color.fromARGB(255, 235, 231, 11),
              ),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  // Build Text Field with Button
  Widget _buildLabeledTextFieldWithSeparateButtons(String label, String hint,
      String iconPath, TextEditingController controller, String buttonLabel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.0),
        Stack(
          children: [
            TextField(
              controller: controller, // Assign the controller here
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    iconPath,
                    color: Color.fromARGB(255, 235, 231, 11),
                  ),
                ),
                suffixIcon: TextButton(
                  onPressed: () {
                    // Handle button action here
                    if (buttonLabel == 'Location') {
                      // Handle location logic
                      print('Location button pressed');
                    } else if (buttonLabel == 'Upload') {
                      // Handle upload logic
                      print('Upload button pressed');
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    backgroundColor:
                        Color.fromARGB(255, 139, 138, 142).withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    buttonLabel,
                    style: TextStyle(
                      color: Color.fromARGB(255, 235, 231, 11),
                    ),
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
