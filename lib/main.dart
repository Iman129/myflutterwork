import 'package:flutter/material.dart';
import 'package:myfirst_app/pages/home_page.dart';
import 'package:myfirst_app/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirst_app/utils/routes.dart';
import 'package:myfirst_app/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String name = "Iman's";
    //var op = 5;
    //var day = 3.6;
    //const pi = 3.14; //constant value

    return MaterialApp(
      //home: HomePage(), y tw"/" routes wala use kro ya phr ye
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),//from class of theme
        //primaryTextTheme: GoogleFonts.latoTextTheme() //only used for primary tets
      darkTheme: MyTheme.darkTheme(context), //from class of theme
      initialRoute: MyRoutes.HomeRoute ,
      //initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(), //by default this page
        MyRoutes.HomeRoute: (context) => HomePage(),
       MyRoutes.LoginRoute: (context) => LoginPage()
      },
    );
  }
  // bringHomePageegetables({bool thaila=false,int rupees=100}){}
  //bringHomePageegetabless({@required bool thaila,int rupees=100}){}

}
