import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Foodonation/providers/products_provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    //double devWidth =  MediaQuery.of(context).size.width; //Gets device width
    ///provider already listened!
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 20,
      ),
      //padding: const EdgeInsets.all(30),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //wrapping with change notifier!
        //create: (c) => products[i],
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageURL, /// now i don't need these shit :)
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        ///this is grid of items...
        crossAxisCount: 1,
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 20,
        mainAxisSpacing: 25,
      ),

      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 400,
      //   mainAxisSpacing: 20,
      //   crossAxisSpacing: 20,
      //   childAspectRatio: 16 / 9,
      // ),
    );
  }
}
