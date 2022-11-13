import 'package:flutter/material.dart';
import './theme_config.dart';


class ThemeProvider {
  static ThemeData appTheme = ThemeData(
    primarySwatch: ThemeConfig.primaryColor,
    primaryColor: ThemeConfig.primaryColor,
    brightness: Brightness.light,

    // backgroundColor: ThemeConfig.bgColor,
    // scaffoldBackgroundColor: ThemeConfig.bgColor,
    fontFamily: 'Inter',
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ThemeConfig.primaryColor,
      onPrimary: ThemeConfig.whiteTextColor,
      secondary: ThemeConfig.secondaryColor,
      onSecondary: ThemeConfig.whiteTextColor,
      error: ThemeConfig.errorColor,
      onError: ThemeConfig.whiteTextColor,
      background: ThemeConfig.bgColor,
      onBackground: ThemeConfig.generalTextColor,
      surface: ThemeConfig.surfaceColor,
      onSurface: ThemeConfig.generalTextColor,),
    appBarTheme:  const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ThemeConfig.whiteTextColor,
      ),
      elevation: 0,
    ),
    dividerColor: ThemeConfig.lightGreyColor,
    primaryTextTheme: const TextTheme(
      headline5: TextStyle(
        color: ThemeConfig.generalTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      headline6: TextStyle(
        color: ThemeConfig.generalTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      subtitle1: TextStyle(
        color: ThemeConfig.generalTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      subtitle2: TextStyle(
        color: ThemeConfig.generalTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
      bodyText1: TextStyle(
        color: ThemeConfig.generalTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      bodyText2: TextStyle(
        color: ThemeConfig.generalTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      caption: TextStyle(
        color: ThemeConfig.generalTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      button: TextStyle(
        color: ThemeConfig.generalTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    ),
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
      headline2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      headline6: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal,fontWeight: FontWeight.w600),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind',fontWeight: FontWeight.w600,),
    ),
  );
}