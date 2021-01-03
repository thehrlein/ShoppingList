
import 'package:shopping_list/models/shopping/shopping_item_edit_model.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_type.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';

abstract class ShoppingListRepository {

  Future<List<ShoppingListValueItem>> getSuggestions(String query);
  Future<ShoppingList> getShoppingList(String document);
  Stream<ShoppingList> getAndListenToShoppingList(String document);
  Future<void> cancelStreamSubscription();
  Future<void> saveShoppingItem(ShoppingListValueItem shoppingItem);
  Future<void> editShoppingItem(ShoppingItemEditType editType, ShoppingListValueItem oldItem, ShoppingListValueItem newItem);
  Future<void> deleteShoppingItem(ShoppingListValueItem shoppingItem, String document);
}