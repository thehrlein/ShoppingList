
import 'package:shopping_list/models/shopping/shopping_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';

abstract class ShoppingListRepository {

  Future<List<ShoppingItem>> getSuggestions(String query);
  Future<ShoppingList> getShoppingList();
  Stream<ShoppingList> getAndListenToShoppingList();
  Future<void> saveShoppingItem(ShoppingItem shoppingItem);
  Future<void> removeShoppingItem(ShoppingItem shoppingItem);
}