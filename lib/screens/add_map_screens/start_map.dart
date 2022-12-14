import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_robo/components/location_service.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/add_map_screens/add_map_screen.dart';
import 'package:form_robo/screens/land_profile_screens/add_land_profile.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StartMap extends StatefulWidget {
  const StartMap({Key? key, this.selectedMap}) : super(key: key);
  final int? selectedMap;

  @override
  State<StartMap> createState() => _StartMapState();
}

class _StartMapState extends State<StartMap> {




  List<String> mapTypeList=["Normal","Satellite",];

  String? selected_map_type;


  int _selectedMapIndex = 0;


  String? _currentAddress;
   Position? _currentPosition;
  String? street;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }





  GoogleMapController? mapController;
  late BitmapDescriptor pinLocationIcon;
  Marker? centerMapMarker;
  LatLng _center = const LatLng(45.521563, -122.677433);
  List<Marker> markersList = [];



  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  //   fetchLocation();
  // }

  double longtitude1=0.0;
  var addresses;
  var first;

  String? placeName;



  Future<void> fetchLocation() async {
    final locationData = await locationService.getLocation();
    if (locationData != null) {
      _center = LatLng(locationData.latitude!, locationData.longitude!);

      // await mapController?.moveCamera(CameraUpdate.newLatLng(_center));
      await mapController?.moveCamera(CameraUpdate.newLatLng(_center));
      print("latitude ----------${_center.latitude}");

      longtitude1=_center.longitude;
      print(longtitude1);

      final hasPermission = await _handleLocationPermission();

      // if (!hasPermission) return;
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        setState(() => _currentPosition = position);
        //_getAddressFromLatLng(_currentPosition!);
      }).catchError((e) {
        debugPrint(e);
      });


      setState(() {
        centerMapMarker = Marker(
          icon: pinLocationIcon,
          markerId: const MarkerId("center"),
         position: LatLng(_currentPosition!.latitude,_currentPosition!.longitude)
         // position: _center,
        );
      });
    } else {
      setState(() {
        _center = const LatLng(-1.286389, 36.817223);
        centerMapMarker = Marker(
          //icon: pinLocationIcon,
          markerId: const MarkerId("center"),
          position: LatLng(_currentPosition!.latitude,_currentPosition!.longitude),
        );
      });
    }
  }



  String googleApikey = "AIzaSyCFEWdWZjvchlSATLDN7v5qxKoInUmJPFU";
  //GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Location";



  Future<void> setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5,),
        'assets/images/live_location.png');
  }






  @override
  void initState() {
    super.initState();

    setCustomMapPin();

    fetchLocation();


  }

  @override
  void dispose() {


    super.dispose();
  }

  // LatLng initialLocation = const LatLng(17.123184, 79.208824);
  LatLng initialLocation = const LatLng(17.123184, 79.208824);

  final Completer<GoogleMapController> _controller = Completer();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child:
        _currentPosition == null ?
        Center(
          child: Image.asset("assets/images/drone-flying.gif",
          //   height: 125.0,
          // width: 125.0,
        ),
        )
            :

       // _currentPosition == null ? const CircularProgressIndicator(color: Colors.red,):
        Stack(
          children: [
            //
            // _currentPosition == null ? const CircularProgressIndicator(color: Colors.red,):

            Container(
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(_currentPosition!.latitude,_currentPosition!.longitude),
                      zoom: 15.6746
                  ),
                  onMapCreated: (controller){
                    _controller.complete(controller);
                  },
               // markers: {centerMapMarker!, ...markersList},
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,


              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Icon(FontAwesomeIcons.handPointer,size: 22,color: Colors.grey,),

                  SizedBox(height: 10,),
                  widget.selectedMap == 0 ?
                  Container(
                      width: MediaQuery.of(context).size.width*0.35,
                      child: Text("click on start button to add map boundaries with GPS in Auto Mode",style: ThemeConfig.Medium14,textAlign: TextAlign.center,)):
                  Container(
                      width: MediaQuery.of(context).size.width*0.35,
                      child: Text("click on start button to add map boundaries with GPS in Manual Mode",style: ThemeConfig.Medium14,textAlign: TextAlign.center,)),

                ],
              ),
            ),



            // GoogleMap(
            //   zoomControlsEnabled: true,
            //   //zoomGesturesEnabled: true,
            //   onMapCreated: _onMapCreated,
            //   initialCameraPosition: const CameraPosition(
            //     target: LatLng(-1.286389, 36.817223),
            //     zoom: 10,
            //   ),
            //   onCameraMoveStarted: () {
            //     print("started");
            //   },
            //   myLocationEnabled: true,
            //   onCameraIdle: () {
            //     print("idle");
            //
            //   },
            //   // onCameraMove: (position) {
            //   //
            //   //
            //   //   setState(() async{
            //   //     _getCurrentPosition();
            //   //     // _center = position.target;
            //   //     // _center = position.target;
            //   //     centerMapMarker = centerMapMarker!.copyWith(
            //   //       positionParam: position.target,
            //   //     );
            //   //     //
            //   //     // List<Placemark> placemarks = await placemarkFromCoordinates(_center.latitude, _center.longitude);
            //   //     // placeName = placemarks.first.administrativeArea.toString() + ", " +  placemarks.first.street.toString();
            //   //   });
            //   // },
            //  // markers: {centerMapMarker!, ...markersList},
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
                          blurRadius:  6,
                          spreadRadius: 2)
                    ],


                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              NavigationService().pop();
                              // NavigationService().navigatePage(HomePage(),replace: true);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios_outlined,size: 18,),
                                SizedBox(width: 4,),
                                Text("Back"),


                              ],
                            ),
                          ),


                        ],
                      ),
                      Text(
                        "Add Map Boundaries",
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600, color: ThemeConfig.blackColor),),
                      Container()
                    ],
                  ),
                )
            ),







            widget.selectedMap == 0?

            Positioned(
                bottom: 20,
                left: 280,
                right: 280,
                child:  InkWell(
                  onTap: (){

                    NavigationService().navigatePage(AddMapScreen(selectedMap: widget.selectedMap,),replace: true);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LandProfiles()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: ThemeConfig.primary
                    ),
                    child: Text("Start Roaming",style: ThemeConfig.textStylewhite16,),
                  ),
                )
            )
                :

            Positioned(
              bottom: 20,
              left: 280,
              right: 280,
              child: InkWell(
                onTap: (){
                  NavigationService().navigatePage(AddMapScreen(selectedMap: widget.selectedMap,),replace: true);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: ThemeConfig.primary
                  ),
                  child:Text("Start Mapping",style: ThemeConfig.textStylewhite16,),
                ),
              ),
            ),

            // Positioned(
            //   bottom: 30,
            //   left: 0,
            //   right: 30,
            //   child: InkWell(
            //     onTap: (){
            //       if(getgpsEnsble)
            //       {
            //         getgpsEnsble = false;
            //       }
            //       else{
            //         getgpsEnsble = true;
            //         checkGps();
            //       }
            //     },
            //       child: Text("button")),
            // ),

          ],
        ),
      ),
    );
  }
}
