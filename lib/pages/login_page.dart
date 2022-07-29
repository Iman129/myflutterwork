import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                print("Hello its your profile page");
              },
              child: Text("Login"),
              style: TextButton.styleFrom(),
            )
          ],
        ));
  }
}
