import 'package:flutter/material.dart';

class ShoppingItem {
  final String category;
  final String name;
  final String quantity;

  ShoppingItem({@required this.category, @required this.name, this.quantity});

  @override
  String toString() {
    return 'ShoppingItem{category: $category, name: $name, quantity: $quantity}';
  }
}