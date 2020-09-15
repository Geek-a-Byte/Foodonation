import 'package:Foodonation/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class OverviewScreen extends StatelessWidget {
  // var user1;
  // OverviewScreen(FirebaseUser user) {
  //   user1 = user;
  // }
  //var user = "RoboCup";
  var user;
  //OverviewScreen(user);
  OverviewScreen(FirebaseUser userName, String un) {
     user = un;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
         // Important: Remove any padding from the ListView.
         padding: EdgeInsets.zero,
         children: <Widget>[
          DrawerHeader(
            child: Stack(children: <Widget>[
              Positioned(
                bottom: 15.0,
                left: 16.0,
                child:Text('Menu',
                  style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                    )
                  )
                ]
              ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
               //color: Colors.blueAccent,
          ),

          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('My Profile',style: TextStyle(fontSize: 16.0),),
            onTap: () {
               // Update the state of the app.
               // ...
             },
           ),
           
           ListTile(
            leading: Icon(Icons.history),
            title: Text('Order History',style: TextStyle(fontSize: 16.0),),
            onTap: () {
               // Update the state of the app.
               // ...
             },
           ),

           ListTile(
             leading: Icon(Icons.exit_to_app),
             title: Text('Log Out',style: TextStyle(fontSize: 16.0),),
             onTap: () {
               // Update the state of the app.
               // ...
             },
           ),

           ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Give Us Feedback',style: TextStyle(fontSize: 16.0),),
            onTap: () {
               // Update the state of the app.
               // ...
             },
           ),

         ]
        ),
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
                //padding: const EdgeInsets.symmetric(vertical: 28.0),

                // child: Row(
                //   children: [
                //     Text(
                //       'Hi! $user',
                //       style: TextStyle(
                //         fontSize: 35,
                //         fontFamily: 'Avenir',
                //         fontWeight: FontWeight.w700,
                //         color: Colors.white,
                //       ),
                //     ),
                //     Container(
                //       padding: EdgeInsets.only(left: 90, top: 10),
                //       child: IconButton(
                //         iconSize: 35,

                //         ///right icon
                //         icon: Icon(Icons.menu),
                //         onPressed: () {}, //Menu bar
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text(
                  'Hi! $user',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
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
