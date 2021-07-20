import 'package:flutter/material.dart';
import 'package:shop_app/widgets/cart_widget.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartWidget> _items = {};

  Map<String, CartWidget> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  int get numberItemInCart {
    var number = 0;
    _items.forEach((key, element) {
      number += 1 * element.quantity;
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
      _items.update(
          productId,
          (exisingItem) => CartWidget(exisingItem.id, exisingItem.price,
              exisingItem.quantity + 1, exisingItem.title));
    } else {
      _items.putIfAbsent(productId,
          () => CartWidget(DateTime.now().toString(), price, 1, title));
    }
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }

    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartWidget(
            existingCartItem.id,
            existingCartItem.price,
            existingCartItem.quantity - 1,
            existingCartItem.title),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
