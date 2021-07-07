  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:shop_app/providers/products_provider.dart';
  import 'package:shop_app/widgets/product_grid.dart';

  enum FilterOptions {
    Favorites, All
  }

  class ProductsOverviewScreen extends StatefulWidget {
    @override
    _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
  }

  class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
    var _showOnlyFavorites = false;

    @override
    Widget build(BuildContext context) {

      // final productsContainer = Provider.of<ProductsProvider>(context);

      return Scaffold(
          appBar: AppBar(
            title: Text("Shopping Now"),
            actions: [
              PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Favorites) {
                      // productsContainer.showFavoritesOnly();
                      _showOnlyFavorites = true;
                    } else {
                      // productsContainer.showAll();
                      _showOnlyFavorites = false;
                    }
                  });

                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Only Favorites"),
                    value: FilterOptions.Favorites,
                  ),
                  PopupMenuItem(
                    child: Text("Show All"),
                    value: FilterOptions.All,
                  ),
                ],
                icon: Icon(Icons.more_vert),
              )
            ],
          ),
          body: ProductGrid(_showOnlyFavorites));
    }
  }
