import 'package:flutter/material.dart'; // Import is required for Text and basic widgets

class HomeScreen extends StatelessWidget {
  final bool isSelected;

  HomeScreen({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Ensure the Column fits its content
      crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
      children: [
        
       
      ],
    );
  }
}
