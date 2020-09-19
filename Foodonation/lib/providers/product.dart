import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageURL;
  Color iconColor;
  bool isChecked;
  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageURL,
    this.isChecked = false,
    this.iconColor = Colors.blue,
  });

  void toggleFavouriteStatus() {
    isChecked = !isChecked;
    if (iconColor == Colors.blue)
      iconColor = Colors.greenAccent;
    else
      iconColor = Colors.blue;
    notifyListeners();
  }
}
