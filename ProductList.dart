import 'package:flutter/material.dart';
import 'product.dart';

class ProductList extends StatefulWidget {
  final Function addToCheckout;

  ProductList({required this.addToCheckout});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Product> products = [
    Product(id: '1', name: 'Product 1', price: 29.99),
    Product(id: '2', name: 'Product 2', price: 49.99),
    Product(id: '3', name: 'Product 3', price: 19.99),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
          trailing: ElevatedButton(
            onPressed: () => widget.addToCheckout(product),
            child: Text('Add to Checkout'),
          ),
        );
      },
    );
  }
}
