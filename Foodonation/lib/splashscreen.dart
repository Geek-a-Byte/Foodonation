import 'dart:async';
import 'package:Foodonation/PageOne.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SignUp.dart';
import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    //Get device size
    Size devSize = MediaQuery.of(context).size;

    return MaterialApp(
      // routes: {
      //   '/receiver': (context) => SignUp(),
      // },
      home: Scaffold(
        //blue BG (comment the line below if you want white bg)
        //backgroundColor: Color(0xff0984E3),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Top text
            Center(
              child: Text(
                'Hi, Welcome to Foodonation',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w700,
                  //Black Text
                  color: Color(0xff2D3436),
                  //White text
                  //color: Color(0xffFFFFFF),
                ),
              ),
            ),

            //Logo image
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                ),
              ),
            ),

            //Description
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Text(
                  'The ultimate food app\nfor the hungry',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w300,
                    color: Color(0xff2D3436),
                  ),
                ),
              ),
            ),

            ButtonTheme(
              minWidth: devSize.width * 0.75,
              height: 48,
              child: RaisedButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                color: Color(0xff0984e3),
                child: Text(
                  'Let\'s get started',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 15,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var status = prefs.getBool('isLoggedIn') ?? false;
                  print(status);
                  if (status) {
                    // final FirebaseAuth _auth = FirebaseAuth.instance;
                    // FirebaseUser user;

                    // initUser() async {
                    //   user = await _auth.currentUser();
                    // }

                    // void initState() {
                    //   initUser();
                    // }

                    //user logged in, then go to homescreen
                    WarningAlertBox(
                        context: context,
                        title: "wait!",
                        messageText:
                            "You're already logged into another account! please signout before proceeding!");
                  } else {
                    //user not logged in, then go to pageone
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          //builder: (context) => OverviewScreen(user),
                          builder: (context) => PageOne()
                          //name: userName,
                          ),
                    );
                  }
                },
                //onPressed: () => Navigator.pushNamed(context, '/PageOne'),
              ),
            ),

            //Button
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ButtonTheme(
                minWidth: devSize.width * 0.75,
                height: 48,
                child: RaisedButton(
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Color(0xff0984e3),
                  child: Text(
                    'Already Signed in? Go to your account.',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 15,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    var status = prefs.getBool('isLoggedIn') ?? false;
                    print(status);
                    if (status) {
                      // final FirebaseAuth _auth = FirebaseAuth.instance;
                      // FirebaseUser user;

                      // initUser() async {
                      //   user = await _auth.currentUser();
                      // }

                      // void initState() {
                      //   initUser();
                      // }

                      //user logged in, then go to homescreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //builder: (context) => OverviewScreen(user),
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } else {
                      //user not logged in, then go to pageone
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       //builder: (context) => OverviewScreen(user),
                      //       builder: (context) => PageOne()
                      //       //name: userName,
                      //       ),
                      // );
                      WarningAlertBox(
                          context: context,
                          title: "wait!",
                          messageText:
                              "You're not signed in..To create account or sign in tap the 'Let\'s get started' button!");
                    }
                  },
                  //onPressed: () => Navigator.pushNamed(context, '/PageOne'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
