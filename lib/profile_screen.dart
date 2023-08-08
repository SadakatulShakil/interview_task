import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
// TODO: implement createState

}

class InitState extends State<ProfileScreen> {

  bool isOnline = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConnection();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return inItWidget();
  }

  Widget inItWidget() {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Colors.yellow,
      color: Colors.red,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 1500));
        setState(() {// api call for traders information
          checkInternetConnection();
        });
      },
      child: Scaffold(
        //backgroundColor: Colors.blue.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      height: MediaQuery.of(context).size.height / 3,
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/back_cover.jpg"),
                    ),
                    Positioned(
                        bottom: -50.0,
                        child: CircleAvatar(
                          backgroundColor:
                          Get.isDarkMode ? Colors.black : Color(0xFFFCFAFA),
                          radius: 80,
                          backgroundImage:
                          AssetImage("assets/images/user.jpeg"),
                        ))
                  ]),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 15),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE7EAEC),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 8),
                          child: const Icon(
                            Icons.edit,
                            color: Color(0xFF000000),
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 10, top: 8, bottom: 8),
                          child: Text('Edit',
                              style: GoogleFonts.comfortaa(
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w900,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,),
              Align(
                alignment: Alignment.centerLeft,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.settings_cell_outlined,
                          size: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            ' +8801751330394', style: GoogleFonts.comfortaa(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text('Name ',
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w900, fontSize: 12)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Sadakatu Ajam Md. Shakil',
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text('Email ',
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w900, fontSize: 12)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('sadakatulshakil94@gmail.com',
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text('Addresss ',
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w900, fontSize: 12)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Dhanmndi 5A, house # 75/G, Dhaka',
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 18, right: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF03BFD0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.center,
                      child:  Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.logout,
                              color: Colors.white,
                              size: 25,),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                ' Logout', style: GoogleFonts.comfortaa(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkInternetConnection() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      isOnline = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      isOnline = true;
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      // I am connected to a ethernet network.
      isOnline = true;
    } else if (connectivityResult == ConnectivityResult.vpn) {
      // I am connected to a vpn network.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
      isOnline = true;
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      // I am connected to a bluetooth.
      isOnline = true;
    } else if (connectivityResult == ConnectivityResult.other) {
      // I am connected to a network which is not in the above mentioned networks.
      isOnline = true;
    } else if (connectivityResult == ConnectivityResult.none) {
      // I am not connected to any network.
      isOnline = false;
      openAlertBox();
    }
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Warning",
                        style: TextStyle(fontSize: 24.0),
                      ),
                      Text("Check your internet connection")
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: InkWell(
                        onTap: (){
                          checkInternetConnection();
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "Understand",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
