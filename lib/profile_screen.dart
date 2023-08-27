import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String username;

  ProfileScreen({required this.username});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'John Doe'; // Replace with user's name
  String userID = '12345'; // Replace with user's ID
  String phone = '123-456-7890'; // Replace with user's phone number
  String email = 'john@example.com'; // Replace with user's email
  String district = 'Dhaka'; // Replace with user's district
  String upazila = 'Gulshan'; // Replace with user's upazila
  String zipCode = '123456'; // Replace with user's zip code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.username == '001'?Color(0xFFD35400)
            :widget.username == '002'?Color(0xFF16A085):Color(0xFF2C3E50),
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save), // Use the edit icon
            onPressed: _handleUpdateProfileClick,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            _buildProfileInfoField('User ID', userID),
            _buildProfileInfoField('Phone', phone),
            _buildProfileInfoField('Email', email),
            _buildProfileInfoField('District', district),
            _buildProfileInfoField('Upazila', upazila),
            _buildProfileInfoField('Zip Code', zipCode),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  void _handleUpdateProfileClick() {
    // Implement logic to handle the update profile button click
  }
}
