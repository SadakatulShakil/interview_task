import 'package:flutter/material.dart';

import 'Helper/database_helper.dart';
import 'Models/model.dart';

class AddUserDataScreen extends StatefulWidget {
  final String username;

  AddUserDataScreen({required this.username});

  @override
  _AddUserDataScreenState createState() => _AddUserDataScreenState();
}

class _AddUserDataScreenState extends State<AddUserDataScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone')),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final userData = UserData(
                  id: null,
                  username: widget.username,
                  name: _nameController.text,
                  phone: _phoneController.text,
                  email: _emailController.text,
                  isSynced: false, // Assuming you have an isSynced field
                );
                await DatabaseHelper.instance.insertUserData(widget.username, userData);

                // Clear input fields
                _nameController.clear();
                _phoneController.clear();
                _emailController.clear();

                // Show a SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Data added successfully"),
                    duration: Duration(seconds: 2),
                  ),
                );

              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
