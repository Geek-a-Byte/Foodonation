import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  void _setCheckStatus(bool newStatus) {
    isChecked = newStatus;
    notifyListeners();
  }

  void toggleFavouriteStatus() async {
    final temp = isChecked;
    isChecked = !isChecked;
    notifyListeners();
    final url = 'https://foodonation-129a8.firebaseio.com/products/$id.json';
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isChecked': isChecked,
        }),
      );
      if (response.statusCode >= 400) {
        _setCheckStatus(temp);
      }
    } catch (error) {
      _setCheckStatus(temp);
    }
  }
}
