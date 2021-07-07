import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/productData.dart';
import 'package:shop_app/providers/productModel.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  // final List<Product> loadedProducts = PRODUCT_DATA;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final products = productData.items;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, i) => ChangeNotifierProvider(
              create: (context) => products[i],
              child: ProductItem(
                  // products[i].id, products[i].title, products[i].imageUrl
              ),
            ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30));
  }
}
