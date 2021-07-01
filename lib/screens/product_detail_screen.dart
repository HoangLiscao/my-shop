
  import 'package:flutter/material.dart';

  class ProductDetailScreen extends StatelessWidget {
    static const routeName = "/product-detail";

    @override
    Widget build(BuildContext context) {
      final routerArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      final productId = routerArgs["id"] as String;
      final productName = routerArgs["title"] as String;
      final imageUrl = routerArgs["imageUrl"] as String;

      return Scaffold(
        appBar: AppBar(title: Text(productName),),
      );
    }
  }
