import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';

import 'HomeScreen.dart';
import 'SignInNID.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //bool _showPhn = false;
  bool _showNID = false;
  bool _showConfirmNID = false;

  String title = "Sign in";
  TextEditingController nidController = TextEditingController();
  TextEditingController confirmNIDcontroller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // signup() async {
  //   var response;
  //   if (passwordcontroller.text == confirmpasswordcontroller.text) {
  //     var data = {
  //       "NID": nidController.text,
  //       "password": passwordcontroller.text
  //     };

  //     response =
  //         await http.post(baseURL + "/signup.php", body: jsonEncode(data));
  //     print(response.body);
  //     SuccessAlertBox(
  //         context: context, title: "great", messageText: response.body);
  //     Navigator.pushNamed(context, '/dashboard');

  //     /// Navigator.pushNamed(context, '/dashboard');
  //     /*,style: TextStyle(fontSize: 15,color: Colors.black),*/

  //   } else {
  //     WarningAlertBox(
  //         context: context,
  //         title: "wait!",
  //         messageText: "password and confirm pasword doesn't match.");
  //   }
  // }

  void _toggleNID() {
    setState(() {
      _showNID = !_showNID;
    });
  }

  void _toggleConfirmNID() {
    setState(() {
      _showConfirmNID = !_showConfirmNID;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size devSize = MediaQuery.of(context).size; //Gets device dimension

    return Scaffold(
      body: Container(
        //color: Color(0xffdfe6e9),
        color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Create account
                Padding(
                  padding: EdgeInsets.only(
                    top: devSize.height * .2,
                    left: devSize.width * .06,
                  ),
                  child: Text(
                    "Create  Account",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      //wordSpacing: 10,
                    ),
                  ),
                ),

                Expanded(
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.only(top: devSize.height * .03),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),

                            Padding(
                              //padding: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.only(
                                left: 15,
                                top: 50,
                                right: 15,
                                bottom: 15,
                              ),

                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: "Name:",

                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontFamily: 'HelveticaNeue',
                                    fontWeight: FontWeight.w700,
                                  ),

                                  hintText: "Your Name",

                                  hintStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey),
                                  contentPadding: EdgeInsets.only(
                                      top:
                                          4.0), //added by nazia it will give btn hinttext and labeltext

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
                              //padding: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.only(
                                left: 15,
                                //top: 20,
                                right: 15,
                                bottom: 15,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Email:",

                                  labelStyle: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black54),

                                  hintText: "Your email id",

                                  hintStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey),
                                  contentPadding: EdgeInsets.only(
                                      top:
                                          4.0), //added by nazia it will give btn hinttext and labeltext
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
                              //padding: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.only(
                                left: 15,
                                //top: 20,
                                right: 15,
                                bottom: 15,
                              ),
                              child: TextFormField(
                                controller: nidController,
                                obscureText: (_showNID == true) ? false : true,
                                decoration: InputDecoration(
                                  labelText: "NID:",

                                  hintText: "*********",
                                  hintStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey),

                                  suffixIcon: IconButton(
                                    onPressed: _toggleNID,
                                    icon: !_showNID
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                  ),

                                  labelStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Colors.black54),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),

                                  // and:
                                  // contentPadding: EdgeInsets.only(
                                  //     top:
                                  //         4.0), //added by nazia it will give btn hinttext and labeltext

                                  focusedBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                cursorColor: Colors.black,
                              ),
                            ),

                            Padding(
                              //padding: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.only(
                                left: 15,
                                //top: 20,
                                right: 15,
                                bottom: 15,
                              ),
                              child: TextFormField(
                                controller: confirmNIDcontroller,
                                obscureText:
                                    (_showConfirmNID == true) ? false : true,
                                decoration: InputDecoration(
                                  labelText: "Confirm NID:",

                                  hintText: "*********",
                                  hintStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey),
                                  //contentPadding: EdgeInsets.only(top: 4.0),

                                  suffixIcon: IconButton(
                                    onPressed: _toggleConfirmNID,
                                    icon: !_showConfirmNID
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                  ),

                                  labelStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Colors.black54),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),

                                  // and:
                                  // contentPadding: EdgeInsets.only(
                                  //     top:
                                  //         4.0), //added by nazia it will give btn hinttext and labeltext

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
                                  padding: const EdgeInsets.all(10.0),
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
                                      onPressed: () async {
                                        try {
                                          FirebaseUser user = (await FirebaseAuth
                                                  .instance
                                                  .createUserWithEmailAndPassword(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          nidController.text))
                                              .user;
                                          if (user != null) {
                                            UserUpdateInfo updateUser =
                                                UserUpdateInfo();
                                            //take input from the app
                                            updateUser.displayName =
                                                nameController.text;
                                            //push the inputted name to database
                                            user.updateProfile(updateUser);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignInNID()),
                                            );
                                          }
                                        } catch (e) {
                                          print(e);
                                          nidController.text = "";
                                          nameController.text = "";
                                          emailController.text = "";
                                          confirmNIDcontroller.text = "";
                                        }
                                      },
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
                                      style:
                                          new TextStyle(color: Colors.black54),
                                    ),
                                    new TextSpan(
                                      text: 'Sign in!',
                                      style: new TextStyle(color: Colors.blue),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                              context, '/signin');
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
