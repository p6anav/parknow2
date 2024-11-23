// lib/footer.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 31, 31, 30),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Company Information
          Text(
            '© 2024 Autpo Spaze. All rights reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '1234 Street Name, City, Country, 56789',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'Phone: +123 456 7890',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'Email: contact@yourcompany.com',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 20.0),
          // Social Media Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'lib/assets/icons/facebook.svg',
                 
                  height: 24.0,
                ),
                onPressed: () {
                  // Add your Facebook URL here
                },
              ),
              SizedBox(width: 10.0),
              IconButton(
                icon: SvgPicture.asset(
                  'lib/assets/icons/twitter.svg',
                 
                  height: 24.0,
                ),
                onPressed: () {
                  // Add your Twitter URL here
                },
              ),
              SizedBox(width: 10.0),
              IconButton(
                icon: SvgPicture.asset(
                  'lib/assets/icons/isnatgram.svg',
                  
                  height: 24.0,
                ),
                onPressed: () {
                  // Add your Instagram URL here
                },
              ),
              SizedBox(width: 10.0),
              IconButton(
                icon: SvgPicture.asset(
                  'lib/assets/icons/linkedin.svg',
                 
                  height: 24.0,
                ),
                onPressed: () {
                  // Add your LinkedIn URL here
                },
              ),
            ],
          ),
          SizedBox(height: 20.0),
          // Legal Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // Add your Privacy Policy URL here
                },
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              SizedBox(width: 10.0),
              TextButton(
                onPressed: () {
                  // Add your Terms of Service URL here
                },
                child: Text(
                  'Terms of Service',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
