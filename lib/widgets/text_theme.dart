import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/color.dart';

/*
  Themes for text and text forms
  I got my knowledge from 
    - https://youtu.be/TrXU0Q5-jMs
*/

class MainTextTheme {
  
  MainTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: darkColor),
    displayMedium: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: darkColor),
    displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: darkColor),
    headlineMedium: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: darkColor),
    titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: darkColor),
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: darkColor),
    bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: darkColor),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: whiteColor),
    displayMedium: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: whiteColor),
    displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: whiteColor),
    headlineMedium: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: whiteColor),
    titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: whiteColor),
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: whiteColor),
    bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: whiteColor),
  );
}

class TextFormFieldTheme {
    TextFormFieldTheme._();

    static InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
        prefixIconColor: secondaryColor,
        floatingLabelStyle: const TextStyle(color: secondaryColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            width: 2, 
            color: secondaryColor
          ),
        )
      );

    static InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
        prefixIconColor: primaryColor,
        floatingLabelStyle: const TextStyle(color: primaryColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            width: 2, 
            color: primaryColor,
          ),
        )
      );
}
