import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/demo_traders_model.dart';
import 'package:task/profile_screen.dart';

import 'demo_traders_data.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<HomeScreen> {
  //List<Member> memberList = Utils.getDataCollection();
  double value = 0;
  String patientName='';
  String token='';
  bool isOnline = false;
  @override
  void initState() {
    super.initState();
    //getSharedData();
    checkInternetConnection();
  }

  @override
  Widget build(BuildContext context) {
    List<DemoTradersModel> tradersList = AllDemoTradersData;
    return initWidget(context, tradersList);
  }

  Widget initWidget(BuildContext context, List<DemoTradersModel> tradersList) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF256FD2),
          leading: IconButton(
            icon: Icon(Icons.widgets, color: Colors.white),
            onPressed: (){

            },
          ),
          title: Column(
            children: [
              Text(
                  "Welcome,"+" Mr. Jhon",
                  style: GoogleFonts.comfortaa(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w900,
                      fontSize: 14)),
              Text(
                  "Contact:,"+" ********456",
                  style: GoogleFonts.comfortaa(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w900,
                      fontSize: 12)),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(icon: Icon(Icons.person_rounded), onPressed: () {
                checkInternetConnection();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              }),
            ),

          ],
          centerTitle: false,
        ),
        body: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, bottom: 8, top: 10),
                  child: Text("Traders: "),
                )),
            SizedBox(height: 10,),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: ListView.builder(
                      itemCount: tradersList.length,
                      itemBuilder: (context, index) {
                        final mTradersData = tradersList[index];

                        return buildTradersList(mTradersData);
                      })),
            ),
          ],
        )
      ),
    );



  // void getSharedData() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   patientName = prefs.getString('PATIENT_NAME')!;
  //   token = prefs.getString('TOKEN')!;
  //   setState(() {
  //
  //   });
  // }

}

  Widget buildTradersList(DemoTradersModel mTradersData) {
    return InkWell(
      onTap: (){
        // print(mHospital.name+'///'+mHospital.location);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LabTestBooking(mPathologyData, from)));
      },
      child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      mTradersData.image, width: 50, height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 5.0, bottom: 5.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/1.5,
                            child: Text(mTradersData.name,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.comfortaa(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w900,),),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                child: Text("Invest: "+mTradersData.profit,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,),),
                              ),
                              SizedBox(width: 15,),
                              Container(
                                child: Text("Profit: "+mTradersData.profit,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
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
