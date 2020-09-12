import 'package:flutter/material.dart';
// import 'package:Foodonation/SignUp.dart';
// import 'package:Foodonation/dashboard.dart';
// import 'package:Foodonation/signin.dart';
// import 'package:Foodonation/splashscreen.dart';
// import 'package:Foodonation/settings.dart';

import 'PageOne.dart';

class PageTwo extends StatelessWidget {
  void goback() => runApp(PageOne());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //blue BG (comment the line below if you want white bg)
        //backgroundColor: Color(0xff0984E3),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          //Logo image
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 80,
                ),
              ),
            ),
            //Contact us
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Text(
                  'Please contact us:',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    //Black Text
                    color: Color(0xff2D3436),
                    //White text
                    //color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),

            //Numbers
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80.0),
                child: Text(
                  '0192*******\n0171*******',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w400,
                    //Black Text
                    color: Color(0xff2D3436),
                    //White text
                    //color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),

            //Or Bkash this number
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  'or, Bkash this number',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    //Black Text
                    color: Color(0xff2D3436),
                    //White text
                    //color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),

            //Numbers II
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  '0192*******\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w400,
                    //Black Text
                    color: Color(0xff2D3436),
                    //White text
                    //color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),

            //Button Back
            ButtonTheme(
                minWidth: MediaQuery.of(context).size. width * .75,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Color(0xff0984e3),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 15,
                        fontFamily: 'HelveticaNeue',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/PageOne'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
