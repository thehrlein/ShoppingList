import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/shopping/shopping_list_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';

class ShoppingList {
  final List<ShoppingListItem> items;

  ShoppingList({this.items});

  @override
  String toString() {
    return 'ShoppingList{items: $items}';
  }
}