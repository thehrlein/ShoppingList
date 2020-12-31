import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/models/shopping/shopping_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';

abstract class FirestoreDatasource {

  Future<MenuPlan> getMenuPlan();
  Stream<MenuPlan> getAndListenToMenuPlan();
  Future<void> saveDish(MenuPlanItem menuPlanItem);
  Future<void> deleteDish(MenuPlanDay day);

  Future<List<ShoppingItem>> getShoppingSuggestions(String query);
  Future<ShoppingList> getShoppingList();
  Stream<ShoppingList> getAndListenToShoppingList();
  Future<void> saveShoppingItem(ShoppingItem shoppingItem);
  Future<void> removeShoppingItem(ShoppingItem shoppingItem);
}