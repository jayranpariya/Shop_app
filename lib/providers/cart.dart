import 'dart:html';

import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalamount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (exisstingCartItem) => CartItem(
              id: exisstingCartItem.id,
              title: exisstingCartItem.title,
              quantity: exisstingCartItem.quantity + 1,
              price: exisstingCartItem.price));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  // void undo(String productId) {
  //   if (!_items.containsKey(productId)) {
  //     return;
  //   }
  //   if (_items[productId].quantity > 1) {
  //     _items.update(
  //       productId,
  //       (existingCartItem) => CartItem(
  //           id: existingCartItem.id,
  //           title: existingCartItem.title,
  //           quantity: existingCartItem.quantity - 1,
  //           price: existingCartItem.price),
  //     );
  //   } else {
  //     _items.remove(productId);
  //   }
  // }
}
