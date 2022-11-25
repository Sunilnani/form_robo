import 'package:flutter/material.dart';
import 'package:form_robo/components/buttons.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/dashBoard_screens/home_page.dart';
import 'package:form_robo/screens/fly_screens/fly_screen.dart';
import 'package:form_robo/screens/fly_screens/take_off_screen.dart';
import 'package:form_robo/screens/land_profile_screens/land_profiles.dart';




class DroneLandSuccessMessage extends StatefulWidget {
  final String title;
  final bool? isEmergency;
  final String ?image;
  final String ?messageType;
  final String ? description;
  final double ? imageHeight;
  final Widget? nextPage;
  final String ? btnTitle;
  const DroneLandSuccessMessage({Key? key, required this.title, this.description,this.isEmergency,
    this.nextPage, this.image, this.messageType,this.imageHeight, this.btnTitle}) : super(key: key);

  @override
  State<DroneLandSuccessMessage> createState() => _DroneLandSuccessMessageState();
}

class _DroneLandSuccessMessageState extends State<DroneLandSuccessMessage> {

  void splash(){
    Future.delayed(Duration(seconds: 2),(){
      NavigationService().navigatePage(TakeOffScreen(isEmergency: true,));

      // NavigationService().navigatePage(MessagePage(
      //   title: "Drone Connected Successfully",
      //   description:"Your drone was connected and redirecting to fly / action page.",
      //   nextPage:FlyScreen(),
      // ),replaceAll: true);


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

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: ThemeConfig.whiteColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                //Image.network("https://gifimage.net/wp-content/uploads/2017/10/drone-gif-4.gif",width: 180,),


               Container(
                 height: 50,
                 width: 50,
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Colors.green
                 ),
                 child:  Icon(Icons.check,size: 30,color: Colors.white,),
               ),


                //Image.asset("assets/images/${messageType ??'success'}.png", height: imageHeight ?? 250,),

                // const SizedBox(height: 30,),
                Text(widget.title, style:   TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: widget.messageType == "pending"? Theme.of(context).primaryColor: Colors.green
                ),),
                const SizedBox(height: 24,),
                if(widget.description!=null) Text("${widget.description}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,),

                const SizedBox(height: 30,),
                // AppElevatedButton(title: widget.btnTitle ?? "OKAY", onPress: (){
                //   //Navigator.push(context, MaterialPageRoute(builder: (context)=> nextPage),);
                //   NavigationService().navigatePage(
                //       widget.nextPage,replaceAll: true);
                // },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:form_robo/components/buttons.dart';
// import 'package:form_robo/components/navigation_service.dart';
// import 'package:form_robo/components/theme_config.dart';
// import 'package:form_robo/screens/fly_screens/take_off_screen.dart';
//
//
//
// class DroneLandSuccessMessage extends StatefulWidget {
//   final String title;
//
//   final String ?image;
//   final String ?messageType;
//   final String ? description;
//   final double ? imageHeight;
//   final Widget? nextPage;
//   final String ? btnTitle;
//   const DroneLandSuccessMessage({Key? key, required this.title, this.description, this.nextPage, this.image, this.messageType,this.imageHeight, this.btnTitle}) : super(key: key);
//
//   @override
//   State<DroneLandSuccessMessage> createState() => _DroneLandSuccessMessageState();
// }
//
// class _DroneLandSuccessMessageState extends State<DroneLandSuccessMessage> {
//   @override
//   Widget build(BuildContext context) {
//     void splash(){
//       Future.delayed(Duration(seconds: 4),(){
//         NavigationService().navigatePage(TakeOffScreen(isEmergency: true,));
//
//         // NavigationService().navigatePage(MessagePage(
//         //   title: "Drone Connected Successfully",
//         //   description:"Your drone was connected and redirecting to fly / action page.",
//         //   nextPage:FlyScreen(),
//         // ),replaceAll: true);
//
//
//       });
//     }
//
//     @override
//     void initState() {
//       // TODO: implement initState
//       super.initState();
//       splash();
//       // checkIsLoggedIn();
//     }
//
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(24),
//         color: ThemeConfig.whiteColor,
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: SingleChildScrollView(
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//
//                Container(
//                  height: 50,
//                  width: 50,
//                  alignment: Alignment.center,
//                  decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    color: Colors.green
//                  ),
//                  child:  Icon(Icons.check,size: 30,color: Colors.white,),
//                ),
//
//                 const SizedBox(height: 36,),
//                 Text(widget.title, style:   TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w500,
//                     color: widget.messageType == "pending"? ThemeConfig.orangeColor:  ThemeConfig.greenColor
//                 ),),
//                 const SizedBox(height: 24,),
//                 if(widget.description!=null) Text("${widget.description}",
//                   textAlign: TextAlign.center,
//                   style: ThemeConfig.textStyleHint,),
//
//                 const SizedBox(height: 36,),
//                 // AppElevatedButton(title: btnTitle ?? "Track Order", onPress: (){
//                 //   // Navigator.push(context, MaterialPageRoute(builder: (context)=> nextPage));
//                 //   NavigationService().navigatePage(nextPage);
//                 // },)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }