


import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;

  ProfileScreen({required this.firstName, required this.lastName, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $firstName $lastName',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Last Name: $lastName',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

