import 'package:flutter/material.dart';
import 'package:form_robo/components/text_headers.dart';
import 'package:form_robo/components/theme_config.dart';



class AppElevatedButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final GestureTapCallback? onPress;

  const AppElevatedButton({Key? key, required this.title, this.onPress,this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(ThemeConfig.borderRadius))),
        child: AppButtonText(title,color: Colors.white,),

      ),
    );
  }
}


// class AppElevatedOutlineButton extends StatelessWidget {
//   final String title;
//   final GestureTapCallback? onPress;

//   const AppElevatedOutlineButton({Key? key, required this.title, this.onPress})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         child: ElevatedButton(
//             onPressed: onPress,
//             style: ButtonStyle(

//               backgroundColor: MaterialStateProperty.all<Color>(ThemeConfig.whiteColor),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(

//                       borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
//                       side: BorderSide(color: ThemeConfig.lightGreyColor.withOpacity(0.2)))),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: ThemeConfig.blackColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const Icon(Icons.add, color: ThemeConfig.blackColor),
//               ],
//             )));
//   }
// }

// class AppElevatedOutlineButton2 extends StatelessWidget {
//   final String title;
//   final GestureTapCallback? onPress;
//   final Color? color;
//   final double? padding;

//   const AppElevatedOutlineButton2({Key? key, required this.title, this.onPress, this.color, this.padding})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(vertical: padding ?? 12),
//         child: ElevatedButton(
//             onPressed: onPress,
//             style: ButtonStyle(

//               backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(

//                       borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
//                       side: BorderSide(color: color ?? Theme.of(context).primaryColor))),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(padding ?? 16),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: color ?? Theme.of(context).primaryColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             )));
//   }
// }

class AppElevatedOutlineButton extends StatelessWidget {
  final String title;
  final GestureLongPressCallback onPress;
  const AppElevatedOutlineButton({Key? key, required this.title, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Theme.of(context).primaryColor.withOpacity(0.5),
          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(ThemeConfig.borderRadius))),
          shadowColor: Colors.transparent,
          side: BorderSide(color: Theme.of(context).primaryColor),
          elevation: 0,
          // backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //     RoundedRectangleBorder(

          //         borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
          //         side: BorderSide(color: Theme.of(context).primaryColor))),
        ),
        child: AppButtonText(title, color: Theme.of(context).primaryColor,),
      ),
    );
  }
}


class SubmitButton extends StatelessWidget {
  const SubmitButton({
    this.height,
    this.width,
    this.title,
    this.onPress
  }) ;
  final double? height;
  final double? width;
  final String? title;
  final GestureLongPressCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height:height ,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Theme.of(context).primaryColor,
          // boxShadow: [
          //   BoxShadow(
          //     color: ThemeConfig.greyColor.withOpacity(0.2),
          //     offset: const Offset(
          //       1.0,
          //       1.0,
          //     ),
          //     blurRadius: 1.0,
          //     spreadRadius: 1.0,
          //   ), //BoxShadow
          //   //BoxShadow
          // ],
        ),
        child: Text("$title",style:  Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500, color: ThemeConfig.whiteColor),),
      ),
    );
  }
}
