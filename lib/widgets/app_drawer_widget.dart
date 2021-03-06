
  import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';

  class AppDrawerWidget extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Drawer(child: Column(children: [
        AppBar(title: Text("Hello Friend!"),
        automaticallyImplyLeading: false,),
        Divider(),
        ListTile(leading: Icon(Icons.shop), title: Text("Shop"), onTap: () {
          Navigator.of(context).pushReplacementNamed("/");
        },),
        Divider(),
        ListTile(leading: Icon(Icons.payment), title: Text("Payment"), onTap: () {
          Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
        },),
        Divider(),
        ListTile(leading: Icon(Icons.edit), title: Text("Manage"), onTap: () {
          Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
        },)
      ],),);
    }
  }
