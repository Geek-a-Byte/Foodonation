import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Foodonation/settings.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String title = "Sign in";
  TextEditingController nidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController AddController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  signup() async {
    var response;
    if (passwordcontroller.text == confirmpasswordcontroller.text) {
      var data = {
        "NID": nidController.text,
        "password": passwordcontroller.text
      };

      response =
          await http.post(baseURL + "/signup.php", body: jsonEncode(data));
      print(response.body);
      SuccessAlertBox(
          context: context, title: "great", messageText: response.body);
      Navigator.pushNamed(context, '/dashboard');

      /// Navigator.pushNamed(context, '/dashboard');
      /*,style: TextStyle(fontSize: 15,color: Colors.black),*/

    } else {
      WarningAlertBox(
          context: context,
          title: "wait!",
          messageText: "password and confirm pasword doesn't match.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffdfe6e9),
        child: Center(
          child: Card(
            margin: EdgeInsets.all(28.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),

            //color: Color(hashCode),

            //color: Color.fromRGBO(0, 0, 40, 0.35),

            //color : const Color(0XFF880E4F), //0xff hocche opacity

            color: Colors.white,

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Create account
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text("Create  Account",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 30,
                              color: Colors.lightBlue[900],
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w700,
                              //wordSpacing: 10,
                            ),
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name:".toUpperCase(),

                          labelStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            fontFamily: 'HelveticaNeue',
                            fontWeight: FontWeight.w700,
                          ),

                          hintText: "Your Name",

                          hintStyle: TextStyle(color: Colors.blueGrey),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                        //cursorWidth: 7.000000,
                        //cursorRadius: Radius.elliptical(10, 15),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        controller: AddController,
                        decoration: InputDecoration(
                          labelText: "Address:".toUpperCase(),

                          labelStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),

                          hintText: "Your Address",

                          hintStyle: TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                        //cursorWidth: 7.000000,
                        //cursorRadius: Radius.elliptical(10, 15),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        controller: nidController,
                        decoration: InputDecoration(
                          labelText: "NID:".toUpperCase(),

                          labelStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),

                          hintText: "Your NID",

                          hintStyle: TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                        //cursorWidth: 7.000000,
                        //cursorRadius: Radius.elliptical(10, 15),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                        controller: contactController,
                        decoration: InputDecoration(
                          labelText: "Phone no:".toUpperCase(),

                          labelStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),

                          hintText: "Your phone number",

                          hintStyle: TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
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
                          labelText: "Password:".toUpperCase(),

                          hintText: "*********",

                          labelStyle: TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.black54),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: confirmpasswordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password:".toUpperCase(),

                          hintText: "*********",

                          labelStyle: TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.black54),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),

                    //Buttons
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
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'Avenir',
                                    ),
                                  ),
                                ],
                              ),
                              //color: Colors.black,    I CHANGED THIS//RAIYAN
                              onPressed: signup,
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
                              text: "Already have an account? ",
                              style: new TextStyle(color: Colors.black54),
                            ),
                            new TextSpan(
                              text: 'Sign in!',
                              style: new TextStyle(color: Colors.blue),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/signin');
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
    );
  }
}
