import 'package:flutter/material.dart';
import 'package:Foodonation/settings.dart';

import 'SignUp.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotosignup();
  }

  gotosignup() async {
    var abc = await getValue("isLoggedin");
    // if (abc == "true") {
    //   print(abc);
    //   Future.delayed(const Duration(milliseconds: 1500), () {
    //     Navigator.pushReplacementNamed(context, '/dashboard');
    //   });
    // } else {
    //   Future.delayed(const Duration(milliseconds: 1500), () {
    //     Navigator.pushReplacementNamed(context, '/SignUp');
    //   });
    // }

    if (abc == "true") {
      print(abc);
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacementNamed(context, '/SignUp');
      });
    }
  }

  Widget build(BuildContext context) {
    //Get device size
    Size devSize = MediaQuery.of(context).size;

    return MaterialApp(
      routes: {
        '/receiver': (context) => SignUp(),
      },
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

            //Button
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
                onPressed: () => Navigator.pushNamed(context, '/PageOne'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
