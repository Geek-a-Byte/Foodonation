// import 'package:Foodonation/signin.dart';
// import 'package:flutter/material.dart';
// import 'package:Foodonation/SignUp.dart';

// import 'PageTwo.dart';
// //import 'package:Foodonation/dashboard.dart';
// //import 'package:Foodonation/signin.dart';
// //import 'package:Foodonation/splashscreen.dart';
// //import 'package:Foodonation/settings.dart';

// void main() => runApp(PageOne());

// class PageOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         initialRoute: '/',
//         routes: {
//           '/PageOne': (context) => PageOne(),
//           '/PageTwo': (context) => PageTwo(),
//           '/SignUp': (context) => SignUp(),
//           '/signin': (context) => SignIn(),
//         },
//         home: MyHome());
//   }
// }

// class MyHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //Get device size
//     Size devSize = MediaQuery.of(context).size;
//     return Scaffold(
//       //blue BG (comment the line below if you want white bg)
//       //backgroundColor: Color(0xff0984E3),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           //Logo image
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 25.0),
//               child: Image.asset(
//                 'assets/images/logo.png',
//                 width: 80,
//               ),
//             ),
//           ),

//           //Top text
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 100.0),
//               child: Text(
//                 'Are you a donor or receiver?',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontFamily: 'HelveticaNeue',
//                   fontWeight: FontWeight.w700,
//                   //Black Text
//                   color: Color(0xff2D3436),
//                   //White text
//                   //color: Color(0xffFFFFFF),
//                 ),
//               ),
//             ),
//           ),

//           //Button Donor
//           ButtonTheme(
//               minWidth: devSize.width * .75,
//               height: 48,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: RaisedButton(
//                     textColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                     color: Color(0xff0984e3),
//                     child: Text(
//                       'Donor',
//                       style: TextStyle(
//                         color: Color(0xffFFFFFF),
//                         fontSize: 15,
//                         fontFamily: 'HelveticaNeue',
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           //builder: (context) => OverviewScreen(user),
//                           builder: (context) => PageTwo(),
//                         ),
//                       );
//                     }
//                     //=> Navigator.pushNamed(context, '/PageTwo'),
//                     ),
//               )),

//           //Button Receiver
//           ButtonTheme(
//               minWidth: devSize.width * .75,
//               height: 48,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: RaisedButton(
//                   textColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                   ),
//                   color: Color(0xff0984e3),
//                   child: Text(
//                     'Receiver',
//                     style: TextStyle(
//                       color: Color(0xffFFFFFF),
//                       fontSize: 15,
//                       fontFamily: 'HelveticaNeue',
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   onPressed: () => Navigator.pushNamed(context, '/signin'),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }

import 'package:Foodonation/SignInNID.dart';
import 'package:Foodonation/signin.dart';
import 'package:flutter/material.dart';
import 'PageTwo.dart';
//import 'package:Foodonation/dashboard.dart';
//import 'package:Foodonation/signin.dart';
//import 'package:Foodonation/splashscreen.dart';
//import 'package:Foodonation/settings.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size devSize = MediaQuery.of(context).size;
    return Scaffold(
      //blue BG (comment the line below if you want white bg)
      //backgroundColor: Color(0xff0984E3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Logo image
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 80,
              ),
            ),
          ),

          //Top text
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Text(
                'Are you a donor or receiver?',
                style: TextStyle(
                  fontSize: 20,
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

          //Button Donor
          ButtonTheme(
              minWidth: devSize.width * .75,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RaisedButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Color(0xff0984e3),
                    child: Text(
                      'Donor',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 15,
                        fontFamily: 'HelveticaNeue',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //builder: (context) => OverviewScreen(user),
                          builder: (context) => PageTwo(),
                        ),
                      );
                    }
                    //=> Navigator.pushNamed(context, '/PageTwo'),
                    ),
              )),

          //Button Receiver
          ButtonTheme(
              minWidth: devSize.width * .75,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RaisedButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Color(0xff0984e3),
                    child: Text(
                      'Receiver',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 15,
                        fontFamily: 'HelveticaNeue',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //builder: (context) => OverviewScreen(user),
                          builder: (context) => SignInNID(),
                        ),
                      );
                    }),
              )),
        ],
      ),
    );
  }
}
