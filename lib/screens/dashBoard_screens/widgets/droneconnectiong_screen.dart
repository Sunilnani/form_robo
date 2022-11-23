import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_robo/components/message_screen.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/dashBoard_screens/home_page.dart';
import 'package:form_robo/screens/dashBoard_screens/widgets/drone_message_screen.dart';
import 'package:form_robo/screens/fly_screens/fly_screen.dart';

class DroneConnection extends StatefulWidget {
  const DroneConnection({Key? key}) : super(key: key);

  @override
  State<DroneConnection> createState() => _DroneConnectionState();
}

class _DroneConnectionState extends State<DroneConnection> {

  void splash(){
    Future.delayed(Duration(seconds: 10),(){
      //NavigationService().navigatePage(FlyScreen());

      NavigationService().navigatePage(DroneMessagePage(
        title: "Drone Connected Successfully",
        description:"Your drone was connected and redirecting to fly / action page.",
        // nextPage:HomePage(),
      ));


    });
  }

  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash();
    startTimer();
    // checkIsLoggedIn();
  }
  @override
  void dispose() {
    //_timer!.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    // final hours = strDigits(myDuration.inHours.remainder(1));
    // final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(20));


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              child:
              Image.asset(
                "assets/images/drone-flying.gif",
                height: 175.0,
                width: 175.0,
              ),
             // Image.network("https://gifimage.net/wp-content/uploads/2017/10/drone-gif-4.gif",width: 180,),
            ),

            Text("Connecting to Drone....!",style: TextStyle(fontSize: 20,color:Theme.of(context).primaryColor),),
            SizedBox(height: 10,),
            Text("Your Drone was disconnected check the device properly",style: ThemeConfig.textStyleGrey14,),


            SizedBox(height: 10,),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //
            //     Icon(Icons.access_time,color: Colors.red,size: 30,),
            //     SizedBox(width: 10,),
            //     // Text(
            //     //   '$seconds',
            //     //   style: TextStyle(
            //     //       fontWeight: FontWeight.bold,
            //     //       color: Colors.red,
            //     //       fontSize: 30),
            //     // ),
            //     Text(
            //       '$seconds',
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Colors.red,
            //           fontSize: 30),
            //     ),
            //     SizedBox(height: 20),
            //
            //
            //   ],
            // ),

          ],
        ),
      ),
    );
  }
}
