import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageURL;
  String iconColor;
  bool isChecked;
  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageURL,
    this.isChecked = false,
    this.iconColor = 'default',
  });

  void toggleFavouriteStatus() {
    isChecked = !isChecked;
    if (iconColor == 'default')
      iconColor = 'green';
    else
      iconColor = 'default';
    notifyListeners();
  }
}
