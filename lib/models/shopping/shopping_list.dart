import 'package:shopping_list/models/shopping/shopping_item.dart';

class ShoppingList {
  final List<ShoppingItem> items;

  ShoppingList({this.items});

  @override
  String toString() {
    return 'ShoppingList{items: $items}';
  }
}