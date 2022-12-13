import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/dashBoard_screens/widgets/droneconnectiong_screen.dart';
import 'package:form_robo/screens/fly_screens/widgets/drone_fly_connection.dart';
import 'package:form_robo/screens/land_profile_screens/land_profiles.dart';
import 'package:form_robo/screens/widgets/loading_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class FlyScreen extends StatefulWidget {
  const FlyScreen({Key? key , this.isConnect}) : super(key: key);
  final bool? isConnect;

  @override
  State<FlyScreen> createState() => _FlyScreenState();
}

class _FlyScreenState extends State<FlyScreen> {

  // GoogleMapController? _controller;
  // Location currentLocation = Location();
  // Set<Marker> _markers={};
  //
  // void getLocation() async{
  //   var location = await currentLocation.getLocation();
  //   currentLocation.onLocationChanged.listen((LocationData loc){
  //
  //     _controller?.animateCamera(CameraUpdate.newCameraPosition(
  //         new CameraPosition(
  //           target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
  //           zoom: 12.0,
  //         )));
  //     print(loc.latitude);
  //     print(loc.longitude);
  //     setState(() {
  //       _markers.add(Marker(markerId: MarkerId('Home'),
  //           position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
  //       ));
  //     });
  //   });
  // }



  int _selectedIndex = 0;





  // bool _selectedIndex = false;
  Color _color = Colors.transparent;


  bool isSelected = false;


  List<String>  list= ["name","extra","double"];



  // Timer? _timer;
  // int _start = 130;
  //
  // void startTimer() {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSec,
  //         (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }


  final Completer<GoogleMapController> _controller = Completer();


  List<LatLng> polygonsPoints = [
    LatLng(23.766315, 90.425778),
    LatLng(23.764691, 90.424767),
    LatLng(23.761916, 90.426862),
    LatLng(23.758532, 90.428588),
    LatLng(23.758825, 90.429228),
    LatLng(23.763698, 90.431324)
  ];

  BitmapDescriptor markerbitmap = BitmapDescriptor.defaultMarker;

  LatLng initialLocation = const LatLng(23.762912, 90.427816);

  void addCustomMarker() async{
    BitmapDescriptor.fromAssetImage(ImageConfiguration(),
      "",).then((markerIcon){
      setState(() {
        markerbitmap =  markerIcon;
      });
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
  void initState(){
    super.initState();
    setState(() {
      addCustomMarker();
      startTimer();
      //getLocation();
    });
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
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));


    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: initialLocation,
                    zoom: 15.6746
                ),
                onMapCreated: (controller){
                  _controller.complete(controller);
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,

                compassEnabled: true,
                // markers: {
                //   Marker(
                //       markerId: MarkerId("1"),
                //       position: initialLocation,
                //       icon:markerbitmap
                //   )
                // },
                zoomControlsEnabled: true,
                polygons: {
                  Polygon(
                      polygonId: PolygonId("1"),
                      points: polygonsPoints,
                      // fillColor: Color(0xFF006491).withOpacity(0.2),
                      // strokeWidth: 2
                      fillColor: Colors.redAccent.withOpacity(0.1),
                      // fillColor: Color(0xFF006491).withOpacity(0.2),
                      strokeWidth: 2,
                      strokeColor: Colors.red
                  ),
               }
            ),

            // GoogleMap(
            //   zoomControlsEnabled: false,
            //   initialCameraPosition:CameraPosition(
            //     target: LatLng(48.8561, 2.2930),
            //     zoom: 12.0,
            //   ),
            //   myLocationButtonEnabled: true,
            //   onMapCreated: (GoogleMapController controller){
            //     _controller = controller;
            //   },
            //   markers: _markers,
            // ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: 14,vertical: 0),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [

                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius:  10,
                        spreadRadius: 2)
                  ],


                ),
                child:SignalParametersCard(),
              )
            ),

            Positioned(
              top: 80,
                left: 10,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.25,
                      width: MediaQuery.of(context).size.width*0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: [

                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius:  10,
                              spreadRadius: 2)
                        ],
                      ),
                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Wheat Field",style: ThemeConfig.Large14Black,),
                                  SizedBox(height: 6,),

                                  Row(
                                    children: [
                                      Text("Land Size  -  ",style: ThemeConfig.minimumStyleGrey,),
                                      SizedBox(height: 4,),
                                      Text("5 acrs",style: ThemeConfig.red14,)
                                    ],
                                  ),
                                  SizedBox(height: 6,),

                                  Row(
                                    children: [
                                      Text("Total Time  -  ",style: ThemeConfig.minimumStyleGrey,),
                                      SizedBox(height: 4,),
                                      Text("20 min",style: ThemeConfig.red14,)
                                    ],
                                  ),
                                  SizedBox(height: 14,),
                                  // InkWell(
                                  //   onTap: (){
                                  //     NavigationService().navigatePage(LandProfiles());
                                  //   },
                                  //   child: Row(
                                  //
                                  //     children: [
                                  //       SizedBox(width: 40,),
                                  //       Icon(FontAwesomeIcons.handPointer,size: 12,color: Colors.grey,),
                                  //       SizedBox(width: 4,),
                                  //       Text("Tap here to change the plan",style: ThemeConfig.Medium12grey,)
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                              Container(
                                alignment: Alignment.topCenter,

                                // height: 110,
                                // width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),

                                ),
                                child: Image.asset("assets/images/wheat.png",width: 80,),
                              ),
                            ],
                          ),
                          SizedBox(height: 6,),
                          InkWell(
                            onTap: (){
                              NavigationService().navigatePage(LandProfiles());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Icon(FontAwesomeIcons.handPointer,size: 12,color: Colors.grey,),
                                SizedBox(width: 4,),
                                Text("Tap here to change the plan",style: ThemeConfig.Medium12grey,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: [

                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius:  10,
                              spreadRadius: 2)
                        ],
                      ),
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Timer ",style: ThemeConfig.minimumStyleGrey,),
                          SizedBox(width: 10,),
                          Icon(Icons.access_time,color: Colors.red,size: 30,),
                          SizedBox(width: 10,),
                          Text(
                            '$hours:$minutes:$seconds',
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
                    ),

                  ],
                )
            ),


            // Positioned(
            //     top: 80,
            //     right: 20,
            //     child: Column(
            //       children: [
            //         Container(
            //           padding: EdgeInsets.only(bottom: 14,top: 8),
            //           height: MediaQuery.of(context).size.height*0.32,
            //           width: MediaQuery.of(context).size.width*0.068,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(6),
            //             color: Colors.white,
            //             boxShadow: [
            //
            //               BoxShadow(
            //                   color: Colors.black.withOpacity(0.2),
            //                   blurRadius:  10,
            //                   spreadRadius: 2)
            //             ],
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Icon(Icons.add,color: Colors.black,size: 30,),
            //               Icon(Icons.minimize_outlined,color: Colors.black,size: 30,),
            //
            //             ],
            //           ),
            //         ),
            //         SizedBox(height: 20,),
            //         Container(
            //           padding: EdgeInsets.only(bottom: 14,top: 8),
            //           height: MediaQuery.of(context).size.height*0.32,
            //           width: MediaQuery.of(context).size.width*0.068,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(6),
            //             color: Colors.white,
            //             boxShadow: [
            //
            //               BoxShadow(
            //                   color: Colors.black.withOpacity(0.2),
            //                   blurRadius:  10,
            //                   spreadRadius: 2)
            //             ],
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Icon(Icons.add,color: Colors.black,size: 30,),
            //               Icon(Icons.minimize_outlined,color: Colors.black,size: 30,),
            //
            //             ],
            //           ),
            //         )
            //       ],
            //     )
            // ),

            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      width: MediaQuery.of(context).size.width*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius:  10,
                              spreadRadius: 2)
                        ],


                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Altitude",style: ThemeConfig.minimumStyleGrey,),
                              SizedBox(height: 4,),
                              Text("4.3 km/hr",style: ThemeConfig.primary14,)
                            ],
                          ),
                          ThemeConfig.divider,
                          Column(
                            children: [
                              Text("Drone Speed",style: ThemeConfig.minimumStyleGrey,),
                              SizedBox(height: 4,),
                              Text("40 km/hr",style: ThemeConfig.primary14,)
                            ],
                          ),
                          ThemeConfig.divider,
                          Column(
                            children: [
                              Text("Distance",style: ThemeConfig.minimumStyleGrey,),
                              // SizedBox(height: 4,),
                              Row(
                                children: [

                                  Image.asset("assets/images/distance.png",width: 34,),
                                  Text("280 M",style: ThemeConfig.primary14,)
                                ],
                              )
                            ],
                          ),
                          ThemeConfig.divider,
                          Column(
                            children: [
                              Text("Fuel Level",style: ThemeConfig.minimumStyleGrey,),
                              // SizedBox(height: 4,),
                              Row(
                                children: [
                                  Image.asset("assets/images/fuel.png",width: 34,),
                                  Text("50 %",style: ThemeConfig.primary14,)
                                ],
                              )
                            ],
                          ),
                          ThemeConfig.divider,
                          Column(
                            children: [
                              Text("Fertilizer Level",style: ThemeConfig.minimumStyleGrey,),
                              SizedBox(height: 4,),
                              Text("80 %",style: ThemeConfig.primary14,)
                            ],
                          ),


                        ],
                      ),
                    ),
                    // InkWell(
                    //   onTap: (){
                    //     _sortbyForm();
                    //    // startTimer();
                    //     //Navigator.push(context, MaterialPageRoute(builder: (context) => LandProfiles()));
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 20),
                    //     alignment: Alignment.center,
                    //     height: 40,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(6),
                    //         color: ThemeConfig.redColor
                    //     ),
                    //     child: Text("Emergency Landing",style: ThemeConfig.textStyleWhite14,),
                    //   ),
                    // ),

                    widget.isConnect == false ?


                    InkWell(
                      onTap: (){
                       // startTimer();
                        NavigationService().navigatePage(DroneFlyConnection());
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
                    ) :

                    InkWell(
                      onTap: (){
                        startTimer();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: ThemeConfig.primary
                        ),
                        child: Text("Fly",style: ThemeConfig.textStylewhite16,),
                      ),
                    )
                  ],
                )
            )

          ],
        ),
      ),
    );
  }
  _sortbyForm(){

    return  showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          int selectedRadio = 0;
          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List<Widget>.generate(1, (int index) {
                    return Text("Do you want to land the drone");
                  }),
                );
              },
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  //Navigator.of(ctx).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  color: Theme.of(context).highlightColor,
                  padding: const EdgeInsets.all(14),
                  child: const Text("No"),
                ),
              ),
              TextButton(
                onPressed: () {
                  //Navigator.of(ctx).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  color: Theme.of(context).secondaryHeaderColor,
                  padding: const EdgeInsets.all(14),
                  child: const Text("Yes"),
                ),
              ),
            ],
          );
        });
  }
}

class SignalParametersCard extends StatelessWidget {
  const SignalParametersCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            NavigationService().pop();
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_outlined,size: 18,),
              SizedBox(width: 4,),
              Text("Back")
            ],
          ),
        ),


        // Row(
        //  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //
        //     InkWell(
        //       onTap: (){
        //         NavigationService().pop();
        //       },
        //       child: Row(
        //         children: [
        //           Icon(Icons.arrow_back,size: 24,),
        //           SizedBox(width: 4,),
        //           Text("Back")
        //         ],
        //       ),
        //     ),
        //     SizedBox(width: 14,),
        //
        //     Row(
        //       children: [
        //         Icon(Icons.arrow_upward,size: 24,),
        //         Text("V.S",style: ThemeConfig.minimumStyleGrey,),
        //         SizedBox(width: 4,),
        //         Text("1.5 MS/S",style: ThemeConfig.primary14,)
        //       ],
        //     ),
        //     SizedBox(width: 6,),
        //     Container(
        //       height: 30,
        //       width: 2,
        //       color: Colors.grey.shade300,
        //     ),
        //     SizedBox(width: 6,),
        //     Row(
        //       children: [
        //         Icon(Icons.arrow_back,size: 24,),
        //         Text("H.S",style: ThemeConfig.minimumStyleGrey,),
        //         SizedBox(width: 4,),
        //         Text("2.2 M/Sec",style: ThemeConfig.primary14,)
        //       ],
        //     ),
        //     SizedBox(width: 6,),
        //     Container(
        //       height: 30,
        //       width: 2,
        //       color: Colors.grey.shade300,
        //     ),
        //     SizedBox(width: 6,),
        //     Row(
        //       children: [
        //         Text("D",style: ThemeConfig.minimumStyleGrey,),
        //         SizedBox(width: 4,),
        //         Text("928 ft",style: ThemeConfig.primary14,)
        //       ],
        //     ),
        //     SizedBox(width: 6,),
        //     Container(
        //       height: 30,
        //       width: 2,
        //       color: Colors.grey.shade300,
        //     ),
        //     SizedBox(width: 6,),
        //     Row(
        //       children: [
        //         Text("H",style: ThemeConfig.minimumStyleGrey,),
        //         SizedBox(width: 4,),
        //         Text("200 ft",style: ThemeConfig.primary14,)
        //       ],
        //     ),
        //
        //
        //
        //   ],
        // ),

        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Transmitter Signal",style: ThemeConfig.minimumStyleGrey12,),
                // SizedBox(height: 4,),
                Row(
                  children: [
                    Image.asset("assets/images/transmitter_signal.png",color: Theme.of(context).primaryColor,width: 34,),
                    // Icon(FontAwesomeIcons.robot,color: Theme.of(context).primaryColor,size: 16,),
                    // SizedBox(width: 10,),
                    Icon(FontAwesomeIcons.signal,color: Theme.of(context).primaryColor,size: 12,),

                  ],
                )
              ],
            ),
            SizedBox(width: 8,),
            Container(
              height: 40,
              width: 2,
              color: Colors.grey.shade300,
            ),
            SizedBox(width: 8,),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Telemetry Signal",style: ThemeConfig.minimumStyleGrey12,),
               // SizedBox(height: 4,),
                Row(
                  children: [
                    // Icon(FontAwesomeIcons.dragon,color: Theme.of(context).primaryColor,size: 16,),
                    // SizedBox(width: 10,),
                    Image.asset("assets/images/telemetry.png",color: Theme.of(context).primaryColor,width:48,),
                    Icon(FontAwesomeIcons.signal,color: Theme.of(context).primaryColor,size: 12,),

                  ],
                )
              ],
            ),

            SizedBox(width: 8,),
            Container(
              height: 40,
              width: 2,
              color: Colors.grey.shade300,
            ),
            SizedBox(width: 8,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Transmitter Battery",style: ThemeConfig.minimumStyleGrey12,),
               // SizedBox(height: 4,),
                Row(
                  children: [
                    // Icon(FontAwesomeIcons.batteryHalf,color: Theme.of(context).primaryColor,size: 14,),
                    // SizedBox(width: 10,),
                    Image.asset("assets/images/battery.png",color: Theme.of(context).primaryColor,width: 34,),
                    Text("89 %",style: ThemeConfig.Medium14grey,)
                  ],
                )
              ],
            ),

            SizedBox(width: 8,),
            Container(
              height: 40,
              width: 2,
              color: Colors.grey.shade300,
            ),
            SizedBox(width: 8,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Brightness",style: ThemeConfig.minimumStyleGrey12,),
               // SizedBox(height: 4,),
                Row(
                  children: [
                    // Icon(FontAwesomeIcons.solidSun,color: Colors.grey,size: 14,),
                    // SizedBox(width: 10,),
                    Image.asset("assets/images/brightness.png",color: Theme.of(context).primaryColor,width: 34,),
                    Text("89 %",style: ThemeConfig.Medium14grey,)
                  ],
                )
              ],
            ),

            SizedBox(width: 8,),
            Container(
              height: 40,
              width: 2,
              color: Colors.grey.shade300,
            ),
            SizedBox(width: 8,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                    width: 60,
                    child: Text("Calibration Settings",style: ThemeConfig.minimumStyleGrey12,)),
                 SizedBox(width: 2,),
                Image.asset("assets/images/calibration.png",width: 26,),
                // SizedBox(height: 4,),

              ],
            ),


          //  Icon(Icons.settings,color: Theme.of(context).primaryColor,size: 20,)


          ],
        )
      ],
    );
  }
}
