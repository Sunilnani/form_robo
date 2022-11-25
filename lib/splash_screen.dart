import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/screens/dashBoard_screens/home_page.dart';
import 'package:form_robo/screens/authentication_screens/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // void checkIsLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   print("isLoggedIn $isLoggedIn");
  //   Widget page = const LoginPage();
  //   // if (isLoggedIn) {
  //   //   page = const HomePage();
  //   // }
  //   if (isLoggedIn) {
  //     page = const HomeBasePage();
  //   }
  //   Future.delayed(const Duration(seconds: 1), () {
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
  //         builder: (context) => page), (route) => false);
  //   });
  // }


  void splash(){
    Future.delayed(Duration(seconds: 2),(){
      NavigationService().navigatePage(HomePage());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash();
   // checkIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Image.asset(
          'assets/images/Logo.png',
          width: 200,
        ),
      ),
    );
  }
}
