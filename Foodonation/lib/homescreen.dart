import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/overview_screen.dart';
import './screens/product_details_screen.dart';
import 'package:Foodonation/providers/products_provider.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  //This is where username goes in
  final FirebaseUser user;

  HomeScreen({this.user});
  @override
  //HomeScreen(userName);
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Food Donation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blue,
          fontFamily: 'HelveticaNeue',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: OverviewScreen(user),
        routes: {
          /// must define it in main.dart..it reduced state management complexity!
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
