import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';


ThemeMode appMode = ThemeMode.light;

ThemeData get lightMode => ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    actionsIconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 23,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    contentPadding: EdgeInsetsDirectional.only(top: 5, start: 20),
    hintStyle: TextStyle(color: Colors.black),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: HexColor('3E424B'),
      fontFamily: 'AlmaraiRegular',
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      color: HexColor('12121D'),
      fontFamily: 'AlmaraiRegular',
      fontSize: 12.8,
    ),
    headline1: TextStyle(
      color: HexColor('12121D'),
      fontFamily: 'AlmaraiRegular',
      fontSize: 10.24,
    ),
    headline2: TextStyle(
      color: HexColor('000000'),
      fontFamily: 'AlmaraiRegular',
      fontSize: 10,
    ),
    headline3: TextStyle(
      color: HexColor('000000'),
      fontFamily: 'AlmaraiRegular',
      fontSize: 16,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.black),
  primaryIconTheme: IconThemeData(color: Colors.black),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
);
/*/////////////////////////////////////////// */ /*/////////////////////////////////////////// */
ThemeData get darkMode => ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor('#333739'),
    elevation: 0,
    actionsIconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: HexColor('FFFFFF'),
      fontFamily: 'AlmaraiRegular',
      fontSize: 14,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: HexColor('#212121'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: HexColor('333739'),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    contentPadding: EdgeInsetsDirectional.only(top: 5, start: 30),
    hintStyle: TextStyle(color: Colors.white),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: HexColor('FFFFFF'),
      fontFamily: 'AlmaraiRegular',
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      color: HexColor('FFFFFF'),
      fontFamily: 'AlmaraiRegular',
      fontSize: 12.8,
    ),
    headline1: TextStyle(
      color: Colors.grey,
      fontFamily: 'AlmaraiRegular',
      fontSize: 10.24,
    ),
    headline2: TextStyle(
      color: Colors.white54,
      fontFamily: 'AlmaraiRegular',
      fontSize: 10,
    ),
    headline3: TextStyle(
      color: HexColor('FFFFFF'),
      fontFamily: 'AlmaraiRegular',
      fontSize: 16,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('333739'),
      selectedItemColor: HexColor('FFFFFF'),
      unselectedItemColor:HexColor('000000'),
      type: BottomNavigationBarType.fixed),
  iconTheme: IconThemeData(color: Colors.white),
  primaryIconTheme: IconThemeData(color: Colors.white),
);
