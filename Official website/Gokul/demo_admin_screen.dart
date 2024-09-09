import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/browser_client.dart'; // Ensure you use this for web


class JoinUsScreen extends StatefulWidget {
  const JoinUsScreen({super.key});

  @override
  State<JoinUsScreen> createState() => _JoinUsScreenState();
}

class _JoinUsScreenState extends State<JoinUsScreen> {
  int selectedIndex = 2;// Default to "Join us" screen
  TextEditingController adminName = TextEditingController();
  TextEditingController propertyName = TextEditingController();
  TextEditingController districtName = TextEditingController();
  TextEditingController countryName = TextEditingController();
  TextEditingController stateName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController payment = TextEditingController();
  TextEditingController hour = TextEditingController();
  TextEditingController floors = TextEditingController();
  TextEditingController slots = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();

  final String urlRoles = "http://localhost:9000/allRoles";
  List<String> roles = [];
  List<String> selectedRoles = [];

  @override
  void initState() {
    super.initState();
    // Optionally, fetch roles when the widget is initialized
    getRoles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1C20),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left section (Central office and Contact us)
                  Container(
                    width: 350, // Adjusted width
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCentralOfficeInfo(),
                        SizedBox(height: 24),
                        _buildContactForm(),
                        SizedBox(height: 24),
                        _buildSocialMediaIcons(),
                      ],
                    ),
                  ),
                  SizedBox(width: 32),
                  // Right section (Form fields and buttons)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildTopMenu(),
                          SizedBox(height: 24),
                          Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                if (selectedIndex == 0) _buildHomeScreen(),
                                if (selectedIndex == 1) _buildServicesScreen(),
                                if (selectedIndex == 2) _buildJoinUsScreen(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: _buildMenuButton("Home", 0)),
        Expanded(child: _buildMenuButton("Services", 1)),
        Expanded(child: _buildMenuButton("Join us", 2)),
      ],
    );
  }

  Widget _buildMenuButton(String title, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selectedIndex == index ? Colors.yellow : Colors.grey,
          fontSize: 18,
          fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildCentralOfficeInfo(){
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF1B1C20),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Central office',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          _buildInfoRow(Icons.location_on, 'G6F7+QRR, Swaraj Round N., Thekkinkadu Maidan, Thrissur, Kerala 680001'),
          SizedBox(height: 8),
          _buildInfoRow(Icons.phone, '+91 8344982263'),
          SizedBox(height: 8),
          _buildInfoRow(Icons.phone, '+91 8345822653'),
        ],
      ),
    );
  }
  Widget _buildInfoRow(IconData icon, String info) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            info,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildHomeScreen() {
    return Center(
      child: Text(
        "Home Screen",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  Widget _buildServicesScreen() {
    return Center(
      child: Text(
        "Services Screen",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  Widget _buildJoinUsScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align to top left
      children: [
        _buildFormFieldsWithHeader(), // Combine header with form fields
      ],
    );
  }

  Widget _buildFormFieldsWithHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align to top left
      children: [
        _buildHeader(),
        SizedBox(height: 24),
        _buildFormFields(), // Form fields directly under the header
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Talk",
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 32, // Slightly larger font size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Our team is here round-the-clock",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        Text(
          "ready to respond to all your inquiries.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF1B1C20),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Contact us',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          // Row for First name and Last name
          Row(
            children: [
              Expanded(
                child: _buildTextField('First name*'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildTextField('Last name'),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildTextField('Email*'),
          SizedBox(height: 16),
          _buildTextField('What can we help with you?'),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Center(
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFF454545),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.facebook, color: Colors.white, size: 24),
        Icon(Icons.add_circle, color: Colors.white, size: 24),
        Icon(Icons.add_circle, color: Colors.white, size: 24),
        Icon(Icons.add_circle, color: Colors.white, size: 24),
      ],
    );
  }

  Widget _buildFormFields() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //_buildTextFieldWithIcon(Icons.person, 'Name'),
         // SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextFieldWithIcon(Icons.person,'Select your country',countryName)),
              SizedBox(width: 16),
              Expanded(child: _buildTextFieldWithIcon(Icons.person,'Select your state',stateName)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextFieldWithIcon(Icons.person,'Select your District',districtName)),
              SizedBox(width: 16),
              Expanded(child: _buildTextFieldWithIcon(Icons.home, 'Property name',propertyName)),
            ],
          ),
          SizedBox(height: 16),
          _buildTextFieldWithIcon(Icons.person, 'Admin name',adminName),
          SizedBox(height: 16),
          _buildTextFieldWithIcon(Icons.email, 'Email*',email),
          SizedBox(height: 16),
          _buildTextFieldWithIcon(Icons.money, 'Payment',payment),
          SizedBox(height: 16),
          _buildTextFieldWithIcon(Icons.money, 'hour',hour),
          SizedBox(height: 16),
          //_buildUploadField(),
          _buildTextFieldWithIcon(Icons.flood_rounded, 'Number of floors',floors),
          SizedBox(height: 24),
          _buildTextFieldWithIcon(Icons.scatter_plot, 'Number of slots',slots),
          SizedBox(height: 24),
          _buildPasswordField(),
          SizedBox(height: 16),
          _buildDropdownField('Roles played'),
          SizedBox(height: 24),
          _buildTextFieldWithIcon(Icons.scatter_plot, 'location',location),
          //_buildPaymentMethodSelector(),
          SizedBox(height: 24),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildTextFieldWithIcon(IconData icon, String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFF454545),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /*Future<void> getRoles() async {
    var client = BrowserClient(); // Use BrowserClient for web-specific requests
    try {
      print("Fetching roles from the API...");
      var res = await client.get(
        Uri.parse(urlRoles),
        headers: {'Content-Type': 'application/json'},
      );
      print('Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');
      if (res.statusCode == 200) {
        // Success handling
        print("Roles fetched successfully.");
      } else {
        // Handle non-200 responses
        print("Failed to fetch roles. Status Code: ${res.statusCode}");
      }
    } catch (e) {
      // Catch any errors that occur during the request
      print(e);
    } finally {
      client.close(); // Ensure the client is closed after the request
    }
  }*/

  Future<void> getRoles() async {
    var client = BrowserClient(); // Use BrowserClient for web-specific requests
    try {
      print("Fetching roles from the API...");
      var res = await client.get(
        Uri.parse(urlRoles),
        headers: {'Content-Type': 'application/json'},
      );
      print('Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');
      if (res.statusCode == 200) {
        // Parse the response body
        List<dynamic> data = json.decode(res.body);
        // Extract role names and update the state
        setState(() {
          roles = data.map((item) => item['roleName'] as String).toList();
        });
        print("Roles fetched successfully.");
      } else {
        // Handle non-200 responses
        print("Failed to fetch roles. Status Code: ${res.statusCode}");
      }
    } catch (e) {
      // Catch any errors that occur during the request
      print(e);
    } finally {
      client.close(); // Ensure the client is closed after the request
    }
  }

  /*Widget _buildDropdownField(String hintText) {
    return DropdownButtonFormField<String>(
      onTap: (){
        print("hai");
        getRoles();
      },
      items: <String>['Option 1', 'Option 2', 'Option 3'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {},
      dropdownColor: Color(0xFF454545),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFF454545),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }*/
  Widget _buildDropdownField(String hintText) {
    return GestureDetector(
      onTap: _showMultiSelectDialog,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Color(0xFF454545),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        child: Wrap(
          spacing: 8.0,
          children: selectedRoles
              .map((role) => Chip(
            label: Text(role),
            deleteIcon: Icon(Icons.close),
            onDeleted: () {
              setState(() {
                selectedRoles.remove(role);
              });
            },
          ))
              .toList(),
        ),
      ),
    );
  }

  void _showMultiSelectDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xFF454545),
              title: Text('Select Roles',style: TextStyle(color: Colors.white),),
              content: SingleChildScrollView(
                child: ListBody(
                  children: roles.map((role) {
                    return CheckboxListTile(
                      title: Text(role,style: TextStyle(color: Colors.white)),
                      value: selectedRoles.contains(role),
                      onChanged: (bool? selected) {
                        setState(() {
                          if (selected == true) {
                            selectedRoles.add(role);
                          } else {
                            selectedRoles.remove(role);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildUploadField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Documents',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF454545),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: Row(
                children: [
                  Icon(Icons.upload_file, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Choose File',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Text(
              'No file chosen',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }



  Widget _buildPasswordField() {
    return _buildTextFieldWithIcon(Icons.lock, 'Password',password);
  }

  Widget _buildPaymentMethodSelector() {
    return Row(
      children: [
        Expanded(
          child: _buildDropdownField('Choose a Payment Method'),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if(adminName.text.isEmpty || countryName.text.isEmpty || stateName.text.isEmpty || districtName.text.isEmpty || propertyName.text.isEmpty
            || email.text.isEmpty || payment.text.isEmpty || hour.text.isEmpty || floors.text.isEmpty || slots.text.isEmpty || password.text.isEmpty
            || location.text.isEmpty){
          print("Empty fields");
        }
        else{
          print(adminName.text + countryName.text + stateName.text + districtName.text + propertyName.text
              + email.text + payment.text + hour.text + floors.text + slots.text + password.text + location.text);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Center(
        child: Text(
          'Submit',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



