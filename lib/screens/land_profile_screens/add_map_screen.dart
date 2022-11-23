import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/widgets/instructions_card.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class AddMapScreen extends StatefulWidget {
  const AddMapScreen({Key? key}) : super(key: key);

  @override
  State<AddMapScreen> createState() => _AddMapScreenState();
}

class _AddMapScreenState extends State<AddMapScreen> {
  // Completer<GoogleMapController> _controller = Completer();

  // static final CameraPosition _kGoogle = const CameraPosition(
  //   target: LatLng(19.0759837, 72.8776559),
  //   zoom: 14,
  // );
  //
  // final Set<Marker> _markers = {};
  // final Set<Polyline> _polyline = {};
  //
  // List<LatLng> latLen = [
  //    LatLng(19.0759837, 72.8776559),
  //
  // ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   // declared for loop for various locations
  //   for(int i=0; i<latLen.length; i++){
  //     _markers.add(
  //       // added markers
  //         Marker(
  //           markerId: MarkerId(i.toString()),
  //           position: latLen[i],
  //           infoWindow: InfoWindow(
  //             title: 'HOTEL',
  //             snippet: '5 Star Hotel',
  //           ),
  //           icon: BitmapDescriptor.defaultMarker,
  //         )
  //     );
  //     setState(() {
  //
  //     });
  //     _polyline.add(
  //         Polyline(
  //           polylineId: PolylineId('1'),
  //           points: latLen,
  //           color: Colors.green,
  //         )
  //     );
  //   }
  // }
  //
  //
  //
  //
  //
  // List<Marker> markers = [];
  // PolylinePoints polylinePoints = PolylinePoints();
  // Map<PolylineId, Polyline> polylines = {};
  // late GoogleMapController googleMapController;
  // final Completer<GoogleMapController> completer = Completer();
  //
  // void onMapCreated(GoogleMapController controller) {
  //   googleMapController = controller;
  //   if (!completer.isCompleted) {
  //     completer.complete(controller);
  //   }
  // }
  //
  // addMarker(latLng, newSetState) {
  //   markers.add(
  //       Marker(
  //           consumeTapEvents: true,
  //           markerId: MarkerId(latLng.toString()),
  //           position: latLng,
  //           onTap: (){
  //             markers.removeWhere((element) => element.markerId == MarkerId(latLng.toString()));
  //             if(markers.length > 1){
  //               getDirections(markers,newSetState);
  //             }
  //             else{
  //               polylines.clear();
  //             }
  //             newSetState(() {});
  //           }
  //       ));
  //   if(markers.length > 1){
  //     getDirections(markers,newSetState);
  //   }
  //
  //   newSetState(() {});
  // }
  //
  // getDirections(List<Marker> markers,newSetState) async {
  //   List<LatLng> polylineCoordinates = [];
  //   List<PolylineWayPoint> polylineWayPoints = [];
  //   for(var i = 0; i<markers.length;i++){
  //     polylineWayPoints.add(PolylineWayPoint(location: "${markers[i].position.latitude.toString()},${markers[i].position.longitude.toString()}",stopOver: true));
  //   }
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates("AIzaSyCFEWdWZjvchlSATLDN7v5qxKoInUmJPFU", //GoogleMap ApiKey
  //     PointLatLng(markers.first.position.latitude, markers.first.position.longitude), //first added marker
  //     PointLatLng(markers.last.position.latitude, markers.last.position.longitude),
  //     travelMode: TravelMode.driving,
  //   );
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   } else {
  //     print(result.errorMessage);
  //   }
  //
  //   newSetState(() {});
  //
  //   addPolyLine(polylineCoordinates,newSetState);
  //
  // }
  //
  // addPolyLine(List<LatLng> polylineCoordinates,newSetState) {
  //   PolylineId id = PolylineId("poly");
  //   Polyline polyline = Polyline(
  //     polylineId: id,
  //     color: Colors.blue,
  //     points: polylineCoordinates,
  //     width: 4,
  //   );
  //   polylines[id] = polyline;
  //
  //   newSetState(() {});
  // }
  //

  bool getgpsEnsble = false;



  bool servicestatus = false;
  bool haspermission = false;
  LocationPermission? permission;
  Position? position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;

  final Set<Marker> _marker = {};


  static const LatLng showLocation = const LatLng(27.7089427, 85.3086209);
  GoogleMapController? mapController;

  List<LatLng> latLan = [
    LatLng(19.0759837, 72.8776559),

  ];

  List<Marker> markers=[];

  List<Marker> _markerslist = <Marker>[];
  int id =1;




  checkGps() async {
    if(getgpsEnsble){
      servicestatus = await Geolocator.isLocationServiceEnabled();
      if(servicestatus){
        permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            print('Location permissions are denied');
          }else if(permission == LocationPermission.deniedForever){
            print("'Location permissions are permanently denied");
          }else{
            haspermission = true;
          }
        }else{
          haspermission = true;
        }

        if(haspermission){
          setState(() {
            //refresh the UI
          });
          getLocation();
        }
      }else{
        print("GPS Service is not enabled, turn on GPS location");
      }

      setState(() {
        //refresh the UI
      });
      Future.delayed(Duration(seconds: 4), () {
        setState(() {
          checkGps();
        });
      });
    }

  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition();
    print(position!.longitude); //Output: 80.24599079
    print(position!.latitude); //Output: 29.6593457

    long = position!.longitude.toString();
    lat = position!.latitude.toString();

    setState(() {
      //refresh UI
      latLen.add(LatLng(position!.latitude, position!.longitude));
      _polyline.add(
          Polyline(
            polylineId: PolylineId('1'),
            points: latLen,
            color: Colors.green,
          )
      );

      print("added latlan are -------------------------------------------------------------->${latLen}");
    });

    LocationSettings locationSettings = LocationSettings(
      //accuracy of the location data
      distanceFilter: 10, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }



  GoogleMapController? _controller;
  //  Location currentLocation = Location();
  // // Set<Marker> _markers={};
  //
  //  void getLocation() async{
  //    var location = await currentLocation.getLocation();
  //    currentLocation.onLocationChanged.listen((LocationData loc){
  //
  //      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
  //        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
  //        zoom: 12.0,
  //      )));
  //      print("-------------------------------------------------------->${loc.latitude}");
  //      print(loc.longitude);
  //      setState(() {
  //        _markers.add(Marker(markerId: MarkerId('Home'),
  //            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
  //        ));
  //      });
  //    });
  //  }
  //
  //  @override
  //  void initState(){
  //    super.initState();
  //    setState(() {
  //      getLocation();
  //    });
  //  }



  String? selected_name;




  List<String> sprayingSpeed=["Auto","Manual",];

  String? selected_map;


  int _selectedIndex = 0;


  //final Set<Marker> markers = new Set();





  Completer<GoogleMapController> _mapcontroller = Completer();

  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 14,
  );

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};


  List<LatLng> latLen = [
    // LatLng(19.0759837, 72.8776559),
    // LatLng(28.679079, 77.069710),
    // LatLng(26.850000, 80.949997),
    // LatLng(24.879999, 74.629997),
    // LatLng(16.166700, 74.833298),
    // LatLng(12.971599, 77.594563),
  ];

  @override
  void initState() {
    //checkGps();
    //checkGps();
    getLocation();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: ThemeConfig.whiteColor,
        iconTheme: IconThemeData(color: ThemeConfig.primary),
        title: Expanded(
          child: Text(
            "Add Maps",
            overflow: TextOverflow.visible,
            softWrap: true,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600, color: ThemeConfig.primary),),
        ),

      ),
      body: SafeArea(
        child: Stack(
          children: [

            // Container(
            //   height: 100,
            //   child: ListView.builder(
            //       itemCount: latLen.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Text("${latLen[index]}");
            //       }),
            // ),

            _selectedIndex == 1?


            Expanded(
              child: GoogleMap(
                onTap: _handleTap,

                initialCameraPosition: _kGoogle,

                mapType: MapType.normal,

                markers: _markers,

                myLocationEnabled: true,
                myLocationButtonEnabled: true,

                compassEnabled: true,

                // polylines: _polyline,

                polygons: {
                  Polygon(
                      polygonId: PolygonId("1"),
                      points: latLan,
                      fillColor: Color(0xFF006491).withOpacity(0.2),
                      strokeWidth: 2
                  ),
                },

                onMapCreated: (GoogleMapController controller){
                  _mapcontroller.complete(controller);
                },
              ),
            )

            // Expanded(
            //   child: GoogleMap(
            //     initialCameraPosition: CameraPosition(
            //       target: showLocation,
            //       zoom: 15.0,
            //     ),
            //     mapType: MapType.normal,
            //     markers: Set<Marker>.of(_markers),
            //     onMapCreated: (controller) {
            //       setState(() {
            //         mapController = controller;
            //       });
            //     },
            //     myLocationEnabled: true,
            //   ),
            // )


                :


            Expanded(
              child: GoogleMap(
                rotateGesturesEnabled: true,
                zoomControlsEnabled: true,
                initialCameraPosition:CameraPosition(
                  target: LatLng(position!.latitude, position!.longitude),
                  zoom: 12.0,
                ),
                onMapCreated: (GoogleMapController controller){
                  _controller = controller;
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true
                ,
                markers: _marker,
                polylines: _polyline,


                // polygons: {
                //   Polygon(
                //       polygonId: PolygonId("1"),
                //       points: latLen,
                //       fillColor: Color(0xFF006491).withOpacity(0.2),
                //       strokeWidth: 2
                //   ),
                // }
              ),
            ),


            Positioned(

                child:InstructionCard()
            ),

            Positioned(
              top: 20,
              left: 280,
              right: 280,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),

                height: MediaQuery.of(context).size.height*0.11,
                // width: MediaQuery.of(context).size.width*0.45,
                child: ListView.separated(
                  //shrinkWrap: true,
                  itemCount: sprayingSpeed.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    // orderId = notifications!.orders![index].id;

                    return InkWell(
                      onTap: (){

                        setState(() {
                          // isSelected = !isSelected;
                          _selectedIndex = index;
                          selected_name=sprayingSpeed[index];
                          print("---------------------------> index ${_selectedIndex}");

                        });

                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            alignment: Alignment.center,
                            decoration: ThemeConfig.boxDecorationWithRoundBorder(
                              context,
                              radius: 4,
                              color: _selectedIndex == index ?  ThemeConfig.primary : Colors.white,),
                            height: 50,
                            width: 100,
                            child: Text("${sprayingSpeed[index]}",style: _selectedIndex == index ? ThemeConfig.Large14white:ThemeConfig.Large14Black,),
                          )
                        ],
                      ),

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
                left: 280,
                right: 280,
                child:  InkWell(
                  onTap: (){

                    if(getgpsEnsble)
                    {
                      getgpsEnsble = false;
                    }
                    else{
                      getgpsEnsble = true;
                      checkGps();
                    }

                    setState(() {

                    });
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
                    child:getgpsEnsble?  Text("End",style: ThemeConfig.textStylewhite16,):Text("Start",style: ThemeConfig.textStylewhite16,),
                  ),
                )
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


  _handleTap(LatLng point) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ));

      latLan.add(LatLng(point.latitude, point.longitude));

      print("================================================================>${latLen}");
    });
  }
}











// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:form_robo/components/location_service.dart';
// import 'package:form_robo/components/theme_config.dart';
// import 'package:form_robo/screens/widgets/instructions_card.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class AddMapScreen extends StatefulWidget {
//   const AddMapScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddMapScreen> createState() => _AddMapScreenState();
// }
//
// class _AddMapScreenState extends State<AddMapScreen> {
//   // Completer<GoogleMapController> _controller = Completer();
//
//   // static final CameraPosition _kGoogle = const CameraPosition(
//   //   target: LatLng(19.0759837, 72.8776559),
//   //   zoom: 14,
//   // );
//   //
//   // final Set<Marker> _markers = {};
//   // final Set<Polyline> _polyline = {};
//   //
//   // List<LatLng> latLen = [
//   //    LatLng(19.0759837, 72.8776559),
//   //
//   // ];
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //
//   //   // declared for loop for various locations
//   //   for(int i=0; i<latLen.length; i++){
//   //     _markers.add(
//   //       // added markers
//   //         Marker(
//   //           markerId: MarkerId(i.toString()),
//   //           position: latLen[i],
//   //           infoWindow: InfoWindow(
//   //             title: 'HOTEL',
//   //             snippet: '5 Star Hotel',
//   //           ),
//   //           icon: BitmapDescriptor.defaultMarker,
//   //         )
//   //     );
//   //     setState(() {
//   //
//   //     });
//   //     _polyline.add(
//   //         Polyline(
//   //           polylineId: PolylineId('1'),
//   //           points: latLen,
//   //           color: Colors.green,
//   //         )
//   //     );
//   //   }
//   // }
//   //
//   //
//   //
//   //
//   //
//   // List<Marker> markers = [];
//   // PolylinePoints polylinePoints = PolylinePoints();
//   // Map<PolylineId, Polyline> polylines = {};
//   // late GoogleMapController googleMapController;
//   // final Completer<GoogleMapController> completer = Completer();
//   //
//   // void onMapCreated(GoogleMapController controller) {
//   //   googleMapController = controller;
//   //   if (!completer.isCompleted) {
//   //     completer.complete(controller);
//   //   }
//   // }
//   //
//   // addMarker(latLng, newSetState) {
//   //   markers.add(
//   //       Marker(
//   //           consumeTapEvents: true,
//   //           markerId: MarkerId(latLng.toString()),
//   //           position: latLng,
//   //           onTap: (){
//   //             markers.removeWhere((element) => element.markerId == MarkerId(latLng.toString()));
//   //             if(markers.length > 1){
//   //               getDirections(markers,newSetState);
//   //             }
//   //             else{
//   //               polylines.clear();
//   //             }
//   //             newSetState(() {});
//   //           }
//   //       ));
//   //   if(markers.length > 1){
//   //     getDirections(markers,newSetState);
//   //   }
//   //
//   //   newSetState(() {});
//   // }
//   //
//   // getDirections(List<Marker> markers,newSetState) async {
//   //   List<LatLng> polylineCoordinates = [];
//   //   List<PolylineWayPoint> polylineWayPoints = [];
//   //   for(var i = 0; i<markers.length;i++){
//   //     polylineWayPoints.add(PolylineWayPoint(location: "${markers[i].position.latitude.toString()},${markers[i].position.longitude.toString()}",stopOver: true));
//   //   }
//   //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates("AIzaSyCFEWdWZjvchlSATLDN7v5qxKoInUmJPFU", //GoogleMap ApiKey
//   //     PointLatLng(markers.first.position.latitude, markers.first.position.longitude), //first added marker
//   //     PointLatLng(markers.last.position.latitude, markers.last.position.longitude),
//   //     travelMode: TravelMode.driving,
//   //   );
//   //   if (result.points.isNotEmpty) {
//   //     result.points.forEach((PointLatLng point) {
//   //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//   //     });
//   //   } else {
//   //     print(result.errorMessage);
//   //   }
//   //
//   //   newSetState(() {});
//   //
//   //   addPolyLine(polylineCoordinates,newSetState);
//   //
//   // }
//   //
//   // addPolyLine(List<LatLng> polylineCoordinates,newSetState) {
//   //   PolylineId id = PolylineId("poly");
//   //   Polyline polyline = Polyline(
//   //     polylineId: id,
//   //     color: Colors.blue,
//   //     points: polylineCoordinates,
//   //     width: 4,
//   //   );
//   //   polylines[id] = polyline;
//   //
//   //   newSetState(() {});
//   // }
//   //
//
//   bool getgpsEnsble = false;
//
//
//
//   bool servicestatus = false;
//   bool haspermission = false;
//   LocationPermission? permission;
//   Position? position;
//   String long = "", lat = "";
//   late StreamSubscription<Position> positionStream;
//
//   final Set<Marker> _marker = {};
//
//
//   static const LatLng showLocation = const LatLng(27.7089427, 85.3086209);
//   GoogleMapController? mapController;
//
//   List<LatLng> latLan = [
//     LatLng(19.0759837, 72.8776559),
//
//   ];
//
//   List<Marker> markers=[];
//
//   List<Marker> _markerslist = <Marker>[];
//   int id =1;
//
//
//
//
//   checkGps() async {
//     if(getgpsEnsble){
//       servicestatus = await Geolocator.isLocationServiceEnabled();
//       if(servicestatus){
//         permission = await Geolocator.checkPermission();
//
//         if (permission == LocationPermission.denied) {
//           permission = await Geolocator.requestPermission();
//           if (permission == LocationPermission.denied) {
//             print('Location permissions are denied');
//           }else if(permission == LocationPermission.deniedForever){
//             print("'Location permissions are permanently denied");
//           }else{
//             haspermission = true;
//           }
//         }else{
//           haspermission = true;
//         }
//
//         if(haspermission){
//           setState(() {
//             //refresh the UI
//           });
//           getLocation();
//         }
//       }else{
//         print("GPS Service is not enabled, turn on GPS location");
//       }
//
//       setState(() {
//         //refresh the UI
//       });
//       Future.delayed(Duration(seconds: 4), () {
//         setState(() {
//           checkGps();
//         });
//       });
//     }
//
//   }
//
//   getLocation() async {
//     position = await Geolocator.getCurrentPosition();
//     print(position!.longitude); //Output: 80.24599079
//     print(position!.latitude); //Output: 29.6593457
//
//     long = position!.longitude.toString();
//     lat = position!.latitude.toString();
//
//     setState(() {
//       //refresh UI
//       latLen.add(LatLng(position!.latitude, position!.longitude));
//
//       print("added latlan are -------------------------------------------------------------->${latLen}");
//     });
//
//     LocationSettings locationSettings = LocationSettings(
//       //accuracy of the location data
//       distanceFilter: 10, //minimum distance (measured in meters) a
//       //device must move horizontally before an update event is generated;
//     );
//
//     StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
//         locationSettings: locationSettings).listen((Position position) {
//       print(position.longitude); //Output: 80.24599079
//       print(position.latitude); //Output: 29.6593457
//
//       long = position.longitude.toString();
//       lat = position.latitude.toString();
//
//       setState(() {
//         //refresh UI on update
//       });
//     });
//   }
//
//
//
//   GoogleMapController? _controller;
//   //  Location currentLocation = Location();
//   // // Set<Marker> _markers={};
//   //
//   //  void getLocation() async{
//   //    var location = await currentLocation.getLocation();
//   //    currentLocation.onLocationChanged.listen((LocationData loc){
//   //
//   //      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
//   //        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
//   //        zoom: 12.0,
//   //      )));
//   //      print("-------------------------------------------------------->${loc.latitude}");
//   //      print(loc.longitude);
//   //      setState(() {
//   //        _markers.add(Marker(markerId: MarkerId('Home'),
//   //            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
//   //        ));
//   //      });
//   //    });
//   //  }
//   //
//   //  @override
//   //  void initState(){
//   //    super.initState();
//   //    setState(() {
//   //      getLocation();
//   //    });
//   //  }
//
//
//
//   String? selected_name;
//
//
//
//
//   List<String> sprayingSpeed=["Auto","Manual",];
//
//   String? selected_map;
//
//
//   int _selectedIndex = 0;
//
//
//   //final Set<Marker> markers = new Set();
//
//
//
//
//
//   Completer<GoogleMapController> _mapcontroller = Completer();
//
//   static final CameraPosition _kGoogle = const CameraPosition(
//     target: LatLng(19.0759837, 72.8776559),
//     zoom: 14,
//   );
//
//   final Set<Marker> _markers = {};
//   final Set<Polyline> _polyline = {};
//
//
//   List<LatLng> latLen = [
//     // LatLng(19.0759837, 72.8776559),
//     // LatLng(28.679079, 77.069710),
//     // LatLng(26.850000, 80.949997),
//     // LatLng(24.879999, 74.629997),
//     // LatLng(16.166700, 74.833298),
//     // LatLng(12.971599, 77.594563),
//   ];
//
//   @override
//   void initState() {
//     //checkGps();
//     //checkGps();
//     getLocation();
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 4,
//         backgroundColor: ThemeConfig.whiteColor,
//         iconTheme: IconThemeData(color: ThemeConfig.primary),
//         title: Expanded(
//           child: Text(
//             "Add Map",
//             overflow: TextOverflow.visible,
//             softWrap: true,
//             style: Theme.of(context).textTheme.headline5!.copyWith(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600, color: ThemeConfig.primary),),
//         ),
//
//       ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//
//             // Container(
//             //   height: 100,
//             //   child: ListView.builder(
//             //       itemCount: latLen.length,
//             //       itemBuilder: (BuildContext context, int index) {
//             //         return Text("${latLen[index]}");
//             //       }),
//             // ),
//
//             _selectedIndex == 1?
//
//
//             Expanded(
//               child: GoogleMap(
//                 onTap: _handleTap,
//
//                 initialCameraPosition: _kGoogle,
//
//                 mapType: MapType.normal,
//
//                 markers: _markers,
//
//                 myLocationEnabled: true,
//                 myLocationButtonEnabled: true,
//
//                 compassEnabled: true,
//
//                 // polylines: _polyline,
//
//                 // polygons: {
//                 //   Polygon(
//                 //       polygonId: PolygonId("1"),
//                 //       points: latLen,
//                 //       fillColor: Color(0xFF006491).withOpacity(0.2),
//                 //       strokeWidth: 2
//                 //   ),
//                 // },
//
//                 onMapCreated: (GoogleMapController controller){
//                   _mapcontroller.complete(controller);
//                 },
//               ),
//             )
//
//             // Expanded(
//             //   child: GoogleMap(
//             //     initialCameraPosition: CameraPosition(
//             //       target: showLocation,
//             //       zoom: 15.0,
//             //     ),
//             //     mapType: MapType.normal,
//             //     markers: Set<Marker>.of(_markers),
//             //     onMapCreated: (controller) {
//             //       setState(() {
//             //         mapController = controller;
//             //       });
//             //     },
//             //     myLocationEnabled: true,
//             //   ),
//             // )
//
//
//                 :
//
//
//             Expanded(
//               child: GoogleMap(
//                   rotateGesturesEnabled: true,
//                   zoomControlsEnabled: true,
//                   initialCameraPosition:CameraPosition(
//                     target: LatLng(position!.latitude, position!.longitude),
//                     zoom: 12.0,
//                   ),
//                   onMapCreated: (GoogleMapController controller){
//                     _controller = controller;
//                   },
//                   myLocationEnabled: true,
//                   myLocationButtonEnabled: true
//                   ,
//                   markers: _marker,
//                   polygons: {
//                     Polygon(
//                         polygonId: PolygonId("1"),
//                         points: latLen,
//                         fillColor: Color(0xFF006491).withOpacity(0.2),
//                         strokeWidth: 2
//                     ),
//                   }
//               ),
//             ),
//
//
//             Positioned(
//
//                 child:InstructionCard()
//             ),
//
//             Positioned(
//               top: 20,
//               left: 280,
//               right: 280,
//               child: Container(
//                 padding: EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                 ),
//
//                 height: MediaQuery.of(context).size.height*0.11,
//                 // width: MediaQuery.of(context).size.width*0.45,
//                 child: ListView.separated(
//                   //shrinkWrap: true,
//                   itemCount: sprayingSpeed.length,
//                   physics: BouncingScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//
//                     // orderId = notifications!.orders![index].id;
//
//                     return InkWell(
//                       onTap: (){
//
//                         setState(() {
//                           // isSelected = !isSelected;
//                           _selectedIndex = index;
//                           selected_name=sprayingSpeed[index];
//                           print("---------------------------> index ${_selectedIndex}");
//
//                         });
//
//                       },
//                       child: Row(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(4),
//                             alignment: Alignment.center,
//                             decoration: ThemeConfig.boxDecorationWithRoundBorder(
//                               context,
//                               radius: 4,
//                               color: _selectedIndex == index ?  ThemeConfig.primary : Colors.white,),
//                             height: 50,
//                             width: 100,
//                             child: Text("${sprayingSpeed[index]}",style: _selectedIndex == index ? ThemeConfig.Large14white:ThemeConfig.Large14Black,),
//                           )
//                         ],
//                       ),
//
//                     );
//                   },
//                   separatorBuilder: (BuildContext context, int index) {
//                     return const SizedBox(height: 0);
//                   },
//                 ),
//               ),
//             ),
//
//
//             Positioned(
//                 bottom: 20,
//                 left: 280,
//                 right: 280,
//                 child:  InkWell(
//                   onTap: (){
//
//                     if(getgpsEnsble)
//                     {
//                       getgpsEnsble = false;
//                     }
//                     else{
//                       getgpsEnsble = true;
//                       checkGps();
//                     }
//
//                     setState(() {
//
//                     });
//                     // Navigator.push(context, MaterialPageRoute(builder: (context) => LandProfiles()));
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     alignment: Alignment.center,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         color: ThemeConfig.primary
//                     ),
//                     child:getgpsEnsble?  Text("End",style: ThemeConfig.textStylewhite16,):Text("Start",style: ThemeConfig.textStylewhite16,),
//                   ),
//                 )
//             ),
//
//             // Positioned(
//             //   bottom: 30,
//             //   left: 0,
//             //   right: 30,
//             //   child: InkWell(
//             //     onTap: (){
//             //       if(getgpsEnsble)
//             //       {
//             //         getgpsEnsble = false;
//             //       }
//             //       else{
//             //         getgpsEnsble = true;
//             //         checkGps();
//             //       }
//             //     },
//             //       child: Text("button")),
//             // ),
//
//
//
//
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   _handleTap(LatLng point) {
//     setState(() {
//       _markers.add(Marker(
//         markerId: MarkerId(point.toString()),
//         position: point,
//         infoWindow: InfoWindow(
//           title: 'I am a marker',
//         ),
//         icon:
//         BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
//       ));
//
//       latLan.add(LatLng(point.latitude, point.longitude));
//
//       print("================================================================>${latLen}");
//     });
//   }
// }







