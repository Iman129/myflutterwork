// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart%20';

class MyTheme {
  //for light theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(

        // ignore: deprecated_member_use
      canvasColor: creamColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        // ignore: deprecated_member_use
        buttonColor: darkbluishColor,
      // ignore: deprecated_member_use
      accentColor: Colors.black,
        appBarTheme: AppBarTheme(
          //color: Colors.black, //using instead o texttheme
          //har jagah appbar show hogi har page pe\
          elevation: 0.0, // sab appbars pe ye laagu hoga
        //using instead o texttheme
          iconTheme:
              IconThemeData(color: Colors.white), //using instead o texttheme
             textTheme: Theme.of(context).textTheme
        ),
      );

  //for dark theme
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      // ignore: deprecated_member_use
      accentColor: Colors.white,
      // ignore: deprecated_member_use
      buttonColor: indigoColor,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      appBarTheme: AppBarTheme(
        color: Colors.white, //using instead o texttheme
        //har jagah appbar show hogi har page pe\
        elevation: 0.0, // sab appbars pe ye laagu hoga
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 24),
           // backgroundColor: Colors.white, //using instead o texttheme
        iconTheme: IconThemeData(color: Colors.white),
        // ignore: deprecated_member_use
        textTheme: Theme.of(context).textTheme
      ));

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray800;
  static Color darkbluishColor = Color.fromARGB(255, 20, 10, 72);
  static Color indigoColor = Color.fromARGB(255, 94, 87, 229);
}
