import 'dart:convert';
import 'package:Foodonation/homescreen.dart';
import 'package:Foodonation/screens/overview_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  //taking the input from the user
  //TextEditingController nameController = TextEditingController();
  //TextEditingController phonecontroller = TextEditingController();
  //TextEditingController codecontroller = TextEditingController();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  bool _showPass = false;

  Future<void> loginUser(
      String phone, BuildContext context, String userName) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    print(phone);
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();

        AuthResult result = await _auth.signInWithCredential(credential);

        FirebaseUser user = result.user;

        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              //builder: (context) => OverviewScreen(user),
              builder: (context) => HomeScreen(
                user: user,
                name: userName,
              ),
            ),
          );
        } else {
          print("Error");
        }
        //this verification is done when
      },
      verificationFailed: (AuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        print('Verification id is:');
        print(verificationId);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                  title: Text("Give me code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                          verificationId: verificationId,
                          //verificationId: "8801928943835",
                          //verificationId: "8801840054144",
                          //smsCode: "12345"
                          smsCode: code,
                          //name:_nameController;
                        );

                        AuthResult result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => OverviewScreen(user),
                              builder: (context) => HomeScreen(
                                user: user,
                                name: userName,
                              ),
                            ),
                          );
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ]);
            });
      },
      codeAutoRetrievalTimeout: null,
    );
  }
  // String title = "Sign in";
  //int NID = 2019140;

  var name = 'User';
  String pass = 'robocup';

  gotoHomeScreen(var userName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void _toggle() {
    setState(() {
      _showPass = !_showPass;
    });
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
                                bottom:
                                    MediaQuery.of(context).size.height * 0.03,
                                left: MediaQuery.of(context).size.height * 0.01,
                                right:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              child: TextFormField(
                                controller: _nameController,

                                decoration: InputDecoration(
                                  labelText: "Name : ",

                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontFamily: 'HelveticaNeue',
                                    fontWeight: FontWeight.bold,
                                  ),

                                  hintText: "Your Name",
                                  // contentPadding: EdgeInsets.only(
                                  //   bottom: MediaQuery.of(context).size.height *
                                  //       .05,
                                  // ),
                                  hintStyle: TextStyle(color: Colors.black54),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                  ),

                                  // and:

                                  focusedBorder: new UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
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
                                bottom:
                                    MediaQuery.of(context).size.height * 0.03,
                                left: MediaQuery.of(context).size.height * 0.01,
                                right:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _phoneController,
                                    obscureText:
                                        (_showPass == true) ? false : true,
                                    decoration: InputDecoration(
                                      labelText: "Phone No : ",

                                      hintText: "01*********",

                                      // contentPadding: EdgeInsets.only(
                                      //   bottom:
                                      //       MediaQuery.of(context).size.height *
                                      //           .05,
                                      // ),

                                      suffixIcon: IconButton(
                                        onPressed: _toggle,
                                        icon: _showPass
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                      ),

                                      labelStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.bold,
                                      ),

                                      border: new UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black38),
                                      ),

                                      // and:

                                      focusedBorder: new UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ],
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
                                            BorderRadius.circular(12.0),
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
                                      //onPressed: () => gotoHomeScreen(name),
                                      onPressed: () {
                                        final phone =
                                            _phoneController.text.trim();
                                        loginUser(phone, context,
                                            _nameController.text.toString());
                                      },
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
