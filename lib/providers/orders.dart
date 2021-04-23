import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/cart.dart';
import './cart.dart';

class OrdersItem {
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime dateTime;

  OrdersItem(
      {@required this.id,
      @required this.amount,
      @required this.product,
      @required this.dateTime});
}

class Orders with ChangeNotifier {
  final List<OrdersItem> _orders = [];

  List<OrdersItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrdersItem(
        id: DateTime.now().toString(),
        amount: total,
        product: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
