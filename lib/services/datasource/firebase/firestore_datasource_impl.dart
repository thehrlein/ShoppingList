import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/app/utils/constants.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/models/shopping/shopping_item.dart';
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
  final StreamController<ShoppingList> _shoppingListController =
      StreamController.broadcast();

  Stream get menuStream => _menuPlanController.stream;

  Stream get shoppingStream => _shoppingListController.stream;

  FirestoreDatasourceImpl() {
    menuRef = firestore.collection(Constants.COLLECTION_MENU);
    shoppingListRef = firestore.collection(Constants.COLLECTION_SHOPPING_LIST);
    categoryRef = firestore.collection(Constants.COLLECTION_CATEGORY);
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
  Future<List<ShoppingItem>> getShoppingSuggestions(String query) async {
    List<ShoppingItem> suggestions = List();
    QuerySnapshot querySnapshot = await shoppingListRef
        .doc(Constants.DOCUMENT_ALL)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String name = map[Constants.FIELD_NAME];
      String category = map[Constants.FIELD_CATEGORY] ?? "Allgemein";
      suggestions.add(ShoppingItem(category: category, name: name));
    });

    return suggestions;
  }

  @override
  Future<ShoppingList> getShoppingList() async {
    List<ShoppingItem> items = List();
    QuerySnapshot querySnapshot = await shoppingListRef
        .doc(Constants.DOCUMENT_ACTIVE)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String name = map[Constants.FIELD_NAME];
      String category = map[Constants.FIELD_CATEGORY] ?? "Allgemein";
      items.add(ShoppingItem(category: category, name: name));
    });

    return ShoppingList(items: items);
  }

  @override
  Stream<ShoppingList> getAndListenToShoppingList() {
    shoppingListRef
        .doc(Constants.DOCUMENT_ACTIVE)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .snapshots()
        .listen((event) {
      List<ShoppingItem> items = List();
      event.docs.forEach((element) {
        Map<String, dynamic> map = element.data();
        String name = map[Constants.FIELD_NAME];
        String category = map[Constants.FIELD_CATEGORY] ?? "Allgemein";
        items.add(ShoppingItem(category: category, name: name));
      });
      _shoppingListController.add(ShoppingList(items: items));
    });
    return shoppingStream;
  }

  @override
  Future<void> saveShoppingItem(ShoppingItem shoppingItem) {
    return shoppingListRef
        .doc(Constants.DOCUMENT_ACTIVE)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .add({
      Constants.FIELD_CATEGORY: shoppingItem.category,
      Constants.FIELD_NAME: shoppingItem.name
    });
  }

  @override
  Future<void> removeShoppingItem(ShoppingItem shoppingItem) {
    // TODO: implement removeShoppingItem
    throw UnimplementedError();
  }
}
