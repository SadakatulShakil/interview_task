import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/HomeScreen.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();

}
class _LoginScreenState extends State<LoginScreen>{
  //NetworkCall networkCall = NetworkCall();
  String from  = 'login';
  String generateOtp  = '1234';
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  bool isOnline = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConnection();
  }
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar:  AppBar(
          backgroundColor: const Color(0x3FFFF00),
          elevation: 0,
          title: Text('',
              style: GoogleFonts.comfortaa(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w900)),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Image.asset("assets/images/icon.png", width: 250,),
                  ),
                  SizedBox(height: 16,),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      shadowColor: Colors.black54,
                      elevation: 8,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: TextField(
                                controller: mobileController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(),
                                    labelText: 'Your mobile no',labelStyle: GoogleFonts.comfortaa(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                                    hintText: 'Enter your mobile no',hintStyle: GoogleFonts.comfortaa(
                                  fontSize: 15,
                                )
                                ),
                                autofocus: false,
                              ),
                            ),
                            SizedBox(height: 12.0,),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',labelStyle: GoogleFonts.comfortaa(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                                    hintText: 'Enter a password',hintStyle: GoogleFonts.comfortaa(
                                  fontSize: 15,
                                )
                                ),
                                autofocus: false,
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: InkWell(
                      onTap: (){
                        checkInternetConnection();
                        //callDoctorLoginApi(mobileController.text, passwordController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFF256FD2)
                          ),
                          child: Center(
                            child: Text("Login", style: GoogleFonts.comfortaa(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){
                          checkInternetConnection();
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorRegistrationScreen()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Text("Do not register yet? Register", style:
                          GoogleFonts.comfortaa(color: const Color(0xFF256FD2),
                              fontWeight: FontWeight.w900),),
                        ),
                      )),
                ],
              ),
            ),
          ),
        )
    );
  }


  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        //message to show toast
        toastLength: Toast.LENGTH_LONG,
        //duration for message to show
        gravity: ToastGravity.CENTER,
        //where you want to show, top, bottom
        timeInSecForIosWeb: 1,
        //for iOS only
        textColor: Colors.white,
        //message text color
        fontSize: 16.0 //message font size
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