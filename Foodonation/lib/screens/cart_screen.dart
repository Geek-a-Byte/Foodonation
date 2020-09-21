import 'dart:async';

import '../providers/cart.dart';
import '../providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../widgets/cart_item.dart';
import '../providers/products_provider.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _state = 0;

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total Selected Item',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      '${cartData.itemCount}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (ctx, i) => cartItem(
                cartData.items.values.toList()[i].id,
                cartData.items.values.toList()[i].title,
                cartData.items.keys.toList()[i],
              ),
            ),
          ),
          Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(15),
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    height: 50,
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: setUpButtonChild(),
                      onPressed: cartData.itemCount <= 0
                          ? null
                          : () {
                              setState(() async {
                                await Provider.of<Orders>(context,
                                        listen: false)
                                    .addOrder(
                                        cartData.items.values.toList(), 1);
                                cartData.items.values.toList().forEach(
                                    (element) => Provider.of<Products>(context,
                                            listen: false)
                                        .changeStatus(element.id));
                                cartData.clearCart();
                                if (_state == 0) {
                                  animateButton();
                                }
                              });
                            },
                      elevation: 5,
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Place Request",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
