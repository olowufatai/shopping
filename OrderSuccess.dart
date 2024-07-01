import 'package:flutter/material.dart';

class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Successful'),
      ),
      body: Center(
        child: Text(
          'Thank you for your order!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
