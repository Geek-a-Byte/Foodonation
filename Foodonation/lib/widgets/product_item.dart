import '../providers/product.dart';
import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageURL;
  // ProductItem(this.id, this.title, this.imageURL);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
      listen: false,
    ); // will not listen the updates from the providers everytime. only checkbox is wrapped with Consumer.
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.75),
            spreadRadius: 2,
            blurRadius: 12,
            offset: Offset(10, 12), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: GestureDetector(
            ///Gesture detector widget
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,

                /// simply navigate by the routeName created at 'product_details_screen.dart'
                arguments: product.id,

                /// as product id is unique..passed it as argument of pushNamed
              );
            },
            child: Image.network(
              ///Image is being proccessed here!
              product.imageURL,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            ///Image footer and Icon
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                /// left icon
                icon: Icon(
                  product.isChecked ? Icons.check_box : Icons.add_box,
                  color: product.iconColor,
                ),
                onPressed: () {
                  product.toggleFavouriteStatus();
                  cart.addItem(product.id, product.title, product.isChecked);
                },
              ),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Lato', fontSize: 20),
            ),
            trailing: IconButton(
              ///right icon
              icon: Icon(Icons.menu),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
