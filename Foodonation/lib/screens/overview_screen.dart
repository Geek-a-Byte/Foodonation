import 'package:Foodonation/User.dart';
import 'package:Foodonation/homescreen.dart';
import 'package:Foodonation/providers/products_provider.dart';
import 'package:Foodonation/signin.dart';
import 'package:Foodonation/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../screens/orders_screen.dart';
import 'package:popup_menu/popup_menu.dart';
import '../providers/products_provider.dart';

class OverviewScreen extends StatefulWidget {
  // var user1;
  // OverviewScreen(FirebaseUser user) {
  //   user1 = user;
  // }
  //var user = "RoboCup";

  // //OverviewScreen(name);

  // //get username => name;
  // OverviewScreen(String un) {
  //   user = un;
  // }

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  var _isInit = true;

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((_) {
  //     Provider.of<Products>(context).fetchAndSetProducts();
  //   });
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //Provider.of<Products>(context).fetchAndSetProducts();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
            // Important: Remove any padding from the ListView.

            children: <Widget>[
              //drawer
              DrawerHeader(
                child: Stack(children: <Widget>[
                  Positioned(
                      bottom: 15.0,
                      left: 16.0,
                      child: Text(
                        "${user?.displayName} ",
                        style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))
                ]),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                //color: Colors.blueAccent,
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text(
                  'My Profile',
                  style: TextStyle(fontSize: 16.0),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        //builder: (context) => OverviewScreen(user),
                        builder: (context) => User()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  'Order History',
                  style: TextStyle(fontSize: 16.0),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.of(context).pushNamed(OrdersScreen.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16.0),
                ),
                onTap: () async {
                  // Update the state of the app.
                  // ...

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('userPreference');
                  prefs.setBool('isLoggedIn', false);
                  await Future.delayed(Duration(seconds: 2));

                  Navigator.of(context).pushAndRemoveUntil(
                    // the new route
                    MaterialPageRoute(
                      builder: (BuildContext context) => SplashScreen(),
                    ),

                    // this function should return true when we're done removing routes
                    // but because we want to remove all other screens, we make it
                    // always return false
                    (Route route) => false,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text(
                  'Give Us Feedback',
                  style: TextStyle(fontSize: 16.0),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ]),
      ),
      body: Stack(
        children: [
          new Container(
              height: 185,
              width: MediaQuery.of(context)
                  .size
                  .width, //Gets the width of the screen
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                //Adding shadow to the blue bar
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: new Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .07,
                  top: 80,
                  right: MediaQuery.of(context).size.width * .07,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: Text(
                  //'Hi! $username',
                  'Hi! ${user?.displayName}',
                  //'Today\'s Menu',

                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),

              ///......will write the cart icon
              actions: <Widget>[
                Consumer<Cart>(
                  builder: (_, cart, ch) => Badge(
                    child: ch,
                    value: cart.itemCount.toString(),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.only(right: 20),
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                ),
              ],

              // actions: [
              //   Padding(
              //     padding: const EdgeInsets.only(right: 20.0),
              //     child: IconButton(
              //       iconSize: 30,

              //       ///right icon
              //       icon: Icon(Icons.menu),
              //       onPressed: () {}, //Menu bar
              //       color: Colors.white,
              //     ),
              //   ),
              // ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 185),
            //padding: EdgeInsets.only(top: 15),
            child: ProductsGrid(),
          ),
        ],
      ),
    );
  }
}
