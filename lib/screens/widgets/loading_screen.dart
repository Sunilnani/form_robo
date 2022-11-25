import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_robo/components/message_screen.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/fly_screens/fly_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void splash(){
    Future.delayed(Duration(seconds: 10),(){
      //NavigationService().navigatePage(FlyScreen());

      NavigationService().navigatePage(MessagePage(
        title: "Drone Connected Successfully",
        description:"Your drone was connected and redirecting to fly / action page.",
       // nextPage:FlyScreen(),
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
    final seconds = strDigits(myDuration.inSeconds.remainder(10));


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
               //Image.network("https://gifimage.net/wp-content/uploads/2017/10/drone-gif-4.gif",width: 180,),
            ),

            Text("Drone Preparing to TakeOff",style: TextStyle(fontSize: 20,color: Colors.green),),
            SizedBox(height: 10,),
            Text("You have only 10 sec Time to stop this takeoff",style: ThemeConfig.textStyleGrey14,),
            SizedBox(height: 10,),
            Text("If not you are allowing the drone to take off",style: ThemeConfig.textStyleGrey14,),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Icon(Icons.access_time,color: Colors.red,size: 30,),
                SizedBox(width: 10,),
                // Text(
                //   '$seconds',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.red,
                //       fontSize: 30),
                // ),
                Text(
                  '$seconds',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 30),
                ),
                SizedBox(height: 20),

                // ElevatedButton(
                //   onPressed: startTimer,
                //   child: Text(
                //     'Start',
                //     style: TextStyle(
                //       fontSize: 30,
                //     ),
                //   ),
                // ),


                // Text("$_start sec",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w600),)

              ],
            ),

            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                //startTimer();
                Navigator.push(context, MaterialPageRoute(builder: (context) => FlyScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                alignment: Alignment.center,
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: ThemeConfig.primary
                ),
                child: Text("STOP",style: ThemeConfig.textStylewhite16,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
