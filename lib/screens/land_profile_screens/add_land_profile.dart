import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_robo/components/app_custom_card.dart';
import 'package:form_robo/components/app_drop_down_search.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/text_form_fields.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/add_map_screens/add_map_instruction_screen.dart';
import 'package:form_robo/screens/add_map_screens/add_map_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
class AddLandProfile extends StatefulWidget {
  const AddLandProfile({Key? key}) : super(key: key);

  @override
  State<AddLandProfile> createState() => _AddLandProfileState();
}

class _AddLandProfileState extends State<AddLandProfile> {

  File? insidePic;
  File? outsidePic;
  final picker = ImagePicker();
  // final _formKey = GlobalKey<FormState>();

  double currentvol = 0.5;

  int _selectedIndex = 0;


  String? selected_name;

  // bool _selectedIndex = false;
  // Color _color = Colors.transparent;
  //
  //
  // bool isSelected = false;


  List<String> sprayingSpeed=["Auto","Manual"];


  String? selected_map;

  int _selectedmapIndex = 0;


  List<String> _speedType=["Low","High"];
  int _selectedSpeedIndex = 0;


  String? _selectedSpeed;



  List<String> mapType=["Raoming","Standard",];



  double _currentSliderValue = 20;
  
  
  
  




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
    super.initState();
  }


  List<String> _cropTypeList = ["Wheat", "Mirchi","Tomattoo","+ Add New crop"];
  String? _cropType;

  final bool? _isSprayingSpeedManual = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: ThemeConfig.whiteColor,
        iconTheme: IconThemeData(color: ThemeConfig.primary),
        title: Expanded(
          child: Text(
            "Land Profiles",
            overflow: TextOverflow.visible,
            softWrap: true,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600, color: ThemeConfig.primary),),
        ),
        
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20,),
                Text("Enter all the fields and click on submit button",style: ThemeConfig.textStyleblackshade14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),

                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Profile Name",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                            SizedBox(width: 20,),

                            Container(
                              padding: EdgeInsets.only(left: 14, right: 14),
                              height: 40,
                              width: MediaQuery.of(context).size.width*0.5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(4),
                                  color:  ThemeConfig.whiteColor,
                                  border: Border.all(color:  ThemeConfig.bgGreyColor)
                              ),
                              child:TextField(
                               // controller: streetController,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                // controller: numberController,
                                cursorColor:  ThemeConfig.primary,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.singleLineFormatter,
                                  LengthLimitingTextInputFormatter(15)
                                ],
                                decoration: InputDecoration(
                                  //hintText: "Search here",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[500]),
                                    border: InputBorder.none),
                              ),

                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Crop Type     ",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                            SizedBox(width: 20,),

                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width*0.5,
                              child: AppDropDownSearch<String>(
                                focusColor: ThemeConfig.secondaryColor.withOpacity(0.5),
                               // title: "District",
                                hintText: "Select  Crop Type",
                                borderColor: ThemeConfig.formBorderColor,
                                enabled: false,
                                selectedItem: _cropType,
                                suffixIcon: Icons.keyboard_arrow_down_rounded,
                                color: ThemeConfig.lightBlackColor,
                                fillColor: ThemeConfig.whiteColor,

                                itemAsString: (String? quantityType) => quantityType??"",
                                asyncItems:(String? filter)  async => _cropTypeList,
                                onChanged: (String? quantityType) {
                                  _cropType = quantityType;
                                  print(quantityType);
                                },
                              ),
                            ),




                            // Container(
                            //   padding: EdgeInsets.only(left: 14, right: 14),
                            //   height: 40,
                            //   width: MediaQuery.of(context).size.width*0.5,
                            //   decoration: BoxDecoration(
                            //       shape: BoxShape.rectangle,
                            //       borderRadius: BorderRadius.circular(4),
                            //       color:  ThemeConfig.whiteColor,
                            //       border: Border.all(color:  ThemeConfig.bgGreyColor)
                            //   ),
                            //   child:TextField(
                            //     // controller: streetController,
                            //     style: TextStyle(
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //     // controller: numberController,
                            //     cursorColor:  ThemeConfig.primary,
                            //     inputFormatters: <TextInputFormatter>[
                            //       FilteringTextInputFormatter.singleLineFormatter,
                            //       LengthLimitingTextInputFormatter(15)
                            //     ],
                            //     decoration: InputDecoration(
                            //       //hintText: "Search here",
                            //         hintStyle: TextStyle(
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.w500,
                            //             color: Colors.grey[500]),
                            //         border: InputBorder.none),
                            //   ),
                            //
                            // ),
                          ],
                        ),




                       Row(
                         children: [
                           Text("Crop Height  ",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                           SizedBox(width: 20,),


                           Container(
                             padding: EdgeInsets.only(left: 14, right: 14),
                             height: 40,
                             width: MediaQuery.of(context).size.width*0.5,
                             decoration: BoxDecoration(
                                 shape: BoxShape.rectangle,
                                 borderRadius: BorderRadius.circular(4),
                                 color:  ThemeConfig.whiteColor,
                                 border: Border.all(color:  ThemeConfig.bgGreyColor)
                             ),
                             child:TextField(
                               // controller: streetController,
                               style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.w600,
                               ),
                               // controller: numberController,
                               cursorColor:  ThemeConfig.primary,
                               inputFormatters: <TextInputFormatter>[
                                 FilteringTextInputFormatter.singleLineFormatter,
                                 LengthLimitingTextInputFormatter(15)
                               ],
                               decoration: InputDecoration(
                                 //hintText: "Search here",
                                   hintStyle: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w500,
                                       color: Colors.grey[500]),
                                   border: InputBorder.none),
                             ),

                           ),


                           // Slider(
                           //   value: _currentSliderValue,
                           //   max: 100,
                           //   divisions: 5,
                           //   label: _currentSliderValue.round().toString(),
                           //   onChanged: (double value) {
                           //     setState(() {
                           //       _currentSliderValue = value;
                           //     });
                           //   },
                           // ),
                           //
                           //
                           // SizedBox(width: 20,),
                           // Text("$_currentSliderValue"),


                         ],
                       ),


                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Text("Spraying Speed     ",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                            SizedBox(width: 20,),


                            Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              width: MediaQuery.of(context).size.width*0.45,
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
                                          alignment: Alignment.center,
                                          decoration: ThemeConfig.boxDecorationWithRoundBorder(
                                            context,
                                            radius: 4,
                                            color: _selectedIndex == index ?  Theme.of(context).primaryColor : Colors.white,),
                                          height: 40,
                                          width: 100,
                                          child: Text("${sprayingSpeed[index]}",style: _selectedIndex == index ? ThemeConfig.Large14white:ThemeConfig.Large14Black,),
                                        ),
                                      ],
                                    ),

                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(height: 0);
                                },
                              ),
                            ),



                          ],
                        ),

                        SizedBox(height: 20,),

                        _selectedIndex == 1 ?

                        Row(
                          children: [

                            Text("Speed Type            ",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                            SizedBox(width: 20,),


                            Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              width: MediaQuery.of(context).size.width*0.45,
                              child: ListView.separated(
                                //shrinkWrap: true,
                                itemCount: _speedType.length,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {

                                  // orderId = notifications!.orders![index].id;

                                  return InkWell(
                                    onTap: (){

                                      setState(() {
                                        // isSelected = !isSelected;
                                        _selectedSpeedIndex = index;
                                        _selectedSpeed=_speedType[index];
                                        print("---------------------------> index ${_selectedSpeedIndex}");

                                      });

                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: ThemeConfig.boxDecorationWithRoundBorder(
                                            context,
                                            radius: 4,
                                            color: _selectedSpeedIndex == index ?  Theme.of(context).primaryColor : Colors.white,),
                                          height: 40,
                                          width: 100,
                                          child: Text("${_speedType[index]}",style: _selectedSpeedIndex == index ? ThemeConfig.Large14white:ThemeConfig.Large14Black,),
                                        ),
                                      ],
                                    ),

                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(height: 0);
                                },
                              ),
                            ),



                          ],
                        ):SizedBox()
                        ,

                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Text("Map Type               ",style: TextStyle(color: ThemeConfig.blackColor,fontSize: 14,fontWeight: FontWeight.w500),),
                            SizedBox(width: 20,),


                            Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              width: MediaQuery.of(context).size.width*0.45,
                              child: ListView.separated(
                                //shrinkWrap: true,
                                itemCount: mapType.length,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {

                                  // orderId = notifications!.orders![index].id;

                                  return InkWell(
                                    onTap: (){

                                      setState(() {
                                        // isSelected = !isSelected;
                                        _selectedmapIndex = index;
                                        selected_map=mapType[index];
                                        print("---------------------------> index ${_selectedmapIndex}");

                                      });

                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: ThemeConfig.boxDecorationWithRoundBorder(
                                            context,
                                            radius: 4,
                                            color: _selectedmapIndex == index ?  Theme.of(context).primaryColor : Colors.white,),
                                          height: 40,
                                          width: 100,
                                          child: Text("${mapType[index]}",style: _selectedmapIndex == index ? ThemeConfig.Large14white:ThemeConfig.Large14Black,),
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



                          ],
                        ),


                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 30,),
                        insidePic == null?
                        Text("Upload Image",style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.w600),): Text(""),
                        SizedBox(height: 10,),
                        insidePic == null
                            ?
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (builder) => uploadPicBottomSheet());
                            },
                            child: Center(
                              child: Container(
                                height: 120,
                                width: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  "assets/images/up.png",
                                  width: 150,
                                  color: Colors.grey[600],
                                ),

                              ),
                            ))

                            : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Upload Completed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 120,
                              width: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    insidePic!,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Any Issue, upload again ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (builder) =>
                                            uploadPicBottomSheet());
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Image.asset(
                                      "assets/images/up.png",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),

                SizedBox(height: 20,),
                Text("Map View",style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.w600),),
                SizedBox(height: 20,),
                
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: (){
                      NavigationService().navigatePage(MapInstructionScreen());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      // padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius:  10,
                              spreadRadius: 2)
                        ],
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/basemap.png",),
                        ),

                      ),
                      height: 250,
                      width: double.infinity,
                      child: Text("Click here to add parameters"),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => LandProfiles()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: ThemeConfig.primary)
                        ),
                        child: Text("Cancel",style: ThemeConfig.textStylePrimary16,),
                      ),
                    ),
                    SizedBox(width: 60,),
                    InkWell(
                      onTap: (){
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
                        child: Text("Submit",style: ThemeConfig.textStylewhite16,),
                      ),
                    )
                  ],
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget uploadPicBottomSheet() {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
      ),
      height: 150,
      width: double.infinity,
      //color: Colors.grey,
      child: Column(
        children: [
          Text(
            "Upload  From",
            style: TextStyle(
                color: ThemeConfig.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  TakePhoto(ImageSource.camera, insidePic);

                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.camera,
                  color:  Theme.of(context).primaryColor,
                ),
                label: Text(
                  "Camera",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  TakePhoto(ImageSource.gallery, insidePic);

                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.image,
                  color:  Theme.of(context).primaryColor,
                ),
                label: Text(
                  "Gallery",
                  style: TextStyle(
                      color:  Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void TakePhoto(ImageSource source, File? imageFile) async {
    final pickerFile = await ImagePicker().getImage(source: source);
    setState(() {
      insidePic = File(pickerFile!.path);
    });
  }


}
