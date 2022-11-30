import 'package:flutter/material.dart';
import 'package:form_robo/components/buttons.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/fly_screens/fly_screen.dart';


class HomeReturnMessagePage extends StatefulWidget {
  final String title;
  final String ?image;
  final String ?messageType;
  final String ? description;
  final double ? imageHeight;
  final Widget nextPage;
  final String ? btnTitle;
  const HomeReturnMessagePage({Key? key, required this.title, this.description,required this.nextPage, this.image, this.messageType,this.imageHeight, this.btnTitle}) : super(key: key);

  @override
  State<HomeReturnMessagePage> createState() => _HomeReturnMessagePageState();
}

class _HomeReturnMessagePageState extends State<HomeReturnMessagePage> {
  void splash(){
    Future.delayed(Duration(seconds: 4),(){
      NavigationService().navigatePage(FlyScreen(),replace: true);

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
                Image.asset(
                  "assets/images/drone-flying.gif",
                  height: 155.0,
                  width: 135.0,
                ),

                Text(widget.title, style:   TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: widget.messageType == "pending"? Theme.of(context).primaryColor:  Theme.of(context).primaryColor
                ),),
                const SizedBox(height: 24,),
                if(widget.description!=null) Text("${widget.description}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,),

                const SizedBox(height: 36,),
                // AppElevatedButton(title: btnTitle ?? "Track Order", onPress: (){
                //   //Navigator.push(context, MaterialPageRoute(builder: (context)=> nextPage),);
                //   NavigationService().navigatePage(nextPage,replaceAll: true);
                // },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}