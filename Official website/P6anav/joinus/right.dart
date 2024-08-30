import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RightContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
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
              "We're here to assist you with",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[400],
              ),
            ),
            Text(
              "anything you need.",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[400],
              ),
            ),
            SizedBox(height: 24.0),
            // Dropdown and Text Fields Rows
             _buildLabeledTextFieldsRow(
              'Name',
              'Enter your name',
              'Phone',
              'Enter your phone number',
              'lib/assets/icons/person.svg', // Icon for Name field
              'lib/assets/icons/phone.svg', // Icon for Phone field
            ),
            _buildDropdownTextFieldsRow(
              'Country',
              ['USA', 'Canada', 'Mexico'],
              'State',
              ['California', 'Texas', 'New York'],
            ),
            _buildDropdownTextFieldsRow(
              'District',
              ['District 1', 'District 2', 'District 3'],
              'City',
              ['City A', 'City B', 'City C'],
            ),
           
            _buildLabeledTextFieldsRow(
              'Admin Name',
              'Enter your admin name',
              'Roles',
              'Enter roles',
              'lib/assets/icons/person.svg', // Icon for Admin Name field
              'lib/assets/icons/role.svg', // Icon for Roles field
            ),
            _buildLabeledTextFieldsRow(
              'Email*',
              'Enter your email',
              'Password',
              'Enter your password',
              'lib/assets/icons/email.svg', // Icon for Email field
              'lib/assets/icons/lock.svg', // Icon for Password field
            ),
           
            _buildLabeledTextFieldsRow(
              'Payment/Hour',
              'Enter payment',
              'Property Name',
              'Enter your Property Name',
              'lib/assets/icons/rupee.svg', // Icon for Payment/Hour field
              'lib/assets/icons/property.svg', // Icon for Additional info field
            ),
             _buildLabeledTextFieldsRowWithButtons(
              'Property Location',
              ' property location',
              'Upload*',
              'Enter file name',
              'lib/assets/icons/location.svg', // Icon for Property Location field
              'lib/assets/icons/attachment.svg', // Icon for Upload1 field
              'Property Location',
            ),
            SizedBox(height: 20.0),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
                  primary:  Color.fromARGB(255, 235, 231, 11),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownTextFieldsRow(
    String leftLabel,
    List<String> leftItems,
    String rightLabel,
    List<String> rightItems,
  ) {
    String? selectedLeftItem;
    String? selectedRightItem;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Dropdown Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 3.0),
                    Text(
                      leftLabel,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 50.0,
                  
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: DropdownButton<String>(
                    value: selectedLeftItem,
                    hint: Text(
                      'Select $leftLabel',
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                    isExpanded: true,
                    dropdownColor: Colors.black,
                    underline: SizedBox(),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    items: leftItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      selectedLeftItem = newValue!;
                      // Update the state or handle logic here
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.0),
          // Right Dropdown Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8.0),
                    Text(
                      rightLabel,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 50.0,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: DropdownButton<String>(
                    value: selectedRightItem,
                    hint: Text(
                      'Select $rightLabel',
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                    isExpanded: true,
                    dropdownColor: Colors.black,
                    underline: SizedBox(),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    items: rightItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      selectedRightItem = newValue!;
                      // Update the state or handle logic here
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
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
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8.0),
                    Text(
                      leftLabel,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  height: 50.0,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: leftHint,
                      hintStyle: TextStyle(
                          fontSize: 16.0, color: Colors.white.withOpacity(0.6)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          leftIconPath,
                          color:  Color.fromARGB(255, 235, 231, 11),
                          height: 16.0, // Adjust the height of the icon
                          width: 16.0, // Adjust the width of the icon
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.0),
          // Right Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8.0),
                    Text(
                      rightLabel,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  height: 50.0,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: rightHint,
                      hintStyle: TextStyle(
                          fontSize: 16.0, color: Colors.white.withOpacity(0.6)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          rightIconPath,
                          color:   Color.fromARGB(255, 235, 231, 11),
                          height: 16.0, // Adjust the height of the icon
                          width: 16.0, // Adjust the width of the icon
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabeledTextFieldsRowWithButtons(
    String leftLabel,
    String leftHint,
    String rightLabel,
    String rightHint,
    String leftIconPath,
    String rightIconPath,
    String buttonLabel,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column with Button
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8.0),
                    Text(
                      leftLabel,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
               
                SizedBox(height: 8.0),
                SizedBox(
                  height: 120.0, // Increased height to accommodate buttons
                  child: Stack(
                    children: [
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: leftHint,
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white.withOpacity(0.6)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              leftIconPath,
                              color:  Color.fromARGB(255, 235, 231, 11),
                              height: 16.0, // Adjust the height of the icon
                              width: 16.0, // Adjust the width of the icon
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 60.0),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 70,
                        right: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 130.0, // Custom width for left button
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle map button press
                                },
                                style: ElevatedButton.styleFrom(
                                  primary:  Color.fromARGB(255, 235, 231, 11),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                ),
                                child: Text(
                                  'Pick on Map',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 130.0, // Custom width for right button
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle new button press
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 235, 231, 11),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                ),
                                child: Text(
                                  'New Action',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.0),
          // Right Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8.0),
                    Text(
                      rightLabel,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 8.0),
                SizedBox(
                  height: 120.0,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: rightHint,
                      hintStyle: TextStyle(
                        fontSize: 16.0, 
                        color: Colors.white.withOpacity(0.6)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 60.0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          rightIconPath,
                          color: Color.fromARGB(255, 235, 231, 11),
                          height: 16.0, // Adjust the height of the icon
                          width: 16.0,
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
