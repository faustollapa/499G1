import 'package:flutter/material.dart';
import 'package:tales_of_tourists/widgets/text_theme.dart';
import 'button_theme.dart';

/*
   Color theme for app
   I got my knowledge from 
    - https://youtu.be/TrXU0Q5-jMs
*/
class AppTheme {
  
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: MainTextTheme.lightTextTheme,
    outlinedButtonTheme: MainButtonTheme.lightButtonTheme,
    elevatedButtonTheme: MainElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: MainTextTheme.darkTextTheme,
    outlinedButtonTheme: MainButtonTheme.darkButtonTheme,
    elevatedButtonTheme: MainElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
  );
}
