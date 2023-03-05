import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Environment {
  static String apiUrl = "https://api.themoviedb.org/3/";
  static String apiUrlImage = "https://image.tmdb.org/t/p/w500";
  static String apiKey = "d5a5040206a72611d1df109b3f7b72bc";
}

class CustomColors {
  static final primaryColor = Color(0xFFFFFFFF);
  static final secondaryColor = Color.fromARGB(255, 245, 234, 14);
  static final tertiaryColor = Color(0xFF5840EE);
  static final quaternaryColor = Color(0xFF973FEF);
  static final quintonaryColor = Color(0xFF404B52);
  static final sextonaryColor = Color(0xFF0A0615);
  static final backgroundColor = Color(0xFF23252C);
  static final fieldColor = Color(0xFF111111);
}

final normalPhoneTheme = ThemeData(
  textTheme: GoogleFonts.dmSansTextTheme(),
  scaffoldBackgroundColor: CustomColors.backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: CustomColors.backgroundColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: CustomColors.quaternaryColor,
  ),
  fontFamily: "Manrope",
);

// final smallPhoneTheme = ThemeData(
//   primaryColor: Colors.black, 
//   accentColor: Colors.black,
//   scaffoldBackgroundColor: Colors.white,
//   // textTheme: TextTheme(
//   //   headline1: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 27, color: CustomColors.pink, fontWeight: FontWeight.w700) ),
//   //   headline2: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 21, color: Colors.black, fontWeight: FontWeight.w400) ),
//   //   headline3: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700) ),
//   //   headline4: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600) ),
//   //   // bodyText1: TextStyle(fontSize: 15.0, color: CustomColors.darkGray),
//   //   bodyText2: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w400) ),
//   //   caption:  GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12, color: CustomColors.grey, fontWeight: FontWeight.w400) ),
//   //   button: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600) ),

//   // ),
//   appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
// );
