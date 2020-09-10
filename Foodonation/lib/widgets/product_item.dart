import '../providers/product.dart';
import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageURL;
  // ProductItem(this.id, this.title, this.imageURL);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    String iconColor = product.iconColor;
    Color setIconColor = iconColor == 'default' //changing icon color
        ? Theme.of(context).accentColor
        : Colors.greenAccent;
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
        borderRadius: BorderRadius.circular(20),
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
            leading: IconButton(
              /// left icon
              icon: Icon(
                product.isChecked ? Icons.check_box : Icons.add_box,
                color: setIconColor,
              ),
              onPressed: () {
                product.toggleFavouriteStatus();
              },
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
