import 'package:flutter/material.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/shopping/shopping_list_item.dart';

class ShoppingListHeaderItem implements ShoppingListItem {

  final Category category;

  ShoppingListHeaderItem({@required this.category});

  @override
  String toString() {
    return 'ShoppingListHeaderItem{category: $category}';
  }
}