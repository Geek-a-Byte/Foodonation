import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/overview_screen.dart';
import './screens/product_details_screen.dart';
import './providers/products_provider.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';

//void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  // //This is where username goes in
  // //final FirebaseUser user;
  // String name;
  // //
  // HomeScreen(String name) {
  //   this.name = name;
  // }

  @override
  //HomeScreen(userName);
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Food Donation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blue,
          fontFamily: 'HelveticaNeue',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: OverviewScreen(),
        routes: {
          /// must define it in main.dart..it reduced state management complexity!
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
