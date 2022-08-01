import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class MyDrawer extends StatelessWidget {
  @override
  void moveToLogin(BuildContext context) async {
    Navigator.pushNamed(context, MyRoutes.LoginRoute);
  }

  Widget build(BuildContext context) {
    final imageURL =
        "https://i.pinimg.com/236x/6f/2b/fa/6f2bfa34307900917673efefa5858d88.jpg";
    final image2URL =
        "https://images-na.ssl-images-amazon.com/images/I/81E0VRuY5IL.png";
    return Drawer(
      child: Container(
        color: Colors.pink,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                // decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Text("Iman Ali"),
                accountEmail: Text("aliiman288@gmail.com"),
                //currentAccountPicture: Image.network(imageURL),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imageURL)),
                otherAccountsPictures: [
                  CircleAvatar(backgroundImage: NetworkImage(image2URL))
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.clock,
                color: Colors.white,
              ),
              title: Text(
                "Clock",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                moveToLogin(context);
              },
              leading: Icon(
                CupertinoIcons.doc_fill,
                color: Colors.white,
              ),
              title: Text(
                "Go back to Login",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
