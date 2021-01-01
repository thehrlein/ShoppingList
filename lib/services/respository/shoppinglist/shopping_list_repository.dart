
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';

abstract class ShoppingListRepository {

  Future<List<ShoppingListValueItem>> getSuggestions(String query);
  Future<ShoppingList> getShoppingList();
  Stream<ShoppingList> getAndListenToShoppingList();
  Future<void> saveShoppingItem(ShoppingListValueItem shoppingItem);
  Future<void> deleteShoppingItem(ShoppingListValueItem shoppingItem);
}