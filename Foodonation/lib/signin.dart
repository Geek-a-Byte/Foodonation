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
        //color: Color(0xfff5f5f5),
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 0, //Width equal to device
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.35,
                    left: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.05,
                                bottom: MediaQuery.of(context).size.height * 0.03,
                                left: MediaQuery.of(context).size.height * 0.01,
                                right: MediaQuery.of(context).size.height * 0.01,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: "Name : ",

                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontFamily: 'HelveticaNeue',
                                    fontWeight: FontWeight.bold,
                                  ),

                                  hintText: "Your Name",
                                  contentPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height * .05,
                                  ),
                                  hintStyle: TextStyle(color: Colors.black54),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
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
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01,
                                bottom: MediaQuery.of(context).size.height * 0.03,
                                left: MediaQuery.of(context).size.height * 0.01,
                                right: MediaQuery.of(context).size.height * 0.01,
                              ),
                              child: TextFormField(
                                controller: passwordcontroller,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Phone No : ",

                                  hintText: "01*********",
                                  contentPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height * .05,
                                  ),

                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontFamily: 'HelveticaNeue',
                                    fontWeight: FontWeight.bold,
                                  ),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
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
                                  padding: const EdgeInsets.all(25.0),
                                  child: ButtonTheme(
                                    minWidth: 150,
                                    height: 40,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                              fontFamily: 'HelveticaNeue',
                                              fontWeight: FontWeight.bold,
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
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * .075,
                              ),
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: "Don't have an account? ",
                                      style:
                                          new TextStyle(color: Colors.black54),
                                    ),
                                    new TextSpan(
                                      text: 'Create one!',
                                      style: new TextStyle(color: Colors.blue),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                              context, '/SignUp');
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
              ],
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
