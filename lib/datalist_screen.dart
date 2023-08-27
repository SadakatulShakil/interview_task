import 'package:flutter/material.dart';
import 'Helper/database_helper.dart';
import 'Models/model.dart';

class DataListScreen extends StatefulWidget {
  final String username;

  DataListScreen({required this.username});

  @override
  _DataListScreenState createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  List<UserData> _userDataList = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final users = await DatabaseHelper.instance.getAllUserDataByUsername(widget.username);
    setState(() {
      _userDataList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data List'),
      ),
      body: ListView.builder(
        itemCount: _userDataList.length,
        itemBuilder: (context, index) {
          final userData = _userDataList[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(userData.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone: ${userData.phone}'),
                  Text('Email: ${userData.email}'),
                ],
              ),
              onTap: () {
                // Handle item tap
              },
            ),
          );
        },
      ),
    );
  }
}
