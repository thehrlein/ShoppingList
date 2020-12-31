import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/models/shopping/shopping_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';

abstract class FirestoreDatasource {

  /// shopping list
  Future<List<ShoppingItem>> getShoppingSuggestions(String query);
  Future<ShoppingList> getShoppingList();
  Stream<ShoppingList> getAndListenToShoppingList();
  Future<void> saveShoppingItem(ShoppingItem shoppingItem);
  Future<void> deleteShoppingItem(ShoppingItem shoppingItem);

  /// menu
  Future<MenuPlan> getMenuPlan();
  Stream<MenuPlan> getAndListenToMenuPlan();
  Future<void> saveDish(MenuPlanItem menuPlanItem);
  Future<void> deleteDish(MenuPlanDay day);

  /// categories
  Stream<Set<Category>> getAndListenToCategories();
  Future<void> saveCategory(Category category);
  Future<void> deleteCategory(Category category);
}