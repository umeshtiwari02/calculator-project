import 'package:flutter/material.dart';

const color_tD = Colors.white;
const color_tL = Colors.black;
const color_bD = Color.fromARGB(96, 26, 22, 22);
const color_bL = Color.fromARGB(153, 255, 255, 255);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: color_bD,
  drawerTheme: const DrawerThemeData(
    backgroundColor: color_bL,
    scrimColor: Color.fromARGB(255, 121, 192, 250)
  ),
  appBarTheme: AppBarTheme(
    // backgroundColor: Colors.blue,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    // backgroundColor: Colors.purple
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: color_bD,
    scrimColor: Color.fromARGB(255, 185, 233, 210),
  ),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white)
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(color: color_bL)
  )
  );
