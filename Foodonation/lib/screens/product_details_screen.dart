import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments
        as String; // getting the id from the arguments
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    double descriptionLength = loadedProduct.description.length.toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),

              /// container for image
              //margin: EdgeInsets.only(top: 10),
              height: 300,
              width: double.infinity,
              //padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.network(
                loadedProduct.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'This Package Contains: ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              /// container for description
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: descriptionLength,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white70,
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                        fontFamily: 'HelveticaNeue',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
