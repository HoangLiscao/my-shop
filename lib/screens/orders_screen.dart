
  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:shop_app/widgets/app_drawer_widget.dart';
import 'package:shop_app/widgets/order_widget.dart';

  class OrdersScreen extends StatelessWidget {
    static const routeName = "/orders_screen";
    @override
    Widget build(BuildContext context) {
      final orderData = Provider.of<OrdersProvider>(context);

      return Scaffold(
        appBar: AppBar(title: Text("Your Orders"),),
        drawer: AppDrawerWidget(),
        body: ListView.builder(itemBuilder: (context, i) => OrderWidget(order: orderData.orders[i]), itemCount: orderData.orders.length,),
      );
    }
  }
