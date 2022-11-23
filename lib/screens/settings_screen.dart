import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double currentvol = 0.5;

  int _selectedIndex = 0;


  String? selected_name;

  List<String> sprayingSpeed=["ON","OFF"];

  String? selected_map;

  int _selectedmapIndex = 0;



  List<String> mapType=["ON","OFF",];


  double brightness = 0.0;

  Future<void> _initBrightness() async{
    double bright;
    try{
      bright = await FlutterScreenWake.brightness;
    }on PlatformException{
      bright = 1.0;
    }
    if(!mounted)return;

    setState(() {
      brightness = bright;
    });

  }



  @override
  void initState() {
    PerfectVolumeControl.hideUI = false; //set if system UI is hided or not on volume up/down
    Future.delayed(Duration.zero,() async {
      currentvol = await PerfectVolumeControl.getVolume();
      setState(() {
        //refresh UI
      });
    });

    PerfectVolumeControl.stream.listen((volume) {
      setState(() {
        currentvol = volume;
      });
    });


    _initBrightness();


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
            "Settings",
            overflow: TextOverflow.visible,
            softWrap: true,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600, color: ThemeConfig.primary),),
        ),

      ),

      body:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),

                Row(
                  children: [
                    Text("Sound Controll     ",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                    SizedBox(width: 20,),


                    Slider(
                      value: currentvol,
                      onChanged: (newvol){
                        currentvol = newvol;
                        PerfectVolumeControl.setVolume(newvol); //set new volume
                        setState(() {

                        });
                      },
                      min: 0, //
                      max:  1,
                      divisions: 100,
                    ),
                    SizedBox(width: 20,),
                    // Text("$currentvol"),


                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Text("Brightness            ",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                    SizedBox(width: 20,),


                    Slider(

                      value: brightness,
                      onChanged: (value){
                        //set new volume
                        setState(() {
                          brightness = value;
                          FlutterScreenWake.setBrightness(brightness);
                        });
                      },

                    ),
                    SizedBox(width: 20,),
                    //Text("$currentvol"),


                  ],
                ),


                // Row(
                //   children: [
                //     Text("Wifi                               ",
                //       style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                //     SizedBox(width: 20,),
                //
                //
                //     Container(
                //       height: MediaQuery.of(context).size.height*0.1,
                //       width: MediaQuery.of(context).size.width*0.45,
                //       child: ListView.separated(
                //         //shrinkWrap: true,
                //         itemCount: sprayingSpeed.length,
                //         physics: BouncingScrollPhysics(),
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (context, index) {
                //
                //           // orderId = notifications!.orders![index].id;
                //
                //           return InkWell(
                //             onTap: (){
                //
                //               setState(() {
                //                 // isSelected = !isSelected;
                //                 _selectedIndex = index;
                //                 selected_name=sprayingSpeed[index];
                //                 print("---------------------------> index ${_selectedIndex}");
                //
                //               });
                //
                //             },
                //             child: Row(
                //               children: [
                //                 Container(
                //                   alignment: Alignment.center,
                //                   decoration: ThemeConfig.boxDecorationWithRoundBorder(
                //                     context,
                //                     radius: 4,
                //                     color: _selectedIndex == index ?  ThemeConfig.primary : Colors.white,),
                //                   height: 40,
                //                   width: 100,
                //                   child: Text("${sprayingSpeed[index]}",style: _selectedIndex == index ? ThemeConfig.Large14white:ThemeConfig.Large14Black,),
                //                 )
                //               ],
                //             ),
                //
                //           );
                //         },
                //         separatorBuilder: (BuildContext context, int index) {
                //           return const SizedBox(height: 0);
                //         },
                //       ),
                //     ),
                //
                //
                //
                //   ],
                // ),
                //
                // SizedBox(height: 20,),
                //
                // Row(
                //   children: [
                //     Text("GPS Automatic           ",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                //     SizedBox(width: 20,),
                //
                //
                //     Container(
                //       height: MediaQuery.of(context).size.height*0.1,
                //       width: MediaQuery.of(context).size.width*0.45,
                //       child: ListView.separated(
                //         //shrinkWrap: true,
                //         itemCount: mapType.length,
                //         physics: BouncingScrollPhysics(),
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (context, index) {
                //
                //           // orderId = notifications!.orders![index].id;
                //
                //           return InkWell(
                //             onTap: (){
                //
                //               setState(() {
                //                 // isSelected = !isSelected;
                //                 _selectedmapIndex = index;
                //                 selected_map=mapType[index];
                //                 print("---------------------------> index ${_selectedmapIndex}");
                //
                //               });
                //
                //             },
                //             child: Row(
                //               children: [
                //                 Container(
                //                   alignment: Alignment.center,
                //                   decoration: ThemeConfig.boxDecorationWithRoundBorder(
                //                     context,
                //                     radius: 4,
                //                     color: _selectedmapIndex == index ?   ThemeConfig.primary  : Colors.white,),
                //                   height: 40,
                //                   width: 100,
                //                   child: Text("${mapType[index]}",style: _selectedmapIndex == index ? ThemeConfig.Large14white:ThemeConfig.Large14Black,),
                //                 )
                //               ],
                //             ),
                //
                //           );
                //         },
                //         separatorBuilder: (BuildContext context, int index) {
                //           return const SizedBox(height: 0);
                //         },
                //       ),
                //     ),
                //
                //
                //
                //   ],
                // ),
                //
                //
                // SizedBox(height: 20,),
                //
                // Row(
                //   children: [
                //     Text("Mobile Network          ",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                //     SizedBox(width: 20,),
                //
                //
                //     Container(
                //       height: MediaQuery.of(context).size.height*0.1,
                //       width: MediaQuery.of(context).size.width*0.45,
                //       child: ListView.separated(
                //         //shrinkWrap: true,
                //         itemCount: mapType.length,
                //         physics: BouncingScrollPhysics(),
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (context, index) {
                //
                //           // orderId = notifications!.orders![index].id;
                //
                //           return InkWell(
                //             onTap: (){
                //
                //               setState(() {
                //                 // isSelected = !isSelected;
                //                 _selectedmapIndex = index;
                //                 selected_map=mapType[index];
                //                 print("---------------------------> index ${_selectedmapIndex}");
                //
                //               });
                //
                //             },
                //             child: Row(
                //               children: [
                //                 Container(
                //                   alignment: Alignment.center,
                //                   decoration: ThemeConfig.boxDecorationWithRoundBorder(
                //                     context,
                //                     radius: 4,
                //                     color: _selectedmapIndex == index ?   ThemeConfig.primary  : Colors.white,),
                //                   height: 40,
                //                   width: 100,
                //                   child: Text("${mapType[index]}",style: _selectedmapIndex == index ? ThemeConfig.Large14white:ThemeConfig.Large14Black,),
                //                 )
                //               ],
                //             ),
                //
                //           );
                //         },
                //         separatorBuilder: (BuildContext context, int index) {
                //           return const SizedBox(height: 0);
                //         },
                //       ),
                //     ),
                //
                //
                //
                //   ],
                // ),

                //SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
