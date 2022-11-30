import 'package:flutter/material.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/theme_config.dart';
import 'package:form_robo/screens/add_map_screens/add_map_screen.dart';
class InstructionCard extends StatefulWidget {
  const InstructionCard({Key? key,this.ismap}) : super(key: key);
  final bool? ismap;

  @override
  State<InstructionCard> createState() => _InstructionCardState();
}

class _InstructionCardState extends State<InstructionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      width: MediaQuery.of(context).size.width*0.7,
      height: MediaQuery.of(context).size.height*0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("please these read these points before use and click on start button:",style: ThemeConfig.redColor14,),
             InkWell(
               onTap: (){
                 NavigationService().navigatePage(AddMapScreen());
                 setState(() {
                   // widget.ismap == true;
                   //refresh UI on update
                 });
               },
                 child: Icon(Icons.cancel_rounded,color: Colors.red,))
           ],
         ),

          SizedBox(height: 6,),

          Text("1. Move towards the Field/Land and tap on the screen to mark polygon.",style: ThemeConfig.textStyleprimary12,),
          SizedBox(height: 6,),

          Text("2. you will get the map parameters of drawn boundaries in screen.",style: ThemeConfig.textStylegrey12,),

          SizedBox(height: 6,),

          Text("3. Avoid obstacles by moving the device.",style: ThemeConfig.textStylegrey12,),
        ]
        ,
      ),
    );
  }
}
