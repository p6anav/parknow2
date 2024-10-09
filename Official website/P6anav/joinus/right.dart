import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dropdown.dart'; // Import the dropdowns.dart file
import 'popup.dart';
import 'location_popup.dart';

class RightContainer extends StatefulWidget {
  @override
  _RightContainerState createState() => _RightContainerState();
}

class _RightContainerState extends State<RightContainer> {
  // TextEditingControllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _adminNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();
  final TextEditingController _propertyNameController = TextEditingController();
  final TextEditingController _propertyLocationController =
      TextEditingController();

  // Dropdown values
  String? _selectedCountry;
  String? _selectedState;
  String? _selectedDistrict;
  String? _selectedCity;
  String? _selectedRole; // For Roles dropdown

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 141, 174, 8), // Border color
          width: 1.0, // Border width
        ),
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
                // Name and Phone Fields
                _buildLabeledTextFieldsRow(
                  'Name',
                  'Enter your name',
                  'Phone',
                  'Enter your phone number',
                  'lib/assets/icons/person.svg',
                  'lib/assets/icons/phone.svg',
                  _nameController,
                  _phoneController,
                  isSmallScreen,
                ),
                // Country and State Dropdowns
                _buildDropdownTextFieldsRow(
                  'Country',
                  ['USA', 'Canada', 'Mexico'],
                  'State',
                  ['California', 'Texas', 'New York'],
                  _selectedCountry,
                  _selectedState,
                  isSmallScreen,
                ),
                // District and City Dropdowns
                _buildDropdownTextFieldsRow(
                  'District',
                  ['District 1', 'District 2', 'District 3'],
                  'City',
                  ['City A', 'City B', 'City C'],
                  _selectedDistrict,
                  _selectedCity,
                  isSmallScreen,
                ),
                // Admin Name and Roles (Dropdown for Roles)
                _buildLabeledTextFieldsRowWithDropdown(
                  'Admin Name',
                  'Enter your admin name',
                  'Roles',
                  ['Admin', 'User'], // Roles options
                  _adminNameController,
                  _selectedRole,
                  isSmallScreen,
                ),
                // Email and Password Fields
                _buildLabeledTextFieldsRow(
                  'Email*',
                  'Enter your email',
                  'Password',
                  'Enter your password',
                  'lib/assets/icons/email.svg',
                  'lib/assets/icons/lock.svg',
                  _emailController,
                  _passwordController,
                  isSmallScreen,
                ),
                // Payment and Property Name Fields
                _buildLabeledTextFieldsRow(
                  'Payment/Hour',
                  'Enter payment',
                  'Property Name',
                  'Enter your Property Name',
                  'lib/assets/icons/rupee.svg',
                  'lib/assets/icons/property.svg',
                  _paymentController,
                  _propertyNameController,
                  isSmallScreen,
                ),
                // Property Location Field with Buttons
                _buildLabeledTextFieldsWithSeparateButtons(
                  'Property Location',
                  'Enter property location',
                  'Location',
                  'Upload',
                  'lib/assets/icons/location.svg',
                  'lib/assets/icons/attachment.svg',
                  _propertyLocationController,
                  isSmallScreen,
                ),
                
                SizedBox(height: 20.0),
                // Submit Button
                
                Center(
                  child: Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PaymentPopup(); // This will show the payment popup
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width < 600
                                ? 100.0
                                : 200.0,
                            vertical: 15.0,
                          ),
                          backgroundColor: Color.fromARGB(255, 235, 231, 11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ),
             
              ],
            );
          },
        ),
      ),
    );
  }

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

  // Modified Row with Dropdown for Roles Field
  Widget _buildLabeledTextFieldsRowWithDropdown(
    String leftLabel,
    String leftHint,
    String rightLabel,
    List<String> rightItems,
    TextEditingController leftController,
    String? rightValue,
    bool isSmallScreen,
  ) {
    if (isSmallScreen) {
      return Column(
        children: [
          _buildLabeledTextField(leftLabel, leftHint,
              'lib/assets/icons/person.svg', leftController),
          SizedBox(height: 12.0),
          CustomDropdownField(
            label: rightLabel,
            items: ['Admin', 'User'],
            currentValue: rightValue,
            onChanged: (value) {
              setState(() {
                _selectedRole = value;
              });
            },
          ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildLabeledTextField(leftLabel, leftHint,
                'lib/assets/icons/person.svg', leftController),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: CustomDropdownField(
              label: rightLabel,
              items: ['Admin', 'User'], // Removed 'Manager'
              currentValue: rightValue,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
            ),
          ),
        ],
      );
    }
  }

  Widget _buildDropdownTextFieldsRow(
    String leftLabel,
    List<String> leftItems,
    String rightLabel,
    List<String> rightItems,
    String? leftValue,
    String? rightValue,
    bool isSmallScreen,
  ) {
    if (isSmallScreen) {
      return Column(
        children: [
          _buildDropdownField(leftLabel, leftItems, leftValue, (value) {
            setState(() {
              _selectedCountry = value;
            });
          }),
          SizedBox(height: 12.0),
          _buildDropdownField(rightLabel, rightItems, rightValue, (value) {
            setState(() {
              _selectedState = value;
            });
          }),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child:
                _buildDropdownField(leftLabel, leftItems, leftValue, (value) {
              setState(() {
                _selectedCountry = value;
              });
            }),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: _buildDropdownField(rightLabel, rightItems, rightValue,
                (value) {
              setState(() {
                _selectedState = value;
              });
            }),
          ),
        ],
      );
    }
  }

  Widget _buildDropdownField(
    String label,
    List<String> items,
    String? currentValue,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16.0, color: Colors.white)),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: DropdownButtonFormField<String>(
            value: items.contains(currentValue) ? currentValue : null,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(color: Colors.white)),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color.fromARGB(34, 165, 164, 164),
            ),
            dropdownColor: const Color.fromARGB(255, 47, 45, 45),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildLabeledTextFieldsWithSeparateButtons(
    String leftLabel,
    String leftHint,
    String leftButtonLabel,
    String rightButtonLabel,
    String leftIconPath,
    String rightIconPath,
    TextEditingController leftController,
    bool isSmallScreen,
  ) {
    if (isSmallScreen) {
      return Column(
        children: [
          _buildLabeledTextFieldWithSeparateButtons(leftLabel, leftHint,
              leftIconPath, leftButtonLabel, leftController),
          SizedBox(height: 12.0),
          _buildLabeledTextFieldWithSeparateButtons(
              'Upload', '', rightIconPath, rightButtonLabel, null),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildLabeledTextFieldWithSeparateButtons(leftLabel,
                leftHint, leftIconPath, leftButtonLabel, leftController),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: _buildLabeledTextFieldWithSeparateButtons(
                'Upload', '', rightIconPath, rightButtonLabel, null),
          ),
        ],
      );
    }
  }

  Widget _buildLabeledTextFieldWithSeparateButtons(String label, String hint,
      String iconPath, String buttonLabel, TextEditingController? controller) {
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
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color:
                      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
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
                    if (buttonLabel == 'Location') {
                      LocationPopup.show(context); // Call the separated popup here
                    } else if (buttonLabel == 'Upload') {
                      // Handle upload logic here
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
          ),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

