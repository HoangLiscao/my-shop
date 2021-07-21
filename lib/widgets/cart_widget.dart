import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartWidget extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartWidget(this.id, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: true);

    return Dismissible(
      key: ValueKey(id),
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 20,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 30),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeItem(id);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Are you sure?"),
                  content: Text("Do you want to remove the item from the cart"),
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.of(context).pop(true);
                    }, child: Text("YES")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("NO"))
                  ],
                ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: FittedBox(child: Text("\$${price}")),
              ),
            ),
            title: Text(title),
            subtitle: Text("Total: \$${price * quantity}"),
            trailing: Text("$quantity x "),
          ),
        ),
      ),
    );
  }
}
