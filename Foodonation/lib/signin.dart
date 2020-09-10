import 'dart:convert';
import 'package:Foodonation/homescreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Foodonation/settings.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // TextEditingController confirmpasswordcontroller = TextEditingController();
  //TextEditingController nidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  // String title = "Sign in";
  //int NID = 2019140;
  String name = 'RoboCup';
  String pass = 'robocup';

  gotoHomeScreen(String userName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  signin() async {
    var response;

    var data = {
      //"nid": nidController.text,
      //"name": nameController.text,
      //"password": passwordcontroller.text

      //Temporary data
      //"nid": NID,
      "name": name,
      "password": pass,
    };

    //response = await http.post(baseURL + "signin.php", body: jsonEncode(data));
    response = await http.post(baseURL + "signin.php", body: jsonEncode(data));
    //print(response.body);

    var jsonbody = jsonDecode(response.body);
    //print(jsonbody);

    // String jsonsDataString = response.body
    //     .toString(); // toString of Response's body is assigned to jsonDataString
    // var jsonbody = jsonDecode(jsonsDataString);
    //if (jsonbody["nid"] == nidController.text &&
    //   jsonbody["name"] == nameController.text &&
    //    jsonbody["password"] == passwordcontroller.text) {
    if (jsonbody["name"] == name && jsonbody["password"] == pass) {
      SuccessAlertBox(
          context: context,
          title: "congrats!",
          messageText: "You are logged in, now select your package!");

      //print(7);
      setValue("isLoggedin", "true");
      setValue("name", jsonbody["name"]);
      //setValue("nid", jsonbody["nid"]);
      setValue("phone", jsonbody["phone"]);
      //print(8);
      //navigation through pages
      //Navigator.pushNamed(context, '/dashboard');
      print("Parsi mamma");

      gotoHomeScreen(name);
    } else if (jsonbody["success"] == "10") {
      print("Invalid NID or password");
      WarningAlertBox(
          context: context,
          title: "Wait!",
          messageText: "Invalid username or password");
    }

    /// Navigator.pushNamed(context, '/dashboard');
    /*,style: TextStyle(fontSize: 15,color: Colors.black),*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffdfe6e9),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 21,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 28.0),
                        child: Text(
                          "Sign in",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 28,
                              color: Colors.lightBlue[900],
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Name : ".toUpperCase(),

                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black54),

                            hintText: "Your Name",

                            hintStyle: TextStyle(color: Colors.black54),

                            enabledBorder: new UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                            ),

                            // and:

                            focusedBorder: new UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          cursorColor: Colors.black54,
                          //cursorWidth: 7.000000,
                          //cursorRadius: Radius.elliptical(10, 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Phone No : ".toUpperCase(),

                            hintText: "*********",

                            labelStyle: TextStyle(color: Colors.black54),

                            enabledBorder: new UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                            ),

                            // and:

                            focusedBorder: new UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          cursorColor: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ButtonTheme(
                              minWidth: 88,
                              height: 38,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                color: Color(0xff0984e3),
                                child: Row(
                                  children: <Widget>[
                                    //Icon(Icons.person_add, color: Colors.white),  I PERSONALLY DON'T PREFER THIS THO
                                    Text(
                                      "Sign in",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                //color: Colors.black,    I CHANGED THIS//RAIYAN
                                onPressed: () => gotoHomeScreen(name),
                              ),
                            ),
                          ), //raised button
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new RichText(
                          text: new TextSpan(
                            children: [
                              new TextSpan(
                                text: "Don't have an account? ",
                                style: new TextStyle(color: Colors.black),
                              ),
                              new TextSpan(
                                text: 'Create One!',
                                style: new TextStyle(color: Colors.blue),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/SignUp');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//? this is a question
//* this is an important part of code or important comment
//TODO: this is for future plans of refactoring or updating the codes with new features
//! this is the error/mistake/bad execution of code which should be avoided for the next time
