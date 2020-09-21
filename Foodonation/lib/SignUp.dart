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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                    top: devSize.height * .12,
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
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        // padding: const EdgeInsets.all(15.0),
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
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.03,
                                  left:
                                      MediaQuery.of(context).size.height * 0.01,
                                  right:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),

                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                  controller: nameController,
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return 'Your Full name is Required';
                                    else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Name:",

                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w700,
                                    ),

                                    helperText:
                                        "Enter your full name here(as per NID card)",

                                    helperStyle: TextStyle(
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueGrey),
                                    contentPadding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ), //added by nazia it will give btn helpertext and labeltext

                                    enabledBorder: new UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),

                                    // and:

                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ),

                              Padding(
                                //padding: const EdgeInsets.all(10.0),
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.03,
                                  left:
                                      MediaQuery.of(context).size.height * 0.01,
                                  right:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                  controller: emailController,
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return 'Email id is required';
                                    else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Email:",

                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black54),

                                    helperText: "fullname@foodonation.com",

                                    helperStyle: TextStyle(
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueGrey),
                                    contentPadding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ), //added by nazia it will give btn helpertext and labeltext
                                    enabledBorder: new UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),

                                    // and:

                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                  //cursorWidth: 7.000000,
                                  //cursorRadius: Radius.elliptical(10, 15),
                                ),
                              ),

                              Padding(
                                //padding: const EdgeInsets.all(10.0),
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.03,
                                  left:
                                      MediaQuery.of(context).size.height * 0.01,
                                  right:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                  controller: nidController,
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return 'Your authorized NID is required';
                                    else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "NID:",

                                    helperText:
                                        "Enter your authorized NID here",
                                    helperStyle: TextStyle(
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueGrey),

                                    labelStyle: TextStyle(
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Colors.black54),

                                    enabledBorder: new UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),

                                    // and:
                                    // contentPadding: EdgeInsets.only(
                                    //     top:
                                    //         4.0), //added by nazia it will give btn helpertext and labeltext

                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ),
                              Padding(
                                //padding: const EdgeInsets.all(10.0),
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.03,
                                  left:
                                      MediaQuery.of(context).size.height * 0.01,
                                  right:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                  controller: nidController,
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return 'Please confirm your NID';
                                    else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Confirm NID:",

                                    helperText: "Rewrite/Confirm your NID here",
                                    helperStyle: TextStyle(
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueGrey),

                                    labelStyle: TextStyle(
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Colors.black54),

                                    enabledBorder: new UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),

                                    // and:
                                    // contentPadding: EdgeInsets.only(
                                    //     top:
                                    //         4.0), //added by nazia it will give btn helpertext and labeltext

                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ),

                              //Buttons
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          _formKey.currentState.validate()
                                              ? Scaffold(
                                                  body: Builder(
                                                    builder: (context) =>
                                                        Text('This is valid.'),
                                                  ),
                                                )
                                              : Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "This is not valid.")));
                                          // if (nidController.text !=
                                          //     confirmNIDcontroller.text) {
                                          //   WarningAlertBox(
                                          //       context: context,
                                          //       title: "wait!",
                                          //       messageText:
                                          //           "password and confirm pasword doesn't match.");
                                          // }
                                          try {
                                            FirebaseUser user = (await FirebaseAuth
                                                    .instance
                                                    .createUserWithEmailAndPassword(
                                                        email: emailController
                                                            .text,
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
                                        style: new TextStyle(
                                            color: Colors.black54),
                                      ),
                                      new TextSpan(
                                        text: 'Sign in!',
                                        style:
                                            new TextStyle(color: Colors.blue),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
