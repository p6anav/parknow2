import 'package:flutter/material.dart';

class PaymentFeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 29, 29), // Black background
      appBar: AppBar(
        title: Text('Payment Fee Details'),
        backgroundColor: Color.fromARGB(255, 31, 29, 29), // Black background
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title of the Screen
            Text(
              'Application Charges',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            // Sample Payment Details
            Text(
              'Service Charge: \$20',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Application Fee: \$50',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Total: \$70',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            // Proceed button
            ElevatedButton(
              onPressed: () {
                // Navigate to loading screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoadingScreen()),
                );
              },
              child: Text('Confirm Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 209, 233, 56),
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 29, 29), // Black background
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 5)), // Simulate payment processing
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While processing
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Processing Payment...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              );
            } else {
              // After processing is complete
              return SuccessScreen();
            }
          },
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 29, 29), // Black background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.greenAccent,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Payment Successful!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Pop all screens until the home screen or exit the app
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Back to Home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 209, 233, 56),
                 foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
