import 'package:flutter/material.dart';
import 'package:form_robo/components/theme_config.dart';
class InstructionCard extends StatelessWidget {
  const InstructionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      width: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Please read these points before use and click on start button:",style: ThemeConfig.textStylered14,),

          SizedBox(height: 10,),

          Text("1. Please check whether your location is On/Off",style: ThemeConfig.textStylegrey12,),

          SizedBox(height: 6,),

          Text("2. Please the location is Off please turn on location button",style: ThemeConfig.textStylegrey12,),

          SizedBox(height: 6,),

          Text("3. click on current location to get exact location of it.",style: ThemeConfig.textStylegrey12,),

          SizedBox(height: 6,),

          Text("4. Slightly move your device to the end of boundaries to grt the parameters.",style: ThemeConfig.textStyleprimary12,),
          SizedBox(height: 6,),

          Text("5. you will get the map parameters of drawn boundaries in screen.",style: ThemeConfig.textStylegrey12,),

          SizedBox(height: 6,),

          Text("6. Avoid obstacles by moving the device.",style: ThemeConfig.textStylegrey12,),
        ]
        ,
      ),
    );
  }
}
