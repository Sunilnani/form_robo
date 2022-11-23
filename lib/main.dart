import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/screens/dashBoard_screens/home_page.dart';
import 'package:form_robo/splash_screen.dart';


import 'components/theme_provider.dart';


// void main() {
//   /// Refrence
//   /// https://stackoverflow.com/questions/50322054/flutter-how-to-set-and-lock-screen-orientation-on-demand
//
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([]).then((_)=>runApp(const MyApp()));
//   // runApp(const MyApp());
// }

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
 // Provider.debugCheckInvalidValueType = null;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

  runApp(
    MyApp()
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => UserNotifier()),
    //
    //   ],
    //   child: MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeProvider.appTheme,

      // theme: ThemeData(
      //   // Define the default brightness and colors.
      //   brightness: Brightness.light,
      //   //primaryColor: Colors.lightBlue[800],

      //   // Define the default font family.
      //   fontFamily: 'Inter',


      //   // Define the default `TextTheme`. Use this to specify the default
      //   // text styling for headlines, titles, bodies of text, and more.
      //   textTheme: const TextTheme(
      //     headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      //     headline6: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal,fontWeight: FontWeight.w600),
      //     bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind',fontWeight: FontWeight.w600,),
      //   ),
      // ),
      navigatorObservers: [
        NavigationService.routeObserver,
      ],
      navigatorKey: NavigationService.navigatorKey,
      home:const SplashScreen(),
    );
  }
}





