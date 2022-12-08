import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_robo/components/app_custom_card.dart';
import 'package:form_robo/components/buttons.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/dashBoard_screens/home_page.dart';
import 'package:form_robo/screens/land_profile_screens/add_land_profile.dart';
import 'package:form_robo/screens/fly_screens/fly_screen.dart';
import 'package:form_robo/screens/settings_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class LandProfiles extends StatefulWidget {
  const LandProfiles({Key? key}) : super(key: key);

  @override
  State<LandProfiles> createState() => _LandProfilesState();
}

class _LandProfilesState extends State<LandProfiles> {


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
  //       target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
  //       zoom: 12.0,
  //     )));
  //     print(loc.latitude);
  //     print(loc.longitude);
  //     setState(() {
  //       _markers.add(Marker(markerId: MarkerId('Home'),
  //           position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
  //       ));
  //     });
  //   });
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

  int _selectedIndex = 0;

 // bool _selectedIndex = false;
  Color _color = Colors.transparent;


  bool isSelected = false;


  bool? isconnect = false;


  List<String>  list= ["name","extra","double"];

  @override
  void initState(){
    super.initState();
    setState(() {
      //getLocation();
       addCustomMarker();
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: ThemeConfig.whiteColor,
        iconTheme: IconThemeData(color: ThemeConfig.primary),
        // leadingWidth: 10,
        leading: InkWell(
          onTap: (){
            NavigationService().navigatePage(HomePage(),replace: true);
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back,size: 24,),

            ],
          ),
        ),
        title: Text(
          "Land Profiles",
          overflow: TextOverflow.visible,
          softWrap: true,
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600, color: ThemeConfig.primary),),


        actions: [

          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Center(
                child:  InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddLandProfile()));
                  },
                  child: Text("Add New Profile",style: ThemeConfig.redColor14,),
                  // child: Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   alignment: Alignment.center,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(6),
                  //       color: ThemeConfig.primary
                  //   ),
                  //   child: Text("Add New Profile",style: ThemeConfig.textStylewhite16,),
                  // ),
                )
            ),
          ),


          IconButton(
              onPressed: (){
                NavigationService().navigatePage(SettingsPage());
              },
              icon: Icon(FontAwesomeIcons.gear,size: 18,)
          ),
          const SizedBox(width: 6,),
        ],
      ),
      body:
    Stack(
      children: [

      GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: initialLocation,
                    zoom: 15.6746
                  ),
                  onMapCreated: (controller){
                    _controller.complete(controller);
                  },

                  // markers: {
                  //   Marker(
                  //     markerId: MarkerId("1"),
                  //     position: initialLocation,
                  //     icon:markerbitmap
                  //   )
                  // },

                  polygons: {
                    Polygon(
                        polygonId: PolygonId("1"),
                        points: polygonsPoints,
                      fillColor: Color(0xFF006491).withOpacity(0.2),
                      strokeWidth: 2
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
          left: 10,
          child: Container(
            height: MediaQuery.of(context).size.height*0.85,
            width: MediaQuery.of(context).size.width*0.45,
            child: ListView.separated(
              //shrinkWrap: true,
              itemCount: 5,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {

               // orderId = notifications!.orders![index].id;

                return InkWell(
                  onTap: (){

                    setState(() {
                     // isSelected = !isSelected;
                      _selectedIndex = index;
                      print("---------------------------> index ${_selectedIndex}");

                    });

                    },

                    child: AppCustomCard(
                      borderColor:_selectedIndex == index ?  Colors.red : Colors.transparent,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),

                                  ),
                                  child: Image.asset("assets/images/wheat.png",width: 80,),
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Profile Name",style: ThemeConfig.minimumStyleGrey,),
                                    SizedBox(height: 4,),
                                    Text("Land Profile 1",style: ThemeConfig.Large16Black,),
                                    SizedBox(height: 4,),
                                    Text("Crop type -  Wheat",style: ThemeConfig.Large14Black,),
                                    SizedBox(height: 4,),
                                  ],
                                )
                              ],
                            ),

                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("Flying Height",style: ThemeConfig.minimumStyleGrey,),
                                    SizedBox(height: 4,),
                                    Text("80 m",style: ThemeConfig.primary14,)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 40,
                                  width: 2,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  children: [
                                    Text("Moving Speed",style: ThemeConfig.minimumStyleGrey,),
                                    SizedBox(height: 4,),
                                    Text("0.6 km/km",style: ThemeConfig.primary14,)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 40,
                                  width: 2,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  children: [
                                    Text("Spraying Speed",style: ThemeConfig.minimumStyleGrey,),
                                    SizedBox(height: 4,),
                                    Text("Fast",style: ThemeConfig.primary14,)
                                  ],
                                ),


                              ],
                            )

                          ],
                        )
                    )
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 0);
              },
            ),
          ),
        ),
        
        
        Positioned(
          bottom: 20,
          right:20,
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LandProfiles()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: ThemeConfig.primary)
                  ),
                  child: Text("Edit Profile",style: ThemeConfig.textStylePrimary16,),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FlyScreen(isConnect: false,)));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: ThemeConfig.primary
                  ),
                  child: Text("Continue",style: ThemeConfig.textStylewhite16,),
                ),
              )
            ],
          )
        )

      ],
    ),
    );
  }
}


class LandProfileCard extends StatelessWidget {
  const LandProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCustomCard(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.asset("assets/images/wheat.png",width: 80,),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profile Name",style: ThemeConfig.minimumStyleGrey,),
                    SizedBox(height: 4,),
                    Text("Land Profile 1",style: ThemeConfig.Large16Black,),
                    SizedBox(height: 4,),
                    Text("Crop type -  Wheat",style: ThemeConfig.Large14Black,),
                    SizedBox(height: 4,),
                  ],
                )
              ],
            ),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Flying Height",style: ThemeConfig.minimumStyleGrey,),
                    SizedBox(height: 4,),
                    Text("80 m",style: ThemeConfig.primary14,)
                  ],
                ),
                SizedBox(width: 10,),
                Container(
                  height: 40,
                  width: 2,
                  color: Colors.grey,
                ),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Text("Moving Speed",style: ThemeConfig.minimumStyleGrey,),
                    SizedBox(height: 4,),
                    Text("0.6 km/km",style: ThemeConfig.primary14,)
                  ],
                ),
                SizedBox(width: 10,),
                Container(
                  height: 40,
                  width: 2,
                  color: Colors.grey,
                ),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Text("Spraying Speed",style: ThemeConfig.minimumStyleGrey,),
                    SizedBox(height: 4,),
                    Text("Fast",style: ThemeConfig.primary14,)
                  ],
                ),


              ],
            )

          ],
        )
    );
  }
}
