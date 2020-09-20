import 'dart:convert';

import 'package:Foodonation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './product.dart';

class Products with ChangeNotifier {
  // Products() {
  //   loadProduct();
  // }
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Package - 01',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageURL:
          'https://www.goodyearhealth.com/wp-content/uploads/1470895393417.jpeg',
    ),
    Product(
      id: 'p2',
      title: 'Package - 02',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageURL:
          'https://economictimes.indiatimes.com/thumb/msid-74742498,width-1200,height-900,resizemode-4,imgsize-263761/rice-agencies.jpg?from=mdr',
    ),
    Product(
      id: 'p3',
      title: 'Package - 03',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageURL:
          'https://media.istockphoto.com/photos/raw-meat-assortment-beef-lamb-chicken-on-a-wooden-board-picture-id857308908?k=6&m=857308908&s=612x612&w=0&h=fj7W0EChgIrtQb5UVwKVPs7f7PlAM5_GRH21g2YU_X8=',
    ),
    Product(
      id: 'p4',
      title: 'Package - 04',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageURL:
          'https://www.helpguide.org/wp-content/uploads/table-with-grains-vegetables-fruit-768.jpg',
    ),
  ];

  void loadProduct() {
    this.addProduct(
      Product(
        id: 'p5',
        title: 'Package - 06',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        imageURL:
            'https://www.helpguide.org/wp-content/uploads/table-with-grains-vegetables-fruit-768.jpg',
      ),
    );
    notifyListeners();
  }

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    const url = 'https://foodonation-129a8.firebaseio.com/products.json';
    http
        .post(
      url,
      body: json.encode({
        'id': product.id,
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
        id: ('p' + (_items.length + 1).toString()),
      );
      _items.add(newProduct);
      notifyListeners();
    });
  }

  void changeStatus(String id) {
    findById(id).toggleFavouriteStatus();
  }
}
