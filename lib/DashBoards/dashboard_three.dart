import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/add_data_screen.dart';
import 'package:task/datalist_screen.dart';
import 'package:http/http.dart' as http;

import '../Helper/database_helper.dart';
import '../Models/model.dart';
import '../login_screen.dart';
import '../profile_screen.dart';


class DashboardThreeScreen extends StatefulWidget {
  final String username;

  DashboardThreeScreen({required this.username});
  @override
  _DashboardThreeScreenState createState() => _DashboardThreeScreenState();
}
class GridItem {
  final String icon;
  final String name;
  final VoidCallback onTap;

  GridItem({required this.icon, required this.name, required this.onTap});
}

class _DashboardThreeScreenState extends State<DashboardThreeScreen> {
  int _selectedIndex = 0;
  late List<GridItem> gridItems;

  @override
  void initState() {
    super.initState();

    gridItems = [
      GridItem(
        icon: 'assets/images/profile3.png',
        name: "Profile",
        onTap: () {
          // Handle Profile tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(username: widget.username),
            ),
          );
          print("Tapped Profile");
        },
      ),
      GridItem(
        icon: 'assets/images/data_list3.png',
        name: "Data List",
        onTap: () {
          // Handle Data List tap
          _handleDataList();
        },
      ),
      GridItem(
        icon: 'assets/images/add_data3.png',
        name: "Add Data",
        onTap: () {
          // Handle Add Data tap
          _handleAddData();
        },
      ),
      GridItem(
        icon: 'assets/images/take_picture3.png',
        name: "Take Photo",
        onTap: () {
          // Handle Take Photo tap
          print("Tapped Take Photo");
        },
      ),
      GridItem(
        icon: 'assets/images/sync_data3.png',
        name: "Sync Data",
        onTap: () {
          // Handle Sync Data tap
          _syncData();
          print("Tapped Sync Data");
        },
      ),
    ];

  }
  void _handleAddData() {
    print("Tapped Data List");
    // Handle Data List tap here
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUserDataScreen(username: widget.username),
      ),
    );
  }
  void _handleDataList() {
    print("Tapped Data List");
    // Handle Data List tap here
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DataListScreen(username: widget.username,),
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
      // Handle "About" tap
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Clicked on ${_getNavItemLabel(index)}"),
            duration: Duration(seconds: 2),
          ),
        );
        break;
      case 1:
      // Handle "Privacy Policy" tap
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Clicked on ${_getNavItemLabel(index)}"),
            duration: Duration(seconds: 2),
          ),
        );
        break;
      case 2:
      // Handle "Help" tap
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Clicked on ${_getNavItemLabel(index)}"),
            duration: Duration(seconds: 2),
          ),
        );
        break;
      case 3:
      // Handle "Logout" tap
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()));
        break;
    }

  }
  String _getNavItemLabel(int index) {
    switch (index) {
      case 0:
        return "About";
      case 1:
        return "Privacy Policy";
      case 2:
        return "Help";
      case 3:
        return "Logout";
      default:
        return "";
    }
  }

  Future<List<UserData>> fetchUserData(String username) async {
    return await DatabaseHelper.instance.getUserDataByUsername(username);
  }
  Future<void> _syncData() async {
    final username = widget.username; // Replace with the current user's username
    final userDataList = await fetchUserData(username);

    // Prepare the userDataList to be sent to the API and synchronize data
    // Convert userDataList to a list of JSON maps
    final jsonDataList = userDataList.map((userData) => userData.toJson()).toList();
    // ... synchronization code

    synchronizeData(jsonDataList);
    //update offline db and remove data
    final syncedIds = userDataList.map((userData) => userData.id).toList();
    await DatabaseHelper.instance.markDataAsSynced(syncedIds);
    await DatabaseHelper.instance.removeSyncedData(syncedIds);
  }
  Future<void> synchronizeData(List<Map<String, dynamic>> jsonDataList) async {
    final apiUrl = "your_api_endpoint_here"; // Replace with your API endpoint

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonDataList,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Data synchronized successfully
    } else {
      // Handle synchronization error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset('assets/images/app_bar3.png'), // Replace with your image asset
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Outreach Reporting Form",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.settings, size: 28, color: Colors.white,),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 100, left: 16, right: 16), // Adjust the top padding as needed
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          crossAxisCount: 2,
                          childAspectRatio: 1, // Adjust the aspect ratio for smaller cards
                        ),
                        itemCount: gridItems.length, // Number of grid items
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: InkWell(
                              onTap: gridItems[index].onTap, // Use the onTap function from GridItem
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(gridItems[index].icon), // Use the icon from GridItem
                                  SizedBox(height: 4),
                                  Text(gridItems[index].name), // Use the name from GridItem
                                ],
                              ),
                            ),
                          );
                        },
                      )

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Color(0xFF2C3E50),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
            BottomNavigationBarItem(icon: Icon(Icons.lock), label: "Privacy Policy"),
            BottomNavigationBarItem(icon: Icon(Icons.help), label: "Help"),
            BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: "Logout"),
          ],
        ),
      ),
    );
  }

  static void handleDataListTap() {}
}
