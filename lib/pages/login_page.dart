import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/utils/routes.dart';

class LoginPage extends StatelessWidget {
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
                "Welcome",
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.HomeRoute);
                },
                child: Text("Login"),
                style: TextButton.styleFrom(minimumSize: Size(150, 50)),
              )
            ],
          ),
        ));
  }
}
