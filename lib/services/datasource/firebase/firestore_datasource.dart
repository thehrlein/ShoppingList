import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_type.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';

abstract class FirestoreDatasource {
  /// shopping list
  Future<List<ShoppingListValueItem>> getShoppingSuggestions(String query);

  Future<List<ShoppingListValueItem>> getShoppingList(String document);

  Stream<List<ShoppingListValueItem>> getAndListenToShoppingList(
      String document);

  void cancelShoppingStreamSubscription();

  Future<void> saveShoppingItem(ShoppingListValueItem shoppingItem);

  Future<void> editShoppingItem(ShoppingItemEditType editType,
      ShoppingListValueItem oldItem, ShoppingListValueItem newItem);

  Future<bool> deleteShoppingItem(
      ShoppingListValueItem shoppingItem, String document);

  /// menu
  Future<MenuPlan> getMenuPlan();

  Stream<MenuPlan> getAndListenToMenuPlan();

  void pauseMenuStreamSubscription();

  Future<void> saveDish(MenuPlanItem menuPlanItem);

  void saveNewMenuOrderedList(List<MenuPlanItem> items);

  Future<void> deleteDish(MenuPlanDay day);

  Future<List<Category>> getCategories();

  /// categories
  Stream<Set<Category>> getAndListenToCategories();

  Future<void> saveCategory(Category category);

  Future<void> deleteCategory(Category category);

  void cancelCategoryStreamSubscription();
}
