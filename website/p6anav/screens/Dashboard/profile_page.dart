import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;

  ProfilePage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name\'s Profile pranav'),
      ),
      body: Center(
        child: Text(
          'Welcome to the profile of pranav $name',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
