import 'package:flutter/material.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/dashBoard_screens/widgets/droneconnectiong_screen.dart';
import 'package:form_robo/screens/fly_screens/fly_screen.dart';
import 'package:form_robo/screens/land_profile_screens/land_profiles.dart';
import 'package:form_robo/screens/settings_screen.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.isConnected}) : super(key: key);
  final bool? isConnected;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 // bool conncted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 2),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 40,
                right: 40,

                child: Image.asset(
                  'assets/images/drone.png',
                  width: 200,
                ),
              ),


              Positioned(
                top: 0,
                left: 0,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/Logo.png',
                      width: 80,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            NavigationService().navigatePage(LandProfiles());
                           // NavigationService().navigatePage(LandProfiles());
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>LandProfiles()));
                          },
                            child: Text("Land Profiles")),
                        SizedBox(width: 30,),
                        InkWell(
                          onTap: (){
                            NavigationService().navigatePage(SettingsPage());
                           // NavigationService().navigatePage(TestingPage());
                          },
                            child: Text("Settings")),

                      ],
                    )
                  ],
                ),
              ),


              Positioned(
                bottom: 80,
                right: 20,
                child:widget.isConnected == true ?  Row(
                  children: [
                    Image.asset("assets/images/connected.png",width: 30,),
                    SizedBox(width: 14,),
                    Text("Connected",style: ThemeConfig.textStyleGrey16,)
                  ],
                ): Row(
                  children: [
                    Image.asset("assets/images/disconnected.png",width: 30,),
                    SizedBox(width: 14,),
                    Text("Disconnected",style: ThemeConfig.textStyleGrey16,)
                  ],
                ),
              ),

              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child:widget.isConnected  == true ?

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Max. Speed",style: ThemeConfig.minimumStyleGrey,),
                        SizedBox(height: 4,),
                        Text("80 km/hr",style: ThemeConfig.primary14,)
                      ],
                    ),
                    ThemeConfig.divider,
                    Column(
                      children: [
                        Text("Fuel Consumption",style: ThemeConfig.minimumStyleGrey,),
                        SizedBox(height: 4,),
                        Text("2.2 L/km",style: ThemeConfig.primary14,)
                      ],
                    ),
                    ThemeConfig.divider,
                    Column(
                      children: [
                        Text("Fuel Left",style: ThemeConfig.minimumStyleGrey,),
                        SizedBox(height: 4,),
                        Text("30 %",style: ThemeConfig.primary14,)
                      ],
                    ),
                    ThemeConfig.divider,
                    Column(
                      children: [
                        Text("Range",style: ThemeConfig.minimumStyleGrey,),
                        SizedBox(height: 4,),
                        Text("200M",style: ThemeConfig.primary14,)
                      ],
                    ),
                    ThemeConfig.divider,
                    Column(
                      children: [
                        Text("Battery Status",style: ThemeConfig.minimumStyleGrey,),
                        SizedBox(height: 4,),
                        Text("80 %",style: ThemeConfig.primary14,)
                      ],
                    ),


                    InkWell(
                      onTap: (){
                        setState(() {
                          //conncted = !conncted;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FlyScreen()));
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => LandProfiles()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: ThemeConfig.primary
                        ),
                        child: Text("Start",style: ThemeConfig.textStylewhite16,),
                      ),
                    )
                    //     :
                    //
                    // InkWell(
                    //   onTap: (){
                    //     setState(() {
                    //       conncted = !conncted;
                    //     });
                    //     NavigationService().navigatePage(DroneConnection());
                    //     // Navigator.push(context, MaterialPageRoute(builder: (context) => DroneConnection()));
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 40),
                    //     alignment: Alignment.center,
                    //     height: 40,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(6),
                    //         color: ThemeConfig.primary
                    //     ),
                    //     child: Text("Connect",style: ThemeConfig.textStylewhite16,),
                    //   ),
                    // )
                  ],
                )  :

              DisconnectedParameters()


              )

            ],
          ),
        )
      ),
    );
  }
}


class DisconnectedParameters extends StatefulWidget {
  const DisconnectedParameters({Key? key}) : super(key: key);

  @override
  State<DisconnectedParameters> createState() => _DisconnectedParametersState();
}

class _DisconnectedParametersState extends State<DisconnectedParameters> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("Max. Speed",style: ThemeConfig.minimumStyleGrey,),
            SizedBox(height: 4,),
            Text("--",style: ThemeConfig.primary14,)
          ],
        ),
        ThemeConfig.divider,
        Column(
          children: [
            Text("Fuel Consumption",style: ThemeConfig.minimumStyleGrey,),
            SizedBox(height: 4,),
            Text("--",style: ThemeConfig.primary14,)
          ],
        ),
        ThemeConfig.divider,
        Column(
          children: [
            Text("Fuel Left",style: ThemeConfig.minimumStyleGrey,),
            SizedBox(height: 4,),
            Text("--",style: ThemeConfig.primary14,)
          ],
        ),
        ThemeConfig.divider,
        Column(
          children: [
            Text("Range",style: ThemeConfig.minimumStyleGrey,),
            SizedBox(height: 4,),
            Text("--",style: ThemeConfig.primary14,)
          ],
        ),
        ThemeConfig.divider,
        Column(
          children: [
            Text("Battery Status",style: ThemeConfig.minimumStyleGrey,),
            SizedBox(height: 4,),
            Text("--",style: ThemeConfig.primary14,)
          ],
        ),



        InkWell(
          onTap: (){
            setState(() {
              // conncted == true;
            });
            NavigationService().navigatePage(DroneConnection());
            // Navigator.push(context, MaterialPageRoute(builder: (context) => DroneConnection()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ThemeConfig.primary
            ),
            child: Text("Connect",style: ThemeConfig.textStylewhite16,),
          ),
        )
      ],
    );
  }
}
