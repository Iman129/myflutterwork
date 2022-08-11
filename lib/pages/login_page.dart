//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/utils/routes.dart';
//import 'package:material_color_utilities/material_color_utilities.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  bool ChangeButton = false; //abhi kuch nai hai iss ma
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
    setState(() {
      ChangeButton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.HomeRoute);
    setState(() {
      ChangeButton = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/doctor2_image.png",
                  height: 260,
                  width: 350,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 40.0, //width:200.0,
                  child: Text(
                    "SIA HOSPITAL",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),

                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can not be Empty";
                        }
                        return null; //yani koi error ni hai
                      },
                      
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter the Password";
                        }
                        else if(value.length<6)
                        {
                          {
                            return "Password Length should be greater than 6";
                          }
                        }
                        return null; //yani koi error ni hai
                      },
                    )
                  ]),
                ),
                SizedBox(
                  height: 20.0,
                ),

                Material(
                  borderRadius: BorderRadius.circular(ChangeButton ? 50 : 8),
                  color: Color.fromARGB(255, 48, 28, 131),
                  child: InkWell(
                    // hoverColor: Colors.pink,
                    onTap: () => moveToHome(context),
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
                      //decoration: BoxDecoration(
                      //  color: Colors.pink,
                      //shape: ChangeButton? BoxShape.circle : BoxShape.rectangle,
                      //borderradius orshapeek sath use nai kr sktay
                    ),
                  ),
                ),

                //////////////////////////SING UP WORK//////////////////////////////////////////

                Material(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 520, vertical: 5),
                      child: Row(
                        children: [
                          InkWell(
                            focusColor: Colors.white,
                            onTap: () async {
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 170,
                              //color: Colors.white,
                              child: Text(
                                "don't have an acount?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                //ChangeButton = true;
                              });
                              Navigator.pushNamed(context, MyRoutes.HomeRoute);
                            },
                            hoverColor: Colors.white,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 55,
                              // color: Colors.white,
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 18, 172),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                //ElevatedButton(
                //onPressed: () {
                //Navigator.pushNamed(context, MyRoutes.HomeRoute);
                //},
                //child: Text("Login"),
                //style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                //)
              ],
            ),
          ),
        ));
  }
}
