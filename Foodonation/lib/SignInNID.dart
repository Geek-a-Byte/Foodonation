import 'package:Foodonation/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homescreen.dart';

class SignInNID extends StatefulWidget {
  SignInNID({Key key}) : super(key: key);
  @override
  _SignInNIDState createState() => _SignInNIDState();
}

class _SignInNIDState extends State<SignInNID> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nidController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  //bool _showPass = false;

  // String title = "Sign in";
  //int NID = 2019140;

  var name = 'User';
  String pass = 'robocup';

  gotoHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  // void _toggle() {
  //   setState(() {
  //     _showPass = !_showPass;
  //   });
  // }

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
                  child: Form(
                    key: _formKey,
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
                                  top:
                                      MediaQuery.of(context).size.height * 0.01,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.03,
                                  left:
                                      MediaQuery.of(context).size.height * 0.01,
                                  right:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: emailController,
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'Your registered email ID is required';
                                        else
                                          return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: "Email : ",

                                        helperText: "fullname@foodonation.com",

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
                                        contentPadding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01,
                                        ),

                                        focusedBorder: new UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                      cursorColor: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.01,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.03,
                                  left:
                                      MediaQuery.of(context).size.height * 0.01,
                                  right:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: nidController,

                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'Your authorized NID is required';
                                        else
                                          return null;
                                      },
                                      // obscureText:
                                      //     (_showPass == true) ? false : true,
                                      decoration: InputDecoration(
                                        labelText: "NID : ",

                                        helperText:
                                            "Enter your authorized NID here",

                                        contentPadding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01,
                                        ),

                                        // suffixIcon: IconButton(
                                        //   onPressed: _toggle,
                                        //   icon: !_showPass
                                        //       ? Icon(Icons.visibility_off)
                                        //       : Icon(Icons.visibility),
                                        // ),

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
                                              BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                      cursorColor: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          try {
                                            FirebaseUser user = (await FirebaseAuth
                                                    .instance
                                                    .signInWithEmailAndPassword(
                                                        email: emailController
                                                            .text,
                                                        password:
                                                            nidController.text))
                                                .user;
                                            if (user != null) {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs?.setBool(
                                                  "isLoggedIn", true);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  //builder: (context) => OverviewScreen(user),
                                                  builder: (context) =>
                                                      HomeScreen(
                                                          // nameController.text

                                                          // //user: user,
                                                          // //name: userName,
                                                          ),
                                                ),
                                              );
                                            }
                                          } catch (e) {
                                            print(e);
                                            nidController.text = "";
                                            nameController.text = "";
                                            emailController.text = "";
                                            //todo: alertdialog with error
                                          }
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
                                        style: new TextStyle(
                                            color: Colors.black54),
                                      ),
                                      new TextSpan(
                                        text: 'Create one!',
                                        style:
                                            new TextStyle(color: Colors.blue),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUp()),
                                            );
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

//? this is a question
//* this is an important part of code or important comment
//TODO: this is for future plans of refactoring or updating the codes with new features
//! this is the error/mistake/bad execution of code which should be avoided for the next time
