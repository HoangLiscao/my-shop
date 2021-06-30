import 'package:flutter/material.dart';
import 'package:shop_app/data/productData.dart';
import 'package:shop_app/models/productModel.dart';
import 'package:shop_app/widgets/ProductItem.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = PRODUCT_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Now"),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: loadedProducts.length,
          itemBuilder: (context, i) => ProductItem(loadedProducts[i].id, loadedProducts[i].title, loadedProducts[i].imageUrl),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 30)),
    );
  }
}
