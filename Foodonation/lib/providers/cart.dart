import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(
    String productId,
    String title,
    bool isChecked,
  ) {
    // if (_items.containsKey(productId)) {
    //   //change quantity
    //   _items.update(
    //     productId,
    //     (existingCartItem) => CartItem(
    //       id: existingCartItem.id,
    //       title: existingCartItem.title,
    //       quantity: existingCartItem.quantity + 1,
    //     ),
    //   );
    // } else {
    //   _items.putIfAbsent(
    //     productId,
    //     () => CartItem(
    //       id: DateTime.now().toString(),
    //       title: title,
    //       quantity: 1,
    //     ),
    //   );
    // }
    if (isChecked == true) {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: productId,
          title: title,
          quantity: 1,
        ),
      );
    } else {
      _items.removeWhere((key, value) => key == productId);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    //_items.remove(productId);
    _items.removeWhere((key, value) => key == productId);
    notifyListeners();
  }

  void clearCart() {
    //_items[i].id
    _items = {};
    notifyListeners();
  }
}
