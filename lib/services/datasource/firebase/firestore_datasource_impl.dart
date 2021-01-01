import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/app/utils/constants.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/services/datasource/firebase/firestore_datasource.dart';

@Singleton(as: FirestoreDatasource)
class FirestoreDatasourceImpl implements FirestoreDatasource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference menuRef;
  CollectionReference shoppingListRef;
  CollectionReference categoryRef;

  final StreamController<MenuPlan> _menuPlanController =
      StreamController.broadcast();
  final StreamController<List<ShoppingListValueItem>> _shoppingListController =
      StreamController.broadcast();
  final StreamController<Set<Category>> _categoriesController =
      StreamController.broadcast();

  Stream get menuStream => _menuPlanController.stream;

  Stream get shoppingStream => _shoppingListController.stream;

  Stream get categoriesStream => _categoriesController.stream;

  FirestoreDatasourceImpl() {
    menuRef = firestore.collection(Constants.COLLECTION_MENU);
    shoppingListRef = firestore.collection(Constants.COLLECTION_SHOPPING_LIST);
    categoryRef = firestore.collection(Constants.COLLECTION_CATEGORIES);
  }

  @override
  Future<MenuPlan> getMenuPlan() async {
    List<MenuPlanItem> planItems = List();
    QuerySnapshot querySnapshot = await menuRef.get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String dish = map[Constants.FIELD_DISH];
      planItems.add(MenuPlanItem(day: element.id.getMenuPlanDay(), dish: dish));
    });

    return MenuPlan(plan: planItems);
  }

  @override
  Stream<MenuPlan> getAndListenToMenuPlan() {
    menuRef.snapshots().listen((event) {
      List<MenuPlanItem> planItems = List();
      event.docs.forEach((element) {
        Map<String, dynamic> map = element.data();
        String dish = map[Constants.FIELD_DISH];
        planItems
            .add(MenuPlanItem(day: element.id.getMenuPlanDay(), dish: dish));
      });
      _menuPlanController.add(MenuPlan(plan: planItems));
    });
    return menuStream;
  }

  @override
  Future<void> saveDish(MenuPlanItem menuPlanItem) {
    return menuRef.doc(menuPlanItem.day.toString()).set(
        {Constants.FIELD_DISH: menuPlanItem.dish}, SetOptions(merge: true));
  }

  @override
  Future<void> deleteDish(MenuPlanDay day) {
    return menuRef
        .doc(day.toString())
        .update({Constants.FIELD_DISH: FieldValue.delete()});
  }

  @override
  Future<List<ShoppingListValueItem>> getShoppingSuggestions(String query) async {
    List<ShoppingListValueItem> suggestions = List();
    QuerySnapshot querySnapshot = await shoppingListRef
        .doc(Constants.DOCUMENT_ALL)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String name = map[Constants.FIELD_NAME];
      String category = map[Constants.FIELD_CATEGORY] ?? "Allgemein";
      suggestions.add(ShoppingListValueItem(category: category, name: name));
    });

    return suggestions;
  }

  @override
  Future<List<ShoppingListValueItem>> getShoppingList() async {
    List<ShoppingListValueItem> items = List();
    QuerySnapshot querySnapshot = await shoppingListRef
        .doc(Constants.DOCUMENT_ACTIVE)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String name = map[Constants.FIELD_NAME];
      String category = map[Constants.FIELD_CATEGORY] ?? "Allgemein";
      items.add(ShoppingListValueItem(category: category, name: name));
    });

    return items;
  }

  @override
  Stream<List<ShoppingListValueItem>> getAndListenToShoppingList() {
    shoppingListRef
        .doc(Constants.DOCUMENT_ACTIVE)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .snapshots()
        .listen((event) {
      List<ShoppingListValueItem> items = List();
      event.docs.forEach((element) {
        Map<String, dynamic> map = element.data();
        String name = map[Constants.FIELD_NAME];
        String category = map[Constants.FIELD_CATEGORY] ?? "Allgemein";
        items.add(ShoppingListValueItem(category: category, name: name));
      });
      _shoppingListController.add(items);
    });
    return shoppingStream;
  }

  @override
  Future<void> saveShoppingItem(ShoppingListValueItem shoppingItem) {
    return shoppingListRef
        .doc(Constants.DOCUMENT_ACTIVE)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .add({
      Constants.FIELD_CATEGORY: shoppingItem.category,
      Constants.FIELD_NAME: shoppingItem.name
    });
  }

  @override
  Future<void> deleteShoppingItem(ShoppingListValueItem shoppingItem) async {
    var querySnapshot = await shoppingListRef
        .doc(Constants.DOCUMENT_ACTIVE)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .where(Constants.FIELD_NAME, isEqualTo: shoppingItem.name).get();
    querySnapshot.docs.forEach((element) {
      element.reference.delete();
    });
    return Future.value();
  }

  @override
  Stream<Set<Category>> getAndListenToCategories() {
    categoryRef.snapshots().listen((event) {
      List<Category> categories = List();
      event.docs.forEach((element) {
        Map<String, dynamic> map = element.data();
        String name = map[Constants.FIELD_NAME];
        categories.add(Category(name: name));
      });
      categories
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      _categoriesController.add(categories.toSet());
    });
    return categoriesStream;
  }

  @override
  Future<void> saveCategory(Category category) {
    return categoryRef.add({Constants.FIELD_NAME: category.name});
  }

  @override
  Future<void> deleteCategory(Category category) async {
    var querySnapshot = await categoryRef.where(Constants.FIELD_NAME, isEqualTo: category.name).get();
    querySnapshot.docs.forEach((element) {
      element.reference.delete();
    });
    return Future.value();
  }
}
