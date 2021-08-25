import 'package:flutter/material.dart';

ThemeData standardTheme = ThemeData(
  fontFamily: 'Raleway',
  scaffoldBackgroundColor: Colors.white30,
  appBarTheme: AppBarTheme(
    color: Colors.amber.withAlpha(500),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black26.withOpacity(0.8),
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0
      )
    )
  ),
  iconTheme: IconThemeData(
    color: Colors.white.withOpacity(1.0),
    size: 30.0,
  ),
  accentColor: Colors.blueAccent[300],
);