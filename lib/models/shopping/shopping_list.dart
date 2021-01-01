import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';

class ShoppingList {
  final Map<Category, List<ShoppingListValueItem>> items;

  ShoppingList({this.items});

  @override
  String toString() {
    return 'ShoppingList{items: $items}';
  }
}