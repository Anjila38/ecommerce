import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    int index =
        _cartItems.indexWhere((item) => item['name'] == product['name']);

    if (index != -1) {
      _cartItems[index]['quantity'] += 1;
    } else {
      var newProduct = {...product, 'quantity': 1};
      _cartItems.add(newProduct);
    }

    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    _cartItems.removeWhere((item) => item['name'] == product['name']);
    notifyListeners();
  }

  void increaseQuantity(Map<String, dynamic> product) {
    int index =
        _cartItems.indexWhere((item) => item['name'] == product['name']);
    if (index != -1) {
      _cartItems[index]['quantity'] += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(Map<String, dynamic> product) {
    int index =
        _cartItems.indexWhere((item) => item['name'] == product['name']);
    if (index != -1 && _cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity'] -= 1;
    } else {
      removeFromCart(product);
    }
    notifyListeners();
  }
}
