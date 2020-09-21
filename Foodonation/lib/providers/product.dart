import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageURL;
  bool isChecked;
  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageURL,
    this.isChecked = false,
  });

  void toggleFavouriteStatus() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
