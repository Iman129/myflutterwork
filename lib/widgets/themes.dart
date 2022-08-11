import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart%20';

class MyTheme {
  //for light theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
   // brightness: Brightness.light,
      // primarySwatch:Colors.pink,
        // ignore: deprecated_member_use
      canvasColor: creamColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        buttonColor: darkbluishColor,
      accentColor: Colors.black,
        appBarTheme: AppBarTheme(
          //color: Colors.black, //using instead o texttheme
          //har jagah appbar show hogi har page pe\
          elevation: 0.0, // sab appbars pe ye laagu hoga
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 24), //using instead o texttheme
          iconTheme:
              IconThemeData(color: Colors.white), //using instead o texttheme
        ),
      );

  //for dark theme
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      accentColor: Colors.white,
      buttonColor: indigoColor,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      appBarTheme: AppBarTheme(
        color: Colors.black, //using instead o texttheme
        //har jagah appbar show hogi har page pe\
        elevation: 0.0, // sab appbars pe ye laagu hoga
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 24), //using instead o texttheme
        iconTheme: IconThemeData(color: Colors.white),
      ));

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray800;
  static Color darkbluishColor = Color.fromARGB(255, 20, 10, 72);
  static Color indigoColor = Color.fromARGB(255, 94, 87, 229);
}
