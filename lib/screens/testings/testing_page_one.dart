import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestingOne extends StatefulWidget {
  const TestingOne({Key? key}) : super(key: key);

  @override
  _TestingOneState createState() => _TestingOneState();
}

class _TestingOneState extends State<TestingOne> {

  Completer<GoogleMapController> _controller = Completer();

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
    // TODO: implement initState
    super.initState();


    // for(int i=0; i<latLen.length; i++){
    //   _markers.add(
    //     // added markers
    //       Marker(
    //         markerId: MarkerId(i.toString()),
    //         position: latLen[i],
    //         infoWindow: InfoWindow(
    //           title: 'HOTEL',
    //           snippet: '5 Star Hotel',
    //         ),
    //         icon: BitmapDescriptor.defaultMarker,
    //       )
    //   );
    //   setState(() {
    //
    //   });
    //   _polyline.add(
    //       Polyline(
    //         polylineId: PolylineId('1'),
    //         points: latLen,
    //         color: Colors.green,
    //       )
    //   );
    // }
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
  Widget build(BuildContext context) {

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F9D58),
        // title of app
        title: Text("GFG"),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [

              Text(
                '$hours:$minutes:$seconds',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
              ),
              SizedBox(height: 20),
              // Step 9
              ElevatedButton(
                onPressed: startTimer,
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    itemCount: latLen.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text("${latLen[index]}");
                    }),
              ),
              // Expanded(
              //   child: GoogleMap(
              //     onTap: _handleTap,
              //
              //     initialCameraPosition: _kGoogle,
              //
              //     mapType: MapType.normal,
              //
              //     markers: _markers,
              //
              //     myLocationEnabled: true,
              //     myLocationButtonEnabled: true,
              //
              //     compassEnabled: true,
              //
              //    // polylines: _polyline,
              //
              //       polygons: {
              //         Polygon(
              //             polygonId: PolygonId("1"),
              //             points: latLen,
              //             fillColor: Color(0xFF006491).withOpacity(0.2),
              //             strokeWidth: 2
              //         ),
              //       },
              //
              //     onMapCreated: (GoogleMapController controller){
              //       _controller.complete(controller);
              //     },
              //   ),
              // ),
            ],
          ),
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

      latLen.add(LatLng(point.latitude, point.longitude));

      print("================================================================>${latLen}");
    });
  }


}




// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class TestingOne extends StatefulWidget{
//   @override
//   _TestingOneState createState() => _TestingOneState();
// }
//
// class _TestingOneState extends State<TestingOne> {
// // Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGoogle = const CameraPosition(
//     target: LatLng(19.0759837, 72.8776559),
//     zoom: 14,
//   );
//
//   final Set<Marker> _markers = {};
//   final Set<Polyline> _polyline = {};
//
//   List<LatLng> latLen = [
//     LatLng(19.0759837, 72.8776559),
//
//   ];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     // declared for loop for various locations
//     for(int i=0; i<latLen.length; i++){
//       _markers.add(
//         // added markers
//           Marker(
//             markerId: MarkerId(i.toString()),
//             position: latLen[i],
//             infoWindow: InfoWindow(
//               title: 'HOTEL',
//               snippet: '5 Star Hotel',
//             ),
//             icon: BitmapDescriptor.defaultMarker,
//           )
//       );
//       setState(() {
//
//       });
//       _polyline.add(
//           Polyline(
//             polylineId: PolylineId('1'),
//             points: latLen,
//             color: Colors.green,
//           )
//       );
//     }
//   }
//
//
//
//
//
//   List<Marker> markers = [];
//   PolylinePoints polylinePoints = PolylinePoints();
//   Map<PolylineId, Polyline> polylines = {};
//   late GoogleMapController googleMapController;
//   final Completer<GoogleMapController> completer = Completer();
//
//   void onMapCreated(GoogleMapController controller) {
//     googleMapController = controller;
//     if (!completer.isCompleted) {
//       completer.complete(controller);
//     }
//   }
//
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
//
//
//   GoogleMapController? mapController;
//
//   int id = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text("Multiple Markers in Google Map"),
//         backgroundColor: Colors.deepOrangeAccent,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GoogleMap(
//               zoomGesturesEnabled: true,
//               initialCameraPosition: _kGoogle,
//               onTap: (LatLng latLan){
//                // print("our latlng is ${latLan}");
//
//
//
//                 setState(() {
//                   Marker newMarker= Marker(
//                       markerId: MarkerId("${1}"),
//                       position: LatLng(latLan.latitude,latLan.longitude),
//                       icon: BitmapDescriptor.defaultMarker,
//                       // icon: BitmapDescriptor.defaultMarkerWithHue(
//                       //     BitmapDescriptor.hueRed
//                       // )
//                   );
//
//                   markers.add(newMarker);
//                   id = id + 1;
//
//                   print("our latlng is ${latLan}");
//
//
//                   print("-------------------------------------> ${markers}");
//                 });
//               },
//               myLocationEnabled: true,
//                //markers:markers.map((e) => e).toSet() ,
//                markers: Set<Marker>.of(markers),
//               mapType: MapType.normal,
//               onMapCreated: onMapCreated,
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
// }