
  import 'package:flutter/material.dart';
import 'package:shop_app/data/productData.dart';
import 'package:shop_app/providers/productModel.dart';

  class ProductsProvider with ChangeNotifier {
    List<Product> _item = PRODUCT_DATA;
    // var _showFavoritesOnly = false;

    List<Product> get items {
      // if (_showFavoritesOnly) {
      //   return _item.where((element) => element.isFavourite == true).toList();
      // }
      return [..._item];
    }

    List<Product> get favoriteItems {
      return _item.where((element) => element.isFavourite == true).toList();
    }

    Product findProductById(String id) {
      return _item.firstWhere((element) => element.id == id);
    }

    addProduct() {
      // _item.add(value);
      notifyListeners();
    }

    // void showFavoritesOnly() {
    //   _showFavoritesOnly = true;
    //   notifyListeners();
    // }
    // void showAll() {
    //   _showFavoritesOnly = false;
    //   notifyListeners();
    // }

  }