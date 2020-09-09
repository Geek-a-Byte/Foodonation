import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class OverviewScreen extends StatelessWidget {
  String user = '';

  OverviewScreen(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          new Container(
            margin: EdgeInsets.only(top: 185),
            //padding: EdgeInsets.only(top: 15),
            child: ProductsGrid(),
          ),
          new Container(
            height: 185,
            width: MediaQuery.of(context)
                .size
                .width, //Gets the width of the screen
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
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
              padding: EdgeInsets.only(left: 25, top: 80),
              child: Row(
                children: [
                  Text(
                    'Hi! $user',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 130, top:10),
                    child: IconButton(
                      iconSize: 35,
                      ///right icon
                      icon: Icon(Icons.menu),
                      onPressed: () {},   //Menu bar
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
