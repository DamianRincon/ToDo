import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFF030304),
  fontFamily: 'Products',
  appBarTheme: AppBarTheme(
    brightness: Brightness.dark,
    color: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white)
  ),
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF030304),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.blueGrey[900]
    )
  ),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Products',
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.blueGrey[900]),
    actionsIconTheme: IconThemeData(color: Colors.blueGrey[900])
  ),
  accentColorBrightness: Brightness.light,
  primarySwatch: Colors.grey,
  primaryColor: Color(0xff2A024A),
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  accentColor: Colors.blueGrey[900],
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);