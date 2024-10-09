import 'package:flutter/material.dart';
import 'payment_fee_screen.dart'; // Import the next screen here

class PaymentPopup extends StatefulWidget {
  @override
  _PaymentPopupState createState() => _PaymentPopupState();
}

class _PaymentPopupState extends State<PaymentPopup> {
  String _selectedPaymentMethod = 'Card'; // Default to 'Card'
  bool _isVerifyingUPI = false; // Track UPI verification state

  // Simulate UPI verification
  void _verifyUPI(String upiID) {
    setState(() {
      _isVerifyingUPI = true;
    });

    // Simulate a network call (delay for 2 seconds)
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isVerifyingUPI = false;
      });
      // For now, assuming the verification is successful
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('UPI ID verified successfully!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ), // Rounded corners
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
        height: MediaQuery.of(context).size.height * 0.8, // Adjusted height
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 31, 29, 29), // Background color black
          border: Border.all(
            color: Color.fromARGB(255, 212, 234, 131), // Border color green
            width: 0.5, // Border thickness
          ),
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
        child: Row(
          children: [
            // Side menu bar for payment method selection
            Container(
              width: MediaQuery.of(context).size.width * 0.2, // 20% width for the sidebar
              color: Color.fromARGB(0, 42, 42, 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Close Button (X mark)
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the popup
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // Payment method options in the sidebar
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Payment Methods',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Card Payment Method
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'Card';
                      });
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: _selectedPaymentMethod == 'Card'
                              ? Colors.green.withOpacity(0.5)
                              : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.credit_card, color: Colors.white),
                            SizedBox(width: 10),
                            Text('Card', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // UPI Payment Method
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'UPI';
                      });
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: _selectedPaymentMethod == 'UPI'
                              ? Colors.green.withOpacity(0.5)
                              : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.account_balance_wallet, color: Colors.white),
                            SizedBox(width: 10),
                            Text('UPI', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Main content area based on the selected payment method
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Heading: Checkout
                    Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Payment Details Section
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Details',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Text('Charge: \$180', style: TextStyle(color: Colors.white)),
                          SizedBox(height: 10),
                          if (_selectedPaymentMethod == 'Card') ...[
                            // New styled card UI
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4, // Set width to 40% of screen width
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF001F3F), // Dark blue
                                        Color.fromARGB(255, 3, 18, 33), // Bright blue
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Card Details',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        _buildTextField('Cardholder Name', Icons.account_circle),
                                        SizedBox(height: 10),
                                        _buildTextField('Card Number', Icons.credit_card),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: _buildTextField('Expiry Date', Icons.calendar_today)),
                                            SizedBox(width: 10),
                                            Expanded(child: _buildTextField('CVV', Icons.lock, obscureText: true)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ] else if (_selectedPaymentMethod == 'UPI') ...[
                            // UPI Payment Field
                            _buildTextField('UPI ID', Icons.account_balance_wallet, onSubmitted: _verifyUPI),
                            SizedBox(height: 20),
                            if (_isVerifyingUPI)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Verifying UPI...',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                          ],
                        ],
                      ),
                    ),
                    Spacer(), // Push the button to the bottom
                    // Proceed Button
                    ElevatedButton(
                      onPressed: () {
                        if (!_isVerifyingUPI) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentFeeScreen(),
                            ),
                          );
                        }
                      },
                      child: Text('Pay \$180'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 209, 233, 56), // Button background color green
                        foregroundColor: Colors.black, // Button text color black
                        padding: EdgeInsets.symmetric(vertical: 15), // Button height
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to build text fields with labels and icons
  Widget _buildTextField(String label, IconData icon, {bool obscureText = false, Function(String)? onSubmitted}) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Color(0xFF424242), // Dark background for text fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
