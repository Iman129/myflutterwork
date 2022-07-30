import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool ChangeButton = false; //abhi kuch nai hai iss ma
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0, //width:200.0,
                child: Text("SizedBox"),
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "User Name Here",
                      labelText: "User Name",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(
                          () {}); //used to make changes , it is calling build function in stateful widget
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password  Here",
                      labelText: "Password",
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 20.0,
              ),

              InkWell(
                onTap: () async {
                 setState(() {
                    ChangeButton = true;
                  });
                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, MyRoutes.HomeRoute);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: ChangeButton ? 50 : 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: ChangeButton
                      ? Icon(
                          Icons.done_all,
                          color: Colors.white,
                        )
                      : Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      //shape: ChangeButton? BoxShape.circle : BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(ChangeButton
                          ? 50
                          : 8)), //borderradius orshapeek sath use nai kr sktay
                ),
              ),
              //ElevatedButton(
              //onPressed: () {
              //Navigator.pushNamed(context, MyRoutes.HomeRoute);
              //},
              //child: Text("Login"),
              //style: TextButton.styleFrom(minimumSize: Size(150, 50)),
              //)
            ],
          ),
        ));
  }
}
