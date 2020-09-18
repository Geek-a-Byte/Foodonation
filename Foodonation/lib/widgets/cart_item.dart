import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../providers/products_provider.dart';

class cartItem extends StatelessWidget {
  final String id;
  final String title;
  final String productId;
  cartItem(
    this.id,
    this.title,
    this.productId,
  );
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
        Provider.of<Products>(context, listen: false).changeStatus(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(),
            title: Text(title),
            trailing: Text('1 x'),
          ),
        ),
      ),
    );
  }
}
