import 'dart:convert';

import 'package:Foodonation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './product.dart';

class Products with ChangeNotifier {
  // Products() {
  //   loadProduct();
  // }
  List<Product> _items = [];

  // void loadProduct() {
  //   // this.addProduct(
  //   //   Product(
  //   //     id: 'p1',
  //   //     title: 'Package - 01',
  //   //     description:
  //   //         '1. Rice(5 kg)\n2. Lentils(1 kg)\n3. Potato(2 kg)\n4. Soyabean Oil(1 Litre)\n5. Egg(1 dozen)\n6. Flattered Rice(1 kg)',
  //   //     imageURL: 'https://imgur.com/fy5oNRr.png',
  //   //   ),
  //   // );

  //   // this.addProduct(
  //   //   Product(
  //   //     id: 'p2',
  //   //     title: 'Package - 02',
  //   //     description:
  //   //         '1. Rice (5 kg)\n2. Lentils (1 kg)\n3. Egg (1 dogen)\n4. Soyabean Oil (1 Litre)\n5. Wheat (2 kg)',
  //   //     imageURL: 'https://imgur.com/JF9fuTx.png',
  //   //   ),
  //   // );

  //   // this.addProduct(
  //   //   Product(
  //   //     id: 'p3',
  //   //     title: 'Package - 03',
  //   //     description:
  //   //         '1. Whole Wheat Atta (2 kg)\n2. Potato (2 kg)\n3. Lentils (1 kg)\n 4. Soyabean Oil (1 Litre)\n5. Puffed Rice (1 kg)',
  //   //     imageURL: 'https://imgur.com/JFqcSqL.png',
  //   //   ),
  //   // );

  //   // this.addProduct(
  //   //   Product(
  //   //     id: 'p4',
  //   //     title: 'Package - 04',
  //   //     description:
  //   //         '1. Laal Shak (1 kg)\n2. Papaya (2 kg)\n3. Guava (1 kg)\n4. Lemon (Qtn: 4)\n5. Pui Shak (1 kg)\n6. Sugar (1 kg)\n7. Salt(1 kg)',
  //   //     imageURL: 'https://imgur.com/e1jFFiR.png',
  //   //   ),
  //   // );
  //   notifyListeners();
  // }

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Product product) async {
    const url = 'https://foodonation-129a8.firebaseio.com/products.json';
    try {
      final response = await http
          .post(
        url,
        body: json.encode({
          //'id': product.id,
          'title': product.title,
          'description': product.description,
          'imageURL': product.imageURL,
          //'iconColor': product.iconColor,
          'isChecked': product.isChecked,
        }),
      )
          .then((response) {
        final newProduct = Product(
          title: product.title,
          description: product.description,
          imageURL: product.imageURL,
          id: json.decode(response.body)['name'],
        );
        _items.add(newProduct);
        notifyListeners();
      });
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchAndSetProducts() async {
    const url = 'https://foodonation-129a8.firebaseio.com/products.json';
    try {
      final response = await http.get(url);

      ///print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Product> loadedProductsList = [];
      extractedData.forEach((prodId, prodData) {
        loadedProductsList.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          isChecked: prodData['isChecked'],
          imageURL: prodData['imageURL'],
        ));
      });
      _items = loadedProductsList;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void changeStatus(String id) {
    findById(id).toggleCheckStatus();
  }
}
