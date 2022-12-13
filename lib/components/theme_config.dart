
import 'package:flutter/material.dart';

class ThemeConfig {
  // RGB of #000000 is rgb(0, 0, 0)
  static const Map<int, Color> primarySwatchColor = {
    50: Color.fromRGBO(67, 182, 71, .1),
    100: Color.fromRGBO(67, 182, 71, .2),
    200: Color.fromRGBO(67, 182, 71, .3),
    300: Color.fromRGBO(67, 182, 71, .4),
    400: Color.fromRGBO(67, 182, 71, .5),
    500: Color.fromRGBO(67, 182, 71, .6),
    600: Color.fromRGBO(67, 182, 71, .7),
    700: Color.fromRGBO(67, 182, 71, .8),
    800: Color.fromRGBO(67, 182, 71, .9),
    900: Color.fromRGBO(67, 182, 71, 1),
  };
  static const MaterialColor primaryColor = MaterialColor(0xff304443, primarySwatchColor);
  static const MaterialColor secondaryColor = MaterialColor(0xFFC29A6B, primarySwatchColor);

  static const Color surfaceColor = Color(0xFFFFFFFF);

  static const Color primaryLightColor = Color(0xff304443);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color orangeColor = Color(0xFFf39304);

  static const Color errorColor = Color(0xFFe74c3c);
  static const Color blueColor = Color.fromARGB(255, 0, 85, 255);
  static const Color redColor = Color(0xFFBB0100);
  static const Color greenColor = Color(0xFF107F3E);
  static const Color lightGreenColor = Color(0xFF20BE79);
  static const Color limitCrossedColor = Color(0xFFc0392b);
  static const Color appBgGreyColor = Color(0xffE7E7E7);

  static const Color foodColor = Color(0xFFEC6064);
  static const Color roomItemsColor = Color(0xFF67C0D1);
  static const Color maintenanceColor = Color(0xFFD18067);
  static const Color fuelColor = Color(0xFFe84393);
  static const Color moviesColor = Color(0xFF3533B8);
  static const Color restaurantColor = Color(0xFF9D4083);
  static const Color totalColor = Color(0xFF169871);

  static const Color generalTextColor = Color(0xFF1C1C1C);
  static const Color borderColor = Color(0xFFE7E7E7);

  static const Color lightGreyColor = Color.fromRGBO(18, 18, 18, 0.5);
  static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.08);

  static  Color bgColor = secondaryColor.withOpacity(0.1);
  static const Color bgGreyColor = Color(0xffE7E7E7);
  static const Color textFieldBgColor = Color(0xffE7E7E7);
  static const Color blackColor = Color(0xff121212);
  static const Color lightBlackColor = Color(0xff121212);
  static Color formBorderColor = blackColor.withOpacity(0.1);


  static const double elevationCard = 5;
  static const double buttonCircular = 8;
  static const double screenPaddingValue = 24;
  static const EdgeInsets screenPadding = EdgeInsets.all(screenPaddingValue);


  // static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.08);
  static const BoxShadow boxShadow1 = BoxShadow(
    color: shadowColor,
    blurRadius: 20.0,
    offset: Offset(0.0, 4.0),
    spreadRadius: 0.0,
  );
  static const BoxShadow boxShadow2 = BoxShadow(
    color: shadowColor,
    blurRadius: 20.0,
    offset: Offset(4.0, 4.0),
    spreadRadius: 0.0,
  );
  static double appRadius = 12;
  static RoundedRectangleBorder roundedRectangleBorder1 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );


  static BorderRadius borderRadiusRounded = BorderRadius.circular(appRadius);
  static BorderRadius cutomBorderRadiusRounded(double borderRadius) => BorderRadius.circular(borderRadius);
  static const TextStyle textStyle1 = TextStyle(
      fontSize: 12,
      color: lightBlackColor
  );
  static  TextStyle textStyleGrey = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(0.4)
  );
  static  TextStyle textStyleGrey14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.4)
  );

  static  TextStyle textStyleGrey16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black.withOpacity(0.4)
  );

  static  TextStyle textStyleblackshade14 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.6)
  );


  static  TextStyle textStylered14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ThemeConfig.redColor
  );


  static  TextStyle textStylegrey12 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ThemeConfig.lightGreyColor
  );

  static  TextStyle textStyleprimary12 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ThemeConfig.primary
  );

  static  TextStyle textStyleSecondary = const TextStyle(

      fontSize: 12,
      color:ThemeConfig.secondaryColor
  );
  static  TextStyle textStyleSecondary14 = const TextStyle(
      fontSize: 14,
      color:ThemeConfig.secondaryColor
  );

  // static const TextStyle textStyleTitle = TextStyle(
  //     fontSize: 16,
  //     color: secondaryColor,
  //     fontWeight: FontWeight.w700
  // );
  static const TextStyle textStyleSecondary20 = TextStyle(
      fontSize: 20,
      color: secondaryColor,
      fontWeight: FontWeight.w700
  );

  static const TextStyle textStyleListTileTitle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStyleHeading = TextStyle(
      fontSize: 22,
      color: secondaryColor,
      fontWeight: FontWeight.w700
  );
  static TextStyle textStyleHint = TextStyle(color: ThemeConfig.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: 0.5);
  static TextStyle textStyleListTileSubTitle = textStyleHint.copyWith(fontSize: 12);

  static const TextStyle textStyleHeadingWhite = TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w500
  );

  static const TextStyle textStyleAccent = TextStyle(
      fontSize: 12,
      color: secondaryColor,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStyleAccent6Bold = TextStyle(
      fontSize: 12,
      color: secondaryColor,
      fontWeight: FontWeight.w700
  );
  static const TextStyle textStylePrimary1 = TextStyle(
      fontSize: 16,
      color: primaryColor,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStylewhite16 = TextStyle(
      fontSize: 16,
      color:Colors.white,
      fontWeight: FontWeight.w500
  );

  static const TextStyle textStylewhite16500 = TextStyle(
      fontSize: 16,
      color:Colors.white,
      fontWeight: FontWeight.w600
  );

  static  TextStyle textStylePrimary16 = TextStyle(
      fontSize: 16,
      color:ThemeConfig.primary,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStylePrimary2 = TextStyle(
      fontSize: 14,
      color: primaryColor,
      fontWeight: FontWeight.w500
  );
  static  TextStyle minimumStyleGrey =  TextStyle(
      fontSize: 14,
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.w500
  );
  static  TextStyle minimumStyleGrey12 = const TextStyle(
      fontSize: 12,
      color: Colors.grey,
      fontWeight: FontWeight.w500
  );

  static TextStyle textStyleWithColor({Color? color}) => TextStyle(
      fontSize: 16,
      color: color ?? primaryColor,
      fontWeight: FontWeight.w500
  );
  static TextStyle textStyleWithColorBold({Color? color}) => TextStyle(
      fontSize: 16,
      color: color ?? primaryColor,
      fontWeight: FontWeight.w600
  );

  static TextStyle textStyleHeadingBlack({Color? color}) => const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500
  );
  static TextStyle textStyleHeadingBlack16({Color? color}) => const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStylePrimary6Bold = TextStyle(
      fontSize: 12,
      color: primaryColor,
      fontWeight: FontWeight.w700
  );
  static const TextStyle textStyleCaption = TextStyle(
      fontSize: 12,
      color: lightBlackColor,
      fontWeight: FontWeight.w300
  );

  static const TextStyle textStyleWhite = TextStyle(
      fontSize: 12,
      color: ThemeConfig.whiteColor,
      fontWeight: FontWeight.w500
  );

  static const TextStyle textStyleWhite14 = TextStyle(
      fontSize: 14,
      color: ThemeConfig.whiteColor,
      fontWeight: FontWeight.w500
  );

  static TextStyle rowTextStyle(bool isBold) => TextStyle(
      fontSize: 12,
      color: lightBlackColor,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w400
  );
  static double roundBorderRadius = 8;

  // static BoxDecoration boxDecorationWithRoundBorder(context, {
  //   Color? color, double? radius, String? bgImageUrl}) =>
  //     BoxDecoration(
  //         borderRadius: BorderRadius.circular(radius ?? roundBorderRadius),
  //         image: bgImageUrl == null ? null : DecorationImage(
  //             fit: BoxFit.cover,
  //             image: NetworkImage(bgImageUrl)),
  //         boxShadow: [
  //           BoxShadow(
  //               color: blackColor.withOpacity(0.2),
  //               blurRadius: 6,
  //               spreadRadius: 1)
  //         ],
  //         color: color ?? Theme.of(context).primaryColor);

  static TextStyle Medium16 = const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black);
  static TextStyle Large16Black = const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black);
  static TextStyle Large16white = const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white);
  static TextStyle Large14white = const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white);

  static TextStyle? textStyleSubTitle(context) => Theme.of(context).textTheme.bodyText2!.copyWith(color: blackColor.withOpacity(0.8));
 // static TextStyle? textStyleTitle(context) => TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1);

  static TextStyle Large20 = const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black);

  static TextStyle Medium14 = const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black);
  static TextStyle Medium14grey =   TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: ThemeConfig.blackColor.withOpacity(0.8));
  static TextStyle Medium12grey = const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey);
  static TextStyle Medium16grey =   TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey);

  static TextStyle primary14= TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: ThemeConfig.primary);

  static TextStyle Large14Black = const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black);

  static TextStyle Large12Black = const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.black);

  static Color greyLight= Colors.grey.withOpacity(0.2);

 // static Color redColor= Colors.red;

  static Widget divider = Container(
    height: 40,
    width: 2,
    color:ThemeConfig.greyLight,
  );



  static BoxDecoration boxDecorationWithRoundBorder(context, {
    Color? color, double? radius, String? bgImageUrl, BoxFit ?fit, double ?elivation, double ? spreadRadius ,Border? border}) =>

      BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? roundBorderRadius),
          image: bgImageUrl == null ? null : DecorationImage(
              fit: fit??BoxFit.cover,
              image: NetworkImage(bgImageUrl)),
          border:border,
          boxShadow: [
            BoxShadow(
                color: blackColor.withOpacity(0.1),
                blurRadius: elivation ?? 10,
                spreadRadius: spreadRadius?? 2)
          ],
          color: color ?? Theme.of(context).primaryColor.withOpacity(0.2)
      );

  static double borderRadius = 12;

  static Color primary= Color(0xFF0F4068);

  static TextStyle primary12= TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: ThemeConfig.primary);
  //static TextStyle primary16= TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: ThemeConfig.primary);

  static TextStyle red14= TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.red);
  static TextStyle red16= TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.red);
  static TextStyle red12medium= TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.red);

  static TextStyle primary145=  TextStyle(
      color:ThemeConfig.primary,
      fontWeight: FontWeight.w500,
      fontSize: 14);

  static TextStyle primary145black=  TextStyle(
      color:Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 14);
  static TextStyle primary16= TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: ThemeConfig.primary);
  static TextStyle primary20= TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: ThemeConfig.primary);


  static TextStyle redColor14= TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.red);




  static TextStyle? textStyleTitle(context) => TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1);


  static BoxDecoration radius=BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    color: ThemeConfig.whiteColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        offset: const Offset(
          1.0,
          1.0,
        ),
        blurRadius: 2.0,
        spreadRadius: 2.0,
      ),
      const BoxShadow(
        color:Colors.white38,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
    //boxShadow: [
    //   BoxShadow(
    //   color:Colors.grey.withOpacity(0.4),
    //   offset: const Offset(
    //     1.0,
    //     1.0,
    //   ),
    //   blurRadius: 1.0,
    //   spreadRadius: 1.0,
    // ), ]
  );

  static BoxDecoration radius_primaryColor=BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: ThemeConfig.primaryColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        offset: const Offset(
          1.0,
          1.0,
        ),
        blurRadius: 1.0,
        spreadRadius: 1.0,
      ),
      const BoxShadow(
        color:Colors.white38,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
    //boxShadow: [
    //   BoxShadow(
    //   color:Colors.grey.withOpacity(0.4),
    //   offset: const Offset(
    //     1.0,
    //     1.0,
    //   ),
    //   blurRadius: 1.0,
    //   spreadRadius: 1.0,
    // ), ]
  );


  static BoxDecoration radiuslaunch=BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: ThemeConfig.primaryColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        offset: const Offset(
          1.0,
          1.0,
        ),
        blurRadius: 1.0,
        spreadRadius: 1.0,
      ),
      const BoxShadow(
        color:Colors.white38,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
    //boxShadow: [
    //   BoxShadow(
    //   color:Colors.grey.withOpacity(0.4),
    //   offset: const Offset(
    //     1.0,
    //     1.0,
    //   ),
    //   blurRadius: 1.0,
    //   spreadRadius: 1.0,
    // ), ]
  );

}