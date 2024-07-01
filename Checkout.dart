import 'package:flutter/material.dart';
import 'package:shopping_app/OrderSuccess.dart';
import 'product.dart';

class Checkout extends StatelessWidget {
  final List<Product> checkoutItems;
  final Function removeFromCheckout;

  Checkout({required this.checkoutItems, required this.removeFromCheckout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: checkoutItems.length,
            itemBuilder: (context, index) {
              final item = checkoutItems[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('\$${item.price}'),
                trailing: ElevatedButton(
                  onPressed: () => removeFromCheckout(item),
                  child: Text('Remove'),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderSuccess()),
            );
          },
          child: Text('Order Now'),
        ),
      ],
    );
  }
}
