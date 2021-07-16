import 'package:flutter/material.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  int get numberItemInCart {
    var number = 0;
    _items.forEach((key, element) {
      number += 1*element.quantity;
    });
    return number;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, item) {
      total += (item.price * item.quantity);
    });
    return total;
  }

  void removeItem(String productId) {
    _items.removeWhere((key, item) => item.id == productId);
    notifyListeners();
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (exisingItem) => CartItem(exisingItem.id, exisingItem.price, exisingItem.quantity +1, exisingItem.title));
    } else {
      _items.putIfAbsent(productId, () => CartItem(DateTime.now().toString(), price, 1, title));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
