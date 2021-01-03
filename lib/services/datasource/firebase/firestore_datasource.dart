import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';

abstract class FirestoreDatasource {

  /// shopping list
  Future<List<ShoppingListValueItem>> getShoppingSuggestions(String query);
  Future<List<ShoppingListValueItem>> getShoppingList(String document);
  Stream<List<ShoppingListValueItem>> getAndListenToShoppingList(String document);
  Future<void> cancelStreamSubscription();
  Future<void> saveShoppingItem(ShoppingListValueItem shoppingItem);
  Future<void> deleteShoppingItem(ShoppingListValueItem shoppingItem);

  /// menu
  Future<MenuPlan> getMenuPlan();
  Stream<MenuPlan> getAndListenToMenuPlan();
  Future<void> saveDish(MenuPlanItem menuPlanItem);
  Future<void> deleteDish(MenuPlanDay day);

  /// categories
  Future<List<Category>> getCategories();
  Stream<Set<Category>> getAndListenToCategories();
  Future<void> saveCategory(Category category);
  Future<void> deleteCategory(Category category);
}