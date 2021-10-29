import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightMode = ThemeData(
  //0xff1E2336
  //0xff171D2D
  //0xff26272c
  //0xff292c35
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.deepOrange,
  tabBarTheme: const TabBarTheme(
    unselectedLabelColor: Colors.grey,
    labelColor: Colors.black,
    indicatorSize: TabBarIndicatorSize.label,
  ),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(color: Colors.black),
    backwardsCompatibility: false,
    titleTextStyle: TextStyle(
        color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.w600),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  //primaryColor: Colors.grey[100],
  backgroundColor: Colors.grey[100],
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
      height: 1.3,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  //0xff1E2336
  //0xff171D2D
  //0xff26272c
  //0xff292c35
  scaffoldBackgroundColor: const Color(0xff171D2D),
  primarySwatch: Colors.deepOrange,
  tabBarTheme: const TabBarTheme(
    unselectedLabelColor: Colors.grey,
    labelColor: Colors.white,
    indicatorSize: TabBarIndicatorSize.label,
  ),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(color: Colors.white),
    backwardsCompatibility: false,
    titleTextStyle: TextStyle(
        color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.w600),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff171D2D),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Color(0xff171D2D),
    elevation: 0,
  ),
  //primaryColor: Color(0xff1E2336),
  backgroundColor: const Color(0xff1E2336),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
      height: 1.3,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
);