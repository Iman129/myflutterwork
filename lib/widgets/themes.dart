import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  //for light theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
            //har jagah appbar show hogi har page pe\
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0, // sab appbars pe ye laagu hoga
            color: Theme.of(context)
                .colorScheme
                .surface, //using instead o texttheme
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 24) //using instead o texttheme
            ),
      );


  //for dark theme
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}
