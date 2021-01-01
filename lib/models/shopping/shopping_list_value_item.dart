import 'package:flutter/material.dart';
import 'package:shopping_list/models/shopping/shopping_list_item.dart';

class ShoppingListValueItem implements ShoppingListItem {
  final String category;
  final String name;
  final String quantity;

  ShoppingListValueItem({@required this.name, this.category, this.quantity});

  @override
  String toString() {
    return 'ShoppingListValueItem{category: $category, name: $name, quantity: $quantity}';
  }
}