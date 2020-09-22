//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:Foodonation/PageOne.dart';
import 'package:Foodonation/homescreen.dart';
import 'package:Foodonation/screens/comment.dart';
import 'package:Foodonation/screens/product_details_screen.dart';
import 'package:Foodonation/splashscreen.dart';
import 'package:Foodonation/widgets/product_item.dart';
import 'package:Foodonation/widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:Foodonation/SignUp.dart';
import 'package:Foodonation/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'PageTwo.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import 'package:Foodonation/SignInNID.dart';

void main() => runApp(FoodonationApp());

class FoodonationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/PageOne': (context) => PageOne(),
          '/PageTwo': (BuildContext context) => PageTwo(),
          '/SignUp': (context) => SignUp(),
          //'/dashboard': (context) => DashBoard(),
          '/signin': (context) => SignIn(),
          '/SignInNID': (context) => SignInNID(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        });
  }
}
