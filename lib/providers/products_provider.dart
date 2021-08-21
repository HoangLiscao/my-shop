
  import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/data/productData.dart';
import 'package:shop_app/providers/productModel.dart';
import 'package:http/http.dart' as http;

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

    addProduct(Product product) {
      const url = "https://flutter-shop-app-cc467-default-rtdb.asia-southeast1.firebasedatabase.app/products.json";
      http.post(Uri.parse(url), body: json.encode({
        "title": product.title,
        "description": product.description,
        "imageUrl": product.imageUrl,
        "price": product.price,
        "isFavourite":  product.isFavourite
      }));

      final newProduct = Product(DateTime.now().toString(), product.title, product.description, product.price, product.imageUrl);
      _item.add(newProduct);
      // _item.insert(0, newProduct)
      notifyListeners();
    }

    updateProduct(Product newProduct) {
      final productIndex = _item.indexWhere((element) => newProduct.id == element.id);
      if (productIndex >= 0) {
        _item[productIndex] = newProduct;
        notifyListeners();
      } else {
        _item.add(newProduct);
      }
    }

    deleteProduct(String id) {
      _item.removeWhere((element) => element.id == id);
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