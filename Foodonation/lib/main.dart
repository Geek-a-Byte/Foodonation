import 'package:Foodonation/PageOne.dart';
import 'package:Foodonation/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:Foodonation/SignUp.dart';
//import 'package:Foodonation/dashboard.dart';
import 'package:Foodonation/signin.dart';

import 'PageTwo.dart';
//import 'package:Foodonation/splashscreen.dart';
//import 'package:Foodonation/settings.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   MyApp({Key key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme:
//       //     ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
//       initialRoute: '/',
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/': (context) => SignUp(),
//         // When navigating to the "/second" route, build the SecondScreen widget.
//         '/SignUp': (context) => SignUp(),
//         //'/dashboard': (context) => DashBoard(),
//         '/signin': (context) => SignIn(),
//       },
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

void main() => runApp(FoodonationApp());

class FoodonationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/PageOne': (context) => PageOne(),
        '/PageTwo': (context) => PageTwo(),
        '/SignUp': (context) => SignUp(),
        //'/dashboard': (context) => DashBoard(),
        '/signin': (context) => SignIn(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
