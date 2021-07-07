
  import 'package:flutter/material.dart';
import 'package:shop_app/data/productData.dart';
import 'package:shop_app/providers/productModel.dart';

  class ProductsProvider with ChangeNotifier {
    List<Product> _item = PRODUCT_DATA;

    List<Product> get items {
      return [..._item];
    }

    Product findProductById(String id) {
      return _item.firstWhere((element) => element.id == id);
    }

    addProduct() {
      // _item.add(value);
      notifyListeners();
    }
  }