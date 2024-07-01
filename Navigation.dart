import 'package:flutter/material.dart';
import 'package:shopping_app/ProductList.dart';

import 'checkout.dart';
import 'product.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  List<Product> _checkoutItems = [];

  void _addToCheckout(Product product) {
    setState(() {
      _checkoutItems.add(product);
    });
  }

  void _removeFromCheckout(Product product) {
    setState(() {
      _checkoutItems.remove(product);
    });
  }

  static List<Widget> _widgetOptions = [];

  @override
  void initState() {
    _widgetOptions = <Widget>[
      ProductList(addToCheckout: _addToCheckout),
      Checkout(
          checkoutItems: _checkoutItems,
          removeFromCheckout: _removeFromCheckout),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
